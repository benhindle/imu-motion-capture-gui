function unilateralRCheckChange(app)
    value = app.allUnilateralRCheck.Value;
    if value == 1 
        app.allBilateralCheck.Value = 0;
        app.allBilateralCheck.Enable = "off";
        app.allUnilateralLCheck.Value = 0;
        app.allUnilateralLCheck.Enable = "off";
        app.hipUnilateralLCheck.Value = 0;
        app.hipUnilateralLCheck.Enable = "off";
        app.hipUnilateralRCheck.Value = 1;
        app.hipUnilateralRCheck.Enable = "off";
        app.hipBilateralCheck.Value = 0;
        app.hipBilateralCheck.Enable = "off";
        app.ankleUnilateralLCheck.Value = 0;
        app.ankleUnilateralLCheck.Enable = "off";
        app.ankleUnilateralRCheck.Value = 1;
        app.ankleUnilateralRCheck.Enable = "off";
        app.ankleBilateralCheck.Value = 0;
        app.ankleBilateralCheck.Enable = "off";
        app.kneeUnilateralLCheck.Value = 0;
        app.kneeUnilateralLCheck.Enable = "off";
        app.kneeUnilateralRCheck.Value = 1;
        app.kneeUnilateralRCheck.Enable = "off";
        app.kneeBilateralCheck.Value = 0;
        app.kneeBilateralCheck.Enable = "off";
    end
    if value == 0
        refreshPlotCheckboxes(app)
    end
end