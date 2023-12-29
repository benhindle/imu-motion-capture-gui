function calibStatButtonPush(app,event)
    f = figure('Renderer', 'painters', 'Position', [-100 -100 0 0]); %create a dummy figure  -> prevents presentation of figure behind 
    [sf, sp] = uigetfile('*.csv', 'MultiSelect', 'on');
    
    if isequal(sf,0) || isequal(sp,0)
        return
    else 
        app.calibStatFiles = sf;
        app.calibStatPaths = sp;
    end
    
    % gets file/path where only one selected
     [app.calibStatFile, app.calibStatPath] = getFirstDirectory(app.calibStatFiles, app.calibStatPaths);
    
    delete(f); %delete the dummy figure -> prevents presentation of figure behind 
    figure(app.UIFigure);  %-> prevents presentation of figure behind 
    app.calibStaticTextArea.Value = append(app.calibStatPaths, app.calibStatFiles);
end