function trialFreqInTextfieldChange(app, event)
    value = app.trialFreqInText.Value;
    app.trialRateIn = str2double(value);
    trialUpdateStartEndFrame(app);
end