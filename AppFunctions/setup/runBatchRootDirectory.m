function runBatchRootDirectory(app)
    getJointsToAnalyse(app);
    
    app.UIAxes.Visible = "on";
    ph = patch(app.UIAxes,[0 0 0 0],[0 0 1 1],[209/255 209/255 214/255]);
    app.percentageCompleteLabel.Text = sprintf("Initializing...");
    app.percentageCompleteLabel.Visible = 1;
    totalCompletePercent = 0;
    
    ph.XData = [0 0/100 0/100 0]; 
    drawnow %update graphics
    
    app.legendArray = getMainplotLegend(app);
    app.debugTitle = "";
    
    dateFolderNames = getFolderNames(app, app.rootDirectoryPath);

    filelist = dir(fullfile(app.rootDirectoryPath, '**','*.csv'));  %get list of files and folders in any subfolder
    staticFilelist = dir(fullfile(app.rootDirectoryPath, '**','static*.csv'));
    magFilelist = dir(fullfile(app.rootDirectoryPath, '**','mag*.csv'));
    trialFileCount = length(filelist) - length(staticFilelist) - length(magFilelist);
    currentCount = 0;
    
    for date = 1 : length(dateFolderNames)
        dateDir = fullfile(app.rootDirectoryPath, dateFolderNames{date});
        participantFolderNames = getFolderNames(app, dateDir);
        for participant = 1 : length(participantFolderNames)
            participantDir = fullfile(dateDir, participantFolderNames{participant}, "IMU");

            %% find MAG CAL file
            magFileList = dir(fullfile(participantDir, 'mag*'));
            magFilePath = fullfile(participantDir, magFileList(1).name);
            opts = detectImportOptions(magFilePath);
            app.magCalTable = readtable(magFilePath, opts);
            app.magCalTable = rmmissing(app.magCalTable);
           
            %% find STATIC CAL file
            staticFileList = dir(fullfile(participantDir, 'static*'));
            staticFilePath = fullfile(participantDir, staticFileList(1).name);
            app.tempCalibStatFile = staticFilePath;
            
            %% for file in participantDir (if != STATIC || MAG CAL files)
            directoryFileList = dir(fullfile(participantDir, "*.csv"));
            participantFileCount = 0;
            for fileIndex= 1 : length(directoryFileList)
                if ~isequal(directoryFileList(fileIndex).name, staticFileList(1).name) && ~isequal(directoryFileList(fileIndex).name, magFileList(1).name)
                    participantFileCount = participantFileCount + 1;
                end
            end
            
            for file = 1 : length(directoryFileList)
                filePath = fullfile(participantDir, directoryFileList(file).name);
                app.trialPath = participantDir;
                
                if ~isequal(directoryFileList(file).name, staticFileList(1).name) && ~isequal(directoryFileList(file).name, magFileList(1).name)
                    %% process file in directory -> output as same filename with _output appended
                    fprintf("\n --- running script for participant %s... ---\n", char(participant))
                    fprintf("date: %s\n", dateFolderNames{date});
                    fprintf("static file: %s\n", staticFileList(1).name);
                    fprintf("mag file: %s\n", magFileList(1).name);
                    fprintf("trial file: %s\n", directoryFileList(file).name);
                    fprintf("participant: %s\n", participantFolderNames{participant})
                    app.mainFigures = [];
                    
                    dateCompletionString = sprintf("Date: %s", dateFolderNames{date});
                    trialCompletionString = sprintf("Trial %i of %i", file, participantFileCount);
                    participantCompletionString = participantFolderNames{participant};
                    
                    opts = detectImportOptions(filePath);
                    app.tableData = readtable(filePath, opts);
                    headers = app.tableData.Properties.VariableNames;
                    app.tableData = rmmissing(app.tableData);
                    
                    app.tempTrialFile = strcat(filesep, directoryFileList(file).name);
                    tableOut = table;
                    
                    for j = 1:length(app.joints)
                        jointCompletionString = sprintf("Joint %i of %i", char(j), length(app.joints));
                        completionString = sprintf("%s: / %s / %s / %s", dateCompletionString, participantCompletionString, trialCompletionString, jointCompletionString);
                        app.completionLabel.Text = completionString;
                        
                        %% UPDATE PERCENTAGE HERE
                         participantCompletePercent = currentCount / trialFileCount;
                        ph.XData = [0 participantCompletePercent participantCompletePercent 0]; 
                        app.percentageCompleteLabel.Text = sprintf("%d%s", round(participantCompletePercent * 100), "%");
                        drawnow %update graphics  
                        
                        app.plotfiletitle = split(directoryFileList(file).name, ".csv");
                        app.plotfiletitle = char(app.plotfiletitle{1});
                        app.plotJoint = app.joints(j);
                        
                        app.plotOutPath = participantDir;
                    
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
                        
                        for p = 1:length(app.planes)
                            title = sprintf('%s_%s', app.joints(j), app.planes(p) );
                            tableOut.(title) = app.outputJointAngle(:,p);
                        end
                        
                    end
                    
                   
                    fprintf("figure exported to: %s\n", app.plotOutPath)
                    currentCount = currentCount + 1;
                    
                    tableOut = movevars(tableOut, 'time', "Before", 1);
                    tableOut = movevars(tableOut, 'frame', "Before", 1);
                    exportfiletitle = split(directoryFileList(file).name, ".csv");
                    exportfiletitle = char(exportfiletitle{1});

                    disp(sprintf('length(tableOut.time) = %d', length(tableOut.time)))
                    app.dataOutPath = participantDir;

                    writetable(tableOut,...
                    sprintf('%s%s%s_output.xlsx', app.dataOutPath, filesep, exportfiletitle),...
                    "WriteMode", "overwritesheet");
                 end
            end
        end
    end
    ph.XData = [0 1 1 0]; 
    drawnow %update graphics  
    app.percentageCompleteLabel.Text = "complete!";
    disp("---- processing complete! ----")
end