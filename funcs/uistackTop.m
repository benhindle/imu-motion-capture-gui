function uistackTop(~, appfig, obj)
    % Place the UI object 'obj' on top of stack in the UIfigure 'appfig'

    appHandles = appfig.Children;       % list all handles in app
    hIdx = find(appHandles==obj);       % find index of obj in appHandles
    % Create new index order of app handles
    newOrder = [hIdx,setdiff(1:numel(appHandles),hIdx)]; 
    % assign new stack order to app
    appfig.Children = appHandles(newOrder);
end
