function calibrationButtonChange(app)

    selectedButton = app.calibDurationRadio.SelectedObject;
    if selectedButton == app.calibEntireRadioButton
        app.calibEndTimeHH.Enable = "off";
        app.calibEndTimeHH.Editable= "off";
        app.calibEndTimeMM.Enable = "off";
        app.calibEndTimeMM.Editable= "off";
        app.calibEndTimeSS.Enable = "off";
        app.calibEndTimeSS.Editable= "off";
        app.calibEndTimess.Enable = "off";
        app.calibEndTimess.Editable= "off";
        app.calibStartTimeHH.Enable = "off";
        app.calibStartTimeHH.Editable= "off";
        app.calibStartTimeMM.Enable = "off";
        app.calibStartTimeMM.Editable= "off";
        app.calibStartTimeSS.Enable = "off";
        app.calibStartTimeSS.Editable= "off";
        app.calibStartTimess.Enable = "off";
        app.calibStartTimess.Editable= "off";
        app.calibStartLabel.Enable= "off";
        app.calibEndLabel.Enable= "off";
        app.calibStartFrameText.Enable = "off";
        app.calibEndFrameText.Enable = "off";
        app.calibDurationUnits.Enable = "off";
    end

    if selectedButton == app.calibSelectRadioButton
        app.calibEndTimeHH.Enable = "on";
        app.calibEndTimeHH.Editable= "on";
        app.calibEndTimeMM.Enable = "on";
        app.calibEndTimeMM.Editable= "on";
        app.calibEndTimeSS.Enable = "on";
        app.calibEndTimeSS.Editable= "on";
        app.calibEndTimess.Enable = "on";
        app.calibEndTimess.Editable= "on";
        app.calibStartTimeHH.Enable = "on";
        app.calibStartTimeHH.Editable= "on";
        app.calibStartTimeMM.Enable = "on";
        app.calibStartTimeMM.Editable= "on";
        app.calibStartTimeSS.Enable = "on";
        app.calibStartTimeSS.Editable = "on";
        app.calibStartTimess.Enable= "on";
        app.calibStartTimess.Editable= "on";
        app.calibStartLabel.Enable= "on";
        app.calibEndLabel.Enable = "on";
        app.calibStartFrameText.Enable = "on";
        app.calibEndFrameText.Enable = "on";
        app.calibDurationUnits.Enable = "on";
        
    end
end