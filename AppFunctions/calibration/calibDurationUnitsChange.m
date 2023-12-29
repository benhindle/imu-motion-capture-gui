function calibDurationUnitsChange(app,event)
    value = app.calibDurationUnits.Value;
    if value == "Frame"
        app.calibStartFrameText.Visible = true;
        app.calibEndFrameText.Visible = true;
        app.calibStartTimeHH.Visible = false;
        app.calibStartTimeMM.Visible = false;
        app.calibStartTimeSS.Visible = false;
        app.calibStartTimess.Visible = false;
        app.calibEndTimeHH.Visible = false;
        app.calibEndTimeMM.Visible = false;
        app.calibEndTimeSS.Visible = false;
        app.calibEndTimess.Visible = false;
        app.calibHHLabel.Visible = false;
        app.calibMMLabel.Visible = false;
        app.calibSSLabel.Visible = false;
        app.calibSsLabel.Visible = false;
        
        app.trialStartFrame = app.calibStartFrameText.Value;
        app.trialEndFrame = app.calibEndFrameText.Value;
        
        app.calibStartLabel.Text = "Start frame";
        app.calibEndLabel.Text = "End frame";
        
        calibUpdateStartEndFrame(app)
        
    elseif value == "Time"
        app.calibStartFrameText.Visible = false;
        app.calibEndFrameText.Visible = false;
        app.calibStartTimeHH.Visible = true;
        app.calibStartTimeMM.Visible = true;
        app.calibStartTimeSS.Visible = true;
        app.calibStartTimess.Visible = true;
        app.calibEndTimeHH.Visible = true;
        app.calibEndTimeMM.Visible = true;
        app.calibEndTimeSS.Visible = true;
        app.calibEndTimess.Visible = true;
        app.calibHHLabel.Visible = true;
        app.calibMMLabel.Visible = true;
        app.calibSSLabel.Visible = true;
        app.calibSsLabel.Visible = true;
        
        if isfield("app", "calibStartTimeSec") && ~isempty(app.calibEndTimeSec)
            app.calibStaticStartFrame = app.calibStartTimeSec * app.calibRateIn;
            app.calibStaticEndFrame = app.calibEndTimeSec * app.calibRateIn;    
        end
        
        app.calibStartLabel.Text = "Start time";
        app.calibEndLabel.Text = "End time";
        
        calibUpdateStartEndFrame(app)
    end
end