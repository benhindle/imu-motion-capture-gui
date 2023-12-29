function trialButtonChange(app)
    selectedButton = app.trialDurationRadio.SelectedObject;
    if selectedButton == app.trialEntiretrialButton
        app.trialStartTimeHH.Enable = "off";
        app.trialStartTimeHH.Editable= "off";
        app.trialStartTimeMM.Enable = "off";
        app.trialStartTimeMM.Editable= "off";
        app.trialStartTimeSS.Enable = "off";
        app.trialStartTimeSS.Editable= "off";
        app.trialStartTimess.Enable = "off";
        app.trialStartTimess.Editable= "off";
        app.trialEndTimeHH.Enable = "off";
        app.trialEndTimeHH.Editable= "off";
        app.trialEndTimeMM.Enable = "off";
        app.trialEndTimeMM.Editable= "off";
        app.trialEndTimeSS.Enable = "off";
        app.trialEndTimeSS.Editable= "off";
        app.trialEndTimess.Enable = "off";
        app.trialEndTimess.Editable= "off";
        app.trialStarttimeLabelTrial.Enable = "off";
        app.trialEndtimeLabel.Enable = "off";
        app.trialStartFrameText.Enable = "off";
        app.trialEndFrameText.Enable = "off";
        app.trialDurationUnits.Enable = "off";
        
        app.trialStartFrame = 0;
        app.trialEndFrame = 0;
    end
    
    if selectedButton == app.trialSelectStartEndButton
        app.trialStartTimeHH.Enable = "on";
        app.trialStartTimeHH.Editable= "on";
        app.trialStartTimeMM.Enable = "on";
        app.trialStartTimeMM.Editable= "on";
        app.trialStartTimeSS.Enable = "on";
        app.trialStartTimeSS.Editable= "on";
        app.trialStartTimess.Enable = "on";
        app.trialStartTimess.Editable= "on";
        app.trialEndTimeHH.Enable = "on";
        app.trialEndTimeHH.Editable= "on";
        app.trialEndTimeMM.Enable = "on";
        app.trialEndTimeMM.Editable= "on";
        app.trialEndTimeSS.Enable = "on";
        app.trialEndTimeSS.Editable= "on";
        app.trialEndTimess.Enable = "on";
        app.trialEndTimess.Editable= "on";
        app.trialStarttimeLabelTrial.Enable= "on";
        app.trialEndtimeLabel.Enable= "on";
        app.trialStartFrameText.Enable = "on";
        app.trialEndFrameText.Enable = "on";
        app.trialDurationUnits.Enable = "on";
    end
end