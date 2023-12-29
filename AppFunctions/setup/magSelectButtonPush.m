function magSelectButtonPush(app, event)
    f = figure('Renderer', 'painters', 'Position', [-100 -100 0 0]); %create a dummy figure  -> prevents presentation of figure behind 
    [mf, mp] = uigetfile('*.csv', 'MultiSelect', 'on');
    
    if isequal(mf, 0) || isequal(mp, 0)
        return
    else 
        app.calibMagFiles = mf;
        app.calibMagPaths = mp;
    end
    
    % gets file/path where only one selected
     [app.calibMagFile, app.calibMagPath] = getFirstDirectory(app.calibMagFiles, app.calibMagPaths);
    
    delete(f); %delete the dummy figure -> prevents presentation of figure behind 
    figure(app.UIFigure);  %-> prevents presentation of figure behind 
    app.magCalibTextArea.Value = append(app.calibMagPaths, app.calibMagFiles);
    
    app.calibMagNames = [app.calibMagFiles];
end