function allDataCheckChange(app) 
    value = app.allDataCheck.Value;
    if value == 1 
        app.hipLDataCheck.Value = 1;
        app.hipLDataCheck.Enable = "off";
        app.hipRDataCheck.Value = 1;
        app.hipRDataCheck.Enable = "off";
        app.ankleLDataCheck.Value = 1;
        app.ankleLDataCheck.Enable = "off";
        app.ankleRDataCheck.Value = 1;
        app.ankleRDataCheck.Enable = "off";
        app.kneeLDataCheck.Value = 1;
        app.kneeLDataCheck.Enable = "off";
        app.kneeRDataCheck.Value = 1;
        app.kneeRDataCheck.Enable = "off";
        app.timeDataCheck.Value = 1;
        app.timeDataCheck.Enable = "off";
    end
    
    if value == 0 
        refreshDataCheckboxes(app)
    end
end