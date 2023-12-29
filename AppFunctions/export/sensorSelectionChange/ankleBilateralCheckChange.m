function ankleBilateralCheckChange(app)
    value = app.ankleBilateralCheck.Value;
    if value == 1
      app.allBilateralCheck.Value = 0;
        app.allBilateralCheck.Enable = "off";
        app.allUnilateralRCheck.Value = 0;
        app.allUnilateralRCheck.Enable = "off";
        app.allUnilateralLCheck.Value = 0;
        app.allUnilateralLCheck.Enable = "off";
        app.hipUnilateralLCheck.Value = 0;
        app.hipUnilateralLCheck.Enable = "off";
        app.hipUnilateralRCheck.Value = 0;
        app.hipUnilateralRCheck.Enable = "off";
        app.hipBilateralCheck.Value = 0;
        app.hipBilateralCheck.Enable = "off";
        app.ankleUnilateralLCheck.Value = 1;
        app.ankleUnilateralLCheck.Enable = "off";
        app.ankleUnilateralRCheck.Value = 1;
        app.ankleUnilateralRCheck.Enable = "off";
        app.kneeUnilateralLCheck.Value = 0;
        app.kneeUnilateralLCheck.Enable = "off";
        app.kneeUnilateralRCheck.Value = 0;
        app.kneeUnilateralRCheck.Enable = "off";
        app.kneeBilateralCheck.Value = 0;
        app.kneeBilateralCheck.Enable = "off";  
    end
    
    if value == 0 
        refreshPlotCheckboxes(app)
    end
end