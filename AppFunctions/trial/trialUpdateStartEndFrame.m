function trialUpdateStartEndFrame(app)
    if app.trialDurationUnits.Value == "Time"
        app.trialStartFrame = app.trialStartTimeSec * app.trialRateIn;
        app.trialEndFrame = app.trialEndTimeSec * app.trialRateIn;
    
    elseif app.trialDurationUnits.Value == "Frame"
        app.trialStartFrame = app.trialStartFrameText.Value;
        app.trialEndFrame = app.trialEndFrameText.Value;
    end
end