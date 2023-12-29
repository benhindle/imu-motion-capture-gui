function rootDirectoryButtonPush(app,event)
    f = figure('Renderer', 'painters', 'Position', [-100 -100 0 0]); %create a dummy figure  -> prevents presentation of figure behind 
    directory = uigetdir;
    
    if isequal(directory,0)
        return
    else 
        app.rootDirectoryPath = directory;
    end
    
    delete(f); %delete the dummy figure -> prevents presentation of figure behind 
    figure(app.UIFigure);  %-> prevents presentation of figure behind 
    app.rootDirectoryDisplayPath.Value = app.rootDirectoryPath;
    
    %% pre-assign sensors
    app.sensorIds = ["none"];
        app.dropdowns = [app.viconBaseDropDown, app.viconPelvisDropDown, app.viconThighLDropDown, app.viconThighRDropDown, app.viconShankLDropDown, app.viconShankRDropDown, app.viconFootLDropDown, app.viconFootRDropDown];
        for n = 1:length(app.dropdowns)
            app.dropdowns(n).Items = ["none"];
            app.dropdowns(n).Enable = "off";    
        end
    
        dateFolderNames = getFolderNames(app, app.rootDirectoryPath);
    
        dateDir = fullfile(app.rootDirectoryPath, dateFolderNames{1});

        participantFolderNames = getFolderNames(app, dateDir);
        participantDir = fullfile(dateDir, participantFolderNames{1}, "IMU");

        %% find STATIC CAL file
        staticFileList = dir(fullfile(participantDir, 'static*'));
        staticFilePath = fullfile(participantDir, staticFileList(1).name);

        opts = detectImportOptions(staticFilePath);
        app.tableData = readtable(staticFilePath, opts);
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