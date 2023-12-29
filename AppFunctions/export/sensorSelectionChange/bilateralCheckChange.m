function bilateralCheckChange(app)
    value = app.allBilateralCheck.Value;
    if value == 1 
        app.allUnilateralLCheck.Value = 1;
        app.allUnilateralLCheck.Enable = "off";
        app.allUnilateralRCheck.Value = 1;
        app.allUnilateralRCheck.Enable = "off";
        app.hipUnilateralLCheck.Value = 1;
        app.hipUnilateralLCheck.Enable = "off";
        app.hipUnilateralRCheck.Value = 1;
        app.hipUnilateralRCheck.Enable = "off";
        app.hipBilateralCheck.Value = 1;
        app.hipBilateralCheck.Enable = "off";
        app.ankleUnilateralLCheck.Value = 1;
        app.ankleUnilateralLCheck.Enable = "off";
        app.ankleUnilateralRCheck.Value = 1;
        app.ankleUnilateralRCheck.Enable = "off";
        app.ankleBilateralCheck.Value = 1;
        app.ankleBilateralCheck.Enable = "off";
        app.kneeUnilateralLCheck.Value = 1;
        app.kneeUnilateralLCheck.Enable = "off";
        app.kneeUnilateralRCheck.Value = 1;
        app.kneeUnilateralRCheck.Enable = "off";
        app.kneeBilateralCheck.Value = 1;
        app.kneeBilateralCheck.Enable = "off";
    end
    if value == 0
        refreshPlotCheckboxes(app)
    end
end