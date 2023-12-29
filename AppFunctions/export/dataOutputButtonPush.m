function dataOutputButtonPush(app, event)
    f = figure('Renderer', 'painters', 'Position', [-100 -100 0 0]); %create a dummy figure  -> prevents presentation of figure behind 
    app.dataOutPath = uigetdir;
    delete(f); %delete the dummy figure -> prevents presentation of figure behind 
    figure(app.UIFigure);  %-> prevents presentation of figure behind 
    app.dataOutputDirectoryField.Value = app.dataOutPath;
end