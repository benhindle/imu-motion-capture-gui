function trialButtonPush(app,event)
    f = figure('Renderer', 'painters', 'Position', [-100 -100 0 0]); %create a dummy figure  -> prevents presentation of figure behind 
    [tf, tp] = uigetfile('*.csv', 'MultiSelect', 'on');

    if isequal(tf,0) || isequal(tp,0)
        return
    else 
        app.trialFiles = tf;
        app.trialPaths = tp;
    end
    
    % gets file/path where only one selected
     [app.trialFile, app.trialPath] = getFirstDirectory(app.trialFiles, app.trialPaths);
    
    delete(f); %delete the dummy figure -> prevents presentation of figure behind 
    figure(app.UIFigure);  %-> prevents presentation of figure behind 
    app.trialTextArea.Value = append(app.trialPaths, app.trialFiles);

    %% IF CAPTURE-U DATA COLLECTION
    if app.methodDropDown.Value == "IMeasureU" 
        for n = 1:length(app.trialFiles)
            if contains(app.trialFiles(n), "_")
             idFileType = split(app.trialFiles(n), "_");
             id = split(idFileType(2), ".");
             app.sensorIds = [app.sensorIds, id(1)];   
            end
        end
    
        app.dropdowns = [app.imuBaseDropDown, app.imuPelvisDropDown, app.imuThighLDropDown, app.imuThighRDropDown, app.imuShankLDropDown, app.imuShankRDropDown, app.imuFootLDropDown, app.imuFootRDropDown];
        for n = 1:length(app.dropdowns)
            if ~isempty(app.sensorIds)
                app.dropdowns(n).Items = app.sensorIds;
                app.dropdowns(n).Enable = "on";    
            end
        end
    
        app.trialNames = [app.trialFiles];
        
    %% IF VICON DATA COLLECTION
    else
        app.sensorIds = ["none"];
        app.dropdowns = [app.viconBaseDropDown, app.viconPelvisDropDown, app.viconThighLDropDown, app.viconThighRDropDown, app.viconShankLDropDown, app.viconShankRDropDown, app.viconFootLDropDown, app.viconFootRDropDown];
        for n = 1:length(app.dropdowns)
            app.dropdowns(n).Items = ["none"];
            app.dropdowns(n).Enable = "off";    
        end
    
        filePath="";
        if (iscell(app.trialFiles))
            filePath = strcat(app.trialPaths, char(app.trialFiles(1)) );   
        else
            filePath = strcat(app.trialPaths, app.trialFiles ); 
        end
        
        opts = detectImportOptions(filePath);
        app.tableData = readtable(filePath, opts);
        headers = app.tableData.Properties.VariableNames;
        app.tableData = rmmissing(app.tableData);
        headers = headers(3 : 3 : end);

        for n = 1:length(headers)
            splitHeader = split(headers(n), "_");
            if ~strcmp(app.sensorIds, splitHeader(1))
                app.sensorIds = [app.sensorIds, splitHeader(1)];
            end
        end
        
        app.sensorIds = sort(app.sensorIds);
        
        app.dropdowns = [app.viconBaseDropDown, app.viconPelvisDropDown, app.viconThighLDropDown, app.viconThighRDropDown, app.viconShankLDropDown, app.viconShankRDropDown, app.viconFootLDropDown, app.viconFootRDropDown];
        for n = 1:length(app.dropdowns)
            if ~isempty(app.sensorIds)
                app.dropdowns(n).Items = app.sensorIds;
                app.dropdowns(n).Enable = "on";
            end
        end
    end
end