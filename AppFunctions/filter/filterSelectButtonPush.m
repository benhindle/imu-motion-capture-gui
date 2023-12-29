function filterSelectButtonPush(app,event)
    f = figure('Renderer', 'painters', 'Position', [-100 -100 0 0]); %create a dummy figure  -> prevents presentation of figure behind             
    [app.filterFile, app.filterPath] = uigetfile('*.mat');
    
    if isequal(app.filterFile,0)
        disp('User selected Cancel');
    end
    
    delete(f); %delete the dummy figure -> prevents presentation of figure behind 
    figure(app.UIFigure);  %-> prevents presentation of figure behind 
    app.filterSelectField.Value = fullfile(app.filterPath, app.filterFile);
end