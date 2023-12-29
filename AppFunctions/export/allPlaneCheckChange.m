function allPlaneCheckChange(app,event) 
    value = app.allPlaneCheck.Value;
    if value == 1 
        app.sagittalCheck.Value = 1;
        app.transverseCheck.Value = 1;
        app.frontalCheck.Value = 1;
        app.sagittalCheck.Enable = "off";
        app.transverseCheck.Enable= "off";
        app.frontalCheck.Enable = "off";
    else
        app.sagittalCheck.Value = 0;
        app.transverseCheck.Value = 0;
        app.frontalCheck.Value = 0;
        app.sagittalCheck.Enable = "on";
        app.transverseCheck.Enable= "on";
        app.frontalCheck.Enable = "on";
    end
end