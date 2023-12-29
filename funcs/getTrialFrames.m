function [startFrame, endFrame] = getTrialFrames(app)
% if app.trialSelectStartEndButton.Value == 1
% if app.trialDurationUnits.Value == "Frame"
% app.trialStartFrame
% app.trialEndFrame

    if app.trialSelectStartEndButton.Value == 1
       if app.trialDurationUnits.Value == "Frame"
           startFrame = app.trialStartFrame;
           endFrame = app.trialEndFrame;
       else
           startFrame = app.trialStartTimeSec * app.trialRateIn;
           endFrame = app.trialEndTimeSec * app.trialRateIn;
       end
    else
        startFrame = 0;
        endFrame = 0;
    end
end