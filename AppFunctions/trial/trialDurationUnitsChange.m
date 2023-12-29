function trialDurationUnitsChange(app,event)
    value = app.trialDurationUnits.Value;
    if value == "Frame"
        app.trialStartTimeHH.Visible = false;
        app.trialEndTimeHH.Visible = false;
        app.trialHHLabel.Visible = false;
        app.trialStartTimeMM.Visible = false;
        app.trialEndTimeMM.Visible = false;
        app.trialMMLabel.Visible = false;
        app.trialStartTimeSS.Visible = false;
        app.trialEndTimeSS.Visible = false;
        app.trialSSLabel.Visible = false;
        app.trialStartTimess.Visible = false;
        app.trialEndTimess.Visible = false;
        app.trialSsLabel.Visible = false;
        
        app.trialStarttimeLabelTrial.Text = "Start frame";
        app.trialEndtimeLabel.Text = "End frame";
        app.trialStartFrameText.Visible = true;
        app.trialEndFrameText.Visible = true;
        
        trialUpdateStartEndFrame(app)
    end
    
    if value == "Time"
        app.trialStartTimeHH.Visible = true;
        app.trialEndTimeHH.Visible = true;
        app.trialHHLabel.Visible = true;
        app.trialStartTimeMM.Visible = true;
        app.trialEndTimeMM.Visible = true;
        app.trialMMLabel.Visible = true;
        app.trialStartTimeSS.Visible = true;
        app.trialEndTimeSS.Visible = true;
        app.trialSSLabel.Visible = true;
        app.trialStartTimess.Visible = true;
        app.trialEndTimess.Visible = true;
        app.trialSsLabel.Visible = true;
        
        app.trialStarttimeLabelTrial.Text = "Start time";
        app.trialEndtimeLabel.Text = "End time";
        
        app.trialStartFrameText.Visible = false;
        app.trialEndFrameText.Visible = false;
        
        trialUpdateStartEndFrame(app)
    end
end