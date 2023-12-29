function plotOutputButtonPush(app, event)
    f = figure('Renderer', 'painters', 'Position', [-100 -100 0 0]); %create a dummy figure  -> prevents presentation of figure behind 
    app.plotOutPath = uigetdir;
    delete(f); %delete the dummy figure -> prevents presentation of figure behind 
    figure(app.UIFigure);  %-> prevents presentation of figure behind 
    app.plotOutputDirectoryField.Value = app.plotOutPath;
end