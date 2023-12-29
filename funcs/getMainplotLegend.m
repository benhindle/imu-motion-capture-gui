function legendArray = getMainplotLegend(app)
legendArray = [];
    noneSelected = app.allPlaneCheck.Value == 0 && app.sagittalCheck.Value == 0 && app.frontalCheck.Value ==  0 && app.transverseCheck.Value == 0;
    if app.allPlaneCheck.Value == 1 || noneSelected
       legendArray = ["Sagittal", "Frontal", "Transverse"];
    else
        if app.sagittalCheck.Value ==  1 
            legendArray = ["Sagittal"];
        end
        if app.frontalCheck.Value ==  1 
            legendArray = [legendArray, "Frontal"];
        end
        if app.transverseCheck.Value ==  1 
            legendArray = [legendArray, "Transverse"];
        end
    end
end