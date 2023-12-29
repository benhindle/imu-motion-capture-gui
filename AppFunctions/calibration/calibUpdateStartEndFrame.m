function calibUpdateStartEndFrame(app)
    if isequal(app.calibDurationUnits.Value, "Time")
        app.calibStaticStartFrame = app.calibStartTimeSec * app.calibRateIn;
        app.calibStaticEndFrame = app.calibEndTimeSec * app.calibRateIn;
     
    elseif isequal(app.calibDurationUnits.Value, "Frame")
        app.calibStaticStartFrame = app.calibStartFrameText.Value;
        app.calibStaticEndFrame = app.calibEndFrameText.Value;
    end
end