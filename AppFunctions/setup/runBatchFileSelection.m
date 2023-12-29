function runBatchFileSelection(app)
    checkSensors(app)
    
    if isequal(app.trialFiles, "") || isequal(app.trialPaths, "") || isequal(app.calibMagFiles, "") || isequal(app.calibMagPaths, "") || isequal(app.calibStatFiles, "") || isequal(app.calibStatPaths, "")
        return
    end
    
    app.UIAxes.Visible = "on";
    ph = patch(app.UIAxes,[0 0 0 0],[0 0 1 1],[209/255 209/255 214/255]);
    app.percentageCompleteLabel.Text = sprintf("Initializing...");
    app.percentageCompleteLabel.Visible = 1;
    totalCompletePercent = 0;
    
    ph.XData = [0 0/100 0/100 0]; 
    drawnow %update graphics  
    
    getJointsToAnalyse(app);
    
    app.legendArray = getMainplotLegend(app);
    
%   IMPLEMENT LOOP FOR SELECTED FILES (FOR PARTICIPANT -> FOR TRIAL)

    participants_ = containers.Map('KeyType','char','ValueType','any');
    
    if iscell(app.trialFiles)
        for tf = 1:length(app.trialFiles)
            splitArray = split(app.trialFiles(tf),"_");
            participant = splitArray{2};
            if ~isKey(participants_, participant)
                trialFile_ = app.trialFiles(tf);
                participants_(participant) = trialFile_{1};
            else 
                trialFile_ = app.trialFiles(tf);
                participants_(participant) = {participants_(participant), trialFile_{1}};
                
            end 
        end
    else
        splitArray = split(app.trialFiles,"_");
        participant = splitArray(2);
        trialFile_ = app.trialFiles;
        participants_(char(participant)) = trialFile_;
    end
    
    keys_ = keys(participants_);
    
    %-> for each participant
    for k=1:length(keys_)
        participantCompletionString = sprintf("Processing participant %i of %i", char(k), length(keys_));
        
        participant = keys_(k);
        partVals = participants_(participant{1});
        staticFile = "";
        magFile = "";
        
        %find dates associated with participant ->> for each date
        dates = containers.Map('KeyType','char','ValueType','any');
        if iscell(partVals)
            for pv = 1:length(partVals)
                
                val = partVals(pv);
                splitArray = split(char(val),"_");
                date = splitArray{4};
                date = split(date,".csv");
                date = date{1};
                
                if ~isKey(dates, date)
                    trialFile_ = partVals(pv);
                    dates(date) = {char(trialFile_)};
                else 
                    trialFile_ = partVals(pv);
                    dates(date) = {dates, char(trialFile_)};
                end 
            end
        else
            splitArray = split(partVals,"_");
            date = splitArray(4);
            date = split(date, ".csv");
            date = date{1};
            trialFile_ = partVals;
            dates(date) = char(trialFile_);
        end
        
        for kd=1:length(keys(dates))
            datekeys = keys(dates);
            date = datekeys{kd}; 
            
%           in app.trialFiles -> find all files where date==date
%           and participant ==participant -> leaving T01,T02 etc
            if iscell(app.trialFiles)
                trials = {};
                for trs=1:length(app.trialFiles)
                    if contains(app.trialFiles(trs), date) && contains(app.trialFiles(trs), char(participant))
                        trials(end+1) = app.trialFiles(trs);
                    end
                end
                
            else 
                trials = dates(date);
            end

            %find static file associated with participant && date
            staticFileIndex = find(contains(app.calibStatFiles,participant));
            magFileIndex = find(contains(app.calibMagFiles,participant));
            
            if iscell(app.calibMagFiles)
                staticFiles = app.calibStatFiles(staticFileIndex);
                staticFilesIndex = find(contains(staticFiles,date));  
                tempStatFile = char(staticFiles(staticFilesIndex));
            
                magFiles = app.calibMagFiles(magFileIndex);
                magFilesIndex = find(contains(magFiles,date));
                tempMagFile = char(magFiles(magFilesIndex)); 
                
            else
                tempStatFile = app.calibStatFiles;
                tempMagFile = app.calibMagFiles;   
            end
            
            magFilePath = strcat(app.calibMagPath, tempMagFile);
            opts = detectImportOptions(magFilePath);
            app.magCalTable = readtable(magFilePath, opts);
            app.magCalTable = rmmissing(app.magCalTable);
            
            app.tempCalibStatFile = tempStatFile;

            if iscell(trials)
                for fn=1:length(trials)
                    dateCompletionString = sprintf("Date: %s", date);
                    trialCompletionString = sprintf("Trial %i of %i", char(fn), length(trials));
                    
                    fprintf("\n --- running script for participant %s... ---\n", char(participant))
                    fprintf("date: %s\n", date);
                    fprintf("static file: %s\n", tempStatFile);
                    fprintf("mag file: %s\n", tempMagFile);
                    fprintf("trial file: %s\n", char(trials(fn)));   
                    app.mainFigures = [];
                    app.tempTrialFile = char(trials(fn));
                    
%                   // CREATE TABLE
                    tableOut = table;
                    
                    for j = 1:length(app.joints) 
                        jointCompletionString = sprintf("Joint %i of %i", char(j), length(app.joints));
                        completionString = sprintf("%s: / %s / %s / %s", participantCompletionString, dateCompletionString, trialCompletionString, jointCompletionString);
                        app.completionLabel.Text = completionString;
                        
                        %% UPDATE PERCENTAGE HERE
                        participantCompletePercent = ((k-1) / length(keys_)) + ( ((k-1) / length(keys_)) * ((kd-1) / length(keys(dates))) ) + ((1/length(keys_)) * ((kd-1) / length(keys(dates)))) + ( (1/length(keys_)) * (1/length(keys(dates))) * ((fn-1) / length(trials)) + ( (1/length(keys_)) * (1/length(keys(dates))) * (1/length(trials)) * ((j-1) / length(app.joints))) );
                        ph.XData = [0 participantCompletePercent participantCompletePercent 0]; 
                        app.percentageCompleteLabel.Text = sprintf("%d%s", round(participantCompletePercent * 100), "%");
                        drawnow %update graphics  
                        
                        app.plotfiletitle = split(char(trials(fn)), ".csv");
                        app.plotfiletitle = char(app.plotfiletitle(1));
                        app.plotJoint = app.joints(j);
                        app.debugTitle = app.plotfiletitle;
                        
                        appMainRun(app, app.joints(j));
                        if isequal(j,1)
                            tableOut.('time') = app.outputTime;    
                        end
                        
                        if isequal(app.settingsAutoRadio.SelectedObject.Text, "Manual")
                            app.continueButton.Visible = 1;
                            app.continueStatus = 0;
                            while(isequal(app.continueStatus, 0)) 
                                pause(1);
                            end
                        end
                        
                        tableOut.(app.joints(j)) = app.outputJointAngle;
                        fprintf("figure exported to: %s\n", app.plotOutPath)
                        
                        tableOut = movevars(tableOut, 'time', "Before", 1);
                        exportfiletitle = split(char(trials(fn)), ".csv");
                        exportfiletitle = char(exportfiletitle{1});
                        
                        if app.dataOutPath == "" 
                            writetable(tableOut,sprintf('%s.xlsx', exportfiletitle))
                        else 
                            writetable(tableOut,sprintf('%s%s%s.xlsx', app.dataOutPath, filesep, exportfiletitle))    
                        end
                            end
                        end  
                
            else
                fprintf("\n --- running script for participant %s... ---\n", char(participant))
                fprintf("date: %s\n", date);
                fprintf("static file: %s\n", tempStatFile);
                fprintf("mag file: %s\n", tempMagFile);
                fprintf("trial file: %s\n", char(trials));
                app.mainFigures = [];
                
                dateCompletionString = sprintf("Date: %s", date);
                trialCompletionString = sprintf("Trial 1 of 1");
                
                app.tempTrialFile = char(trials);
                tableOut = table;
                
                for j = 1:length(app.joints)
                    jointCompletionString = sprintf("Joint %i of %i", char(j), length(app.joints));
                    completionString = sprintf("%s: / %s / %s / %s", participantCompletionString, dateCompletionString, trialCompletionString, jointCompletionString);
                    app.completionLabel.Text = completionString;
                    
                    %% UPDATE PERCENTAGE HERE
                    participantCompletePercent = ((k-1) / length(keys_)) + ( ((k-1) / length(keys_)) * ((kd-1) / length(keys(dates))) ) + ((1/length(keys_)) * ((kd-1) / length(keys(dates)))) + ( (1/length(keys_)) * (1/length(keys(dates))) * ((j-1) / length(app.joints)) );
                    ph.XData = [0 participantCompletePercent participantCompletePercent 0]; 
                    app.percentageCompleteLabel.Text = sprintf("%d%s", round(participantCompletePercent * 100), "%");
                    drawnow %update graphics  
                    
                    app.plotfiletitle = split(char(trials), ".csv");
                    app.plotfiletitle = char(app.plotfiletitle{1});
                    app.plotJoint = app.joints(j);
                    
                    appMainRun(app, app.joints(j));
                    if isequal(j,1)
                        tableOut.('time') = app.outputTime;    
                        tableOut.('frame') = app.outputFrame;
                    end
                    
                    if isequal(app.settingsAutoRadio.SelectedObject.Text, "Manual")
                        app.continueButton.Visible = 1;
                        app.continueStatus = 0;
                        while(isequal(app.continueStatus, 0)) 
                            pause(1);
                        end
                    end
                    
                    tableOut.(app.joints(j)) = app.outputJointAngle;
                end
                fprintf("figure exported to: %s\n", app.plotOutPath)
                
                tableOut = movevars(tableOut, 'time', "Before", 1);
                tableOut = movevars(tableOut, 'frame', "Before", 1);
                exportfiletitle = split(char(trials), ".csv");
                exportfiletitle = char(exportfiletitle{1});
                
                if app.dataOutPath == "" 
                    writetable(tableOut,sprintf('%s.xlsx', exportfiletitle))
                else 
                    writetable(tableOut,sprintf('%s%s%s.xlsx', app.dataOutPath, filesep, exportfiletitle))    
                end
            end
        end
    end
    
    ph.XData = [0 1 1 0]; 
    drawnow %update graphics  
    app.percentageCompleteLabel.Text = sprintf("100%s", "%");
    disp("---- processing complete! ----")
end