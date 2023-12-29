function closeApp(app, event)
    msg = 'Do you want to save current preferences for use next time you open the program?';
    title = 'Save user preferences';
    selection = uiconfirm(app.UIFigure,msg,title, ...
        'Options',{'Save','Exit without save', 'Clear and exit', 'Cancel'}, ...
        'DefaultOption',1,'CancelOption',4);
    
    disp("---- closing app ----")
    filePath = fullfile(matlabroot, "imuapp_config.mat");
    
    if strcmpi(selection,'Exit without save')
        delete(app);
    end
    
    if strcmpi(selection,'Save')
        disp("save tapped");        
        cleanOnStartup = false;
        save(filePath, "cleanOnStartup");

        if isprop(app.settingsManual, "Value") && ~(isequal(app.settingsManual.Value, 0))
            settingsManual = app.settingsManual.Value;
            save(filePath, "settingsManual",'-append');
        end

        if isprop(app.SaveDiagnosticPlotCheckBox, "Value") && ~(isequal(app.SaveDiagnosticPlotCheckBox.Value, 0))
            SaveDiagnosticPlotCheckBox = app.SaveDiagnosticPlotCheckBox.Value;
            save(filePath, "SaveDiagnosticPlotCheckBox",'-append');
        end

        % ---- FILTER ----
        if isprop(app.filterPassbandFreqVal, "Value") && ~(isequal(app.filterPassbandFreqVal.Value, 0))
            filterPassbandFreqVal = app.filterPassbandFreqVal.Value;
            save(filePath, "filterPassbandFreqVal",'-append');
        end
        if isprop(app.filterPassbandRippleVal, "Value") && ~(isequal(app.filterPassbandRippleVal.Value, 0))
            filterPassbandRippleVal = app.filterPassbandRippleVal.Value;
            save(filePath, "filterPassbandRippleVal",'-append');
        end
        if isprop(app.filterHalfPowFreq2Val, "Value") && ~(isequal(app.filterHalfPowFreq2Val.Value, 0))
            filterHalfPowFreq2Val = app.filterHalfPowFreq2Val.Value;
            save(filePath, "filterHalfPowFreq2Val",'-append');
        end
        if isprop(app.filterHalfPowFreq1Val, "Value") && ~(isequal(app.filterHalfPowFreq1Val.Value, 0))
            filterHalfPowFreq1Val = app.filterHalfPowFreq1Val.Value;
            save(filePath, "filterHalfPowFreq1Val",'-append');
        end
        if isprop(app.filterOrderVal, "Value") && ~(isequal(app.filterOrderVal.Value, 0))
            filterOrderVal = app.filterOrderVal.Value;
            save(filePath, "filterOrderVal",'-append');
        end
        if isprop(app.filterTypeDropDown, "Value") && ~(isequal(app.filterTypeDropDown.Value, 0))
            if ~isequal(app.filterTypeDropDown, "None")
                filterTypeDropDown = app.filterTypeDropDown.Value;
                save(filePath, "filterTypeDropDown",'-append');
            end
        end

        % ---- CALIBRATION ----
        if isprop(app.calibFreqInText, "Value") && ~(isequal(app.calibFreqInText.Value, 0))
            calibFreqInText = app.calibFreqInText.Value;
            save(filePath, "calibFreqInText",'-append');
        end
        if isprop(app.calibFreqOutText, "Value") && ~(isequal(app.calibFreqOutText.Value, 0))
            calibFreqOutText = app.calibFreqOutText.Value;
            save(filePath, "calibFreqOutText",'-append');
        end
        if isprop(app.calibEntireRadioButton, "Value") && ~(isequal(app.calibEntireRadioButton.Value, 0))
            calibEntireRadioButton = app.calibEntireRadioButton.Value;
            save(filePath, "calibEntireRadioButton",'-append');
        end
        if isprop(app.calibSelectRadioButton, "Value") && ~(isequal(app.calibSelectRadioButton.Value, 0))
            calibSelectRadioButton = app.calibSelectRadioButton.Value;
            save(filePath, "calibSelectRadioButton",'-append');
        end
        if isprop(app.calibDurationUnits, "Value") && ~(isequal(app.calibDurationUnits.Value, 0))
            calibDurationUnits = app.calibDurationUnits.Value;
            save(filePath, "calibDurationUnits",'-append');
        end
        if isprop(app.calibStartFrameText, "Value") && ~(isequal(app.calibStartFrameText.Value, 0))
            calibStartFrameText = app.calibStartFrameText.Value;
            save(filePath, "calibStartFrameText",'-append');
        end
        if isprop(app.calibEndFrameText, "Value") && ~(isequal(app.calibEndFrameText.Value, 0))
            calibEndFrameText = app.calibEndFrameText.Value;
            save(filePath, "calibEndFrameText",'-append');
        end
        if isprop(app.calibEndTimeHH, "Value") && ~(isequal(app.calibEndTimeHH.Value, 0))
            calibEndTimeHH = app.calibEndTimeHH.Value;
            save(filePath, "calibEndTimeHH",'-append');
        end
        if isprop(app.calibEndTimeMM, "Value") && ~(isequal(app.calibEndTimeMM.Value, 0))
            calibEndTimeMM = app.calibEndTimeMM.Value;
            save(filePath, "calibEndTimeMM",'-append');
        end
        if isprop(app.calibEndTimeSS, "Value") && ~(isequal(app.calibEndTimeSS.Value, 0))
            calibEndTimeSS = app.calibEndTimeSS.Value;
            save(filePath, "calibEndTimeSS",'-append');
        end
        if isprop(app.calibEndTimess, "Value") && ~(isequal(app.calibEndTimess.Value, 0))
            calibEndTimess = app.calibEndTimess.Value;
            save(filePath, "calibEndTimess",'-append');
        end
        if isprop(app.calibStartTimeHH, "Value") && ~(isequal(app.calibStartTimeHH.Value, 0))
            calibStartTimeHH = app.calibStartTimeHH.Value;
            save(filePath, "calibStartTimeHH",'-append');
        end
        if isprop(app.calibStartTimeMM, "Value") && ~(isequal(app.calibStartTimeMM.Value, 0))
            calibStartTimeMM = app.calibStartTimeMM.Value;
            save(filePath, "calibStartTimeMM",'-append');
        end
        if isprop(app.calibStartTimeSS, "Value") && ~(isequal(app.calibStartTimeSS.Value, 0))
            calibStartTimeSS = app.calibStartTimeSS.Value;
            save(filePath, "calibStartTimeSS",'-append');
        end
        if isprop(app.calibStartTimess, "Value") && ~(isequal(app.calibStartTimess.Value, 0))
            calibStartTimess = app.calibStartTimess.Value;
            save(filePath, "calibStartTimess",'-append');
        end

        %% ---- TRIAL ----
        if isprop(app.trialFreqInText, "Value") && ~(isequal(app.trialFreqInText.Value, 0))
            trialFreqInText = app.trialFreqInText.Value;
            save(filePath, "trialFreqInText",'-append');
        end
        if isprop(app.trialFreqOutText, "Value") && ~(isequal(app.trialFreqOutText.Value, 0))
            trialFreqOutText = app.trialFreqOutText.Value;
            save(filePath, "trialFreqOutText",'-append');
        end
        if isprop(app.trialEntiretrialButton, "Value") && ~(isequal(app.trialEntiretrialButton.Value, 0))
            trialEntiretrialButton = app.trialEntiretrialButton.Value;
            save(filePath, "trialEntiretrialButton",'-append');
        end
        if isprop(app.trialSelectStartEndButton, "Value") && ~(isequal(app.trialSelectStartEndButton.Value, 0))
            trialSelectStartEndButton = app.trialSelectStartEndButton.Value;
            save(filePath, "trialSelectStartEndButton",'-append');
        end
        if isprop(app.trialDurationUnits, "Value") && ~(isequal(app.trialDurationUnits.Value, 0))
            trialDurationUnits = app.trialDurationUnits.Value;
            save(filePath, "trialDurationUnits",'-append');
        end
        if isprop(app.trialStartFrameText, "Value") && ~(isequal(app.trialStartFrameText.Value, 0))
            trialStartFrameText = app.trialStartFrameText.Value;
            save(filePath, "trialStartFrameText",'-append');
        end
        if isprop(app.trialEndFrameText, "Value") && ~(isequal(app.trialEndFrameText.Value, 0))
            trialEndFrameText = app.trialEndFrameText.Value;
            save(filePath, "trialEndFrameText",'-append');
        end
        if isprop(app.trialStartTimeHH, "Value") && ~(isequal(app.trialStartTimeHH.Value, 0))
            trialStartTimeHH = app.trialStartTimeHH.Value;
            save(filePath, "trialStartTimeHH",'-append');
        end
        if isprop(app.trialStartTimeMM, "Value") && ~(isequal(app.trialStartTimeMM.Value, 0))
            trialStartTimeMM = app.trialStartTimeMM.Value;
            save(filePath, "trialStartTimeMM",'-append');
        end
        if isprop(app.trialStartTimeSS, "Value") && ~(isequal(app.trialStartTimeSS.Value, 0))
            trialStartTimeSS = app.trialStartTimeSS.Value;
            save(filePath, "trialStartTimeSS",'-append');
        end
        if isprop(app.trialStartTimess, "Value") && ~(isequal(app.trialStartTimess.Value, 0))
            trialStartTimess = app.trialStartTimess.Value;
            save(filePath, "trialStartTimess",'-append');
        end
        if isprop(app.trialEndTimeHH, "Value") && ~(isequal(app.trialEndTimeHH.Value, 0))
            trialEndTimeHH = app.trialEndTimeHH.Value;
            save(filePath, "trialEndTimeHH",'-append');
        end
        if isprop(app.trialEndTimeMM, "Value") && ~(isequal(app.trialEndTimeMM.Value, 0))
            trialEndTimeMM = app.trialEndTimeMM.Value;
            save(filePath, "trialEndTimeMM",'-append');
        end
        if isprop(app.trialEndTimeSS, "Value") && ~(isequal(app.trialEndTimeSS.Value, 0))
            trialEndTimeSS = app.trialEndTimeSS.Value;
            save(filePath, "trialEndTimeSS",'-append');
        end
        if isprop(app.trialEndTimess, "Value") && ~(isequal(app.trialEndTimess.Value, 0))
            trialEndTimess = app.trialEndTimess.Value;
            save(filePath, "trialEndTimess",'-append');
        end

        % ---- EXPORT ----
        if isprop(app.sagittalCheck, "Value") && ~(isequal(app.sagittalCheck.Value, 0))
            sagittalCheck = app.sagittalCheck.Value;
            save(filePath, "sagittalCheck",'-append');
        end
        if isprop(app.transverseCheck, "Value") && ~(isequal(app.transverseCheck.Value, 0))
            transverseCheck = app.transverseCheck.Value;
            save(filePath, "transverseCheck",'-append');
        end
        if isprop(app.frontalCheck, "Value") && ~(isequal(app.frontalCheck.Value, 0))
            frontalCheck = app.frontalCheck.Value;
            save(filePath, "frontalCheck",'-append');
        end
        if isprop(app.allPlaneCheck, "Value") && ~(isequal(app.allPlaneCheck.Value, 0))
            allPlaneCheck = app.allPlaneCheck.Value;
            save(filePath, "allPlaneCheck",'-append');
        end
        if isprop(app.allDataCheck, "Value") && ~(isequal(app.allDataCheck.Value, 0))
            allDataCheck = app.allDataCheck.Value;
            save(filePath, "allDataCheck",'-append');
        end
        if isprop(app.ankleLDataCheck, "Value") && ~(isequal(app.ankleLDataCheck.Value, 0))
            ankleLDataCheck = app.ankleLDataCheck.Value;
            save(filePath, "ankleLDataCheck",'-append');
        end
        if isprop(app.hipLDataCheck, "Value") && ~(isequal(app.hipLDataCheck.Value, 0))
            hipLDataCheck = app.hipLDataCheck.Value;
            save(filePath, "hipLDataCheck",'-append');
        end
        if isprop(app.kneeLDataCheck, "Value") && ~(isequal(app.kneeLDataCheck.Value, 0))
            kneeLDataCheck = app.kneeLDataCheck.Value;
            save(filePath, "kneeLDataCheck",'-append');
        end
        if isprop(app.timeDataCheck, "Value") && ~(isequal(app.timeDataCheck.Value, 0))
            timeDataCheck = app.timeDataCheck.Value;
            save(filePath, "timeDataCheck",'-append');
        end
        if isprop(app.ankleRDataCheck, "Value") && ~(isequal(app.ankleRDataCheck.Value, 0))
            ankleRDataCheck = app.ankleRDataCheck.Value;
            save(filePath, "ankleRDataCheck",'-append');
        end
        if isprop(app.hipRDataCheck, "Value") && ~(isequal(app.hipRDataCheck.Value, 0))
            hipRDataCheck = app.hipRDataCheck.Value;
            save(filePath, "hipRDataCheck",'-append');
        end
        if isprop(app.kneeRDataCheck, "Value") && ~(isequal(app.kneeRDataCheck.Value, 0))
            kneeRDataCheck = app.kneeRDataCheck.Value;
            save(filePath, "kneeRDataCheck",'-append');
        end
        if isprop(app.allBilateralCheck, "Value") && ~(isequal(app.allBilateralCheck.Value, 0))
            allBilateralCheck = app.allBilateralCheck.Value;
            save(filePath, "allBilateralCheck",'-append');
        end
        if isprop(app.ankleBilateralCheck, "Value") && ~(isequal(app.ankleBilateralCheck.Value, 0))
            ankleBilateralCheck = app.ankleBilateralCheck.Value;
            save(filePath, "ankleBilateralCheck",'-append');
        end
        if isprop(app.hipBilateralCheck, "Value") && ~(isequal(app.hipBilateralCheck.Value, 0))
            hipBilateralCheck = app.hipBilateralCheck.Value;
            save(filePath, "hipBilateralCheck",'-append');
        end
        if isprop(app.kneeBilateralCheck, "Value") && ~(isequal(app.kneeBilateralCheck.Value, 0))
            kneeBilateralCheck = app.kneeBilateralCheck.Value;
            save(filePath, "kneeBilateralCheck",'-append');
        end
        if isprop(app.allUnilateralLCheck, "Value") && ~(isequal(app.allUnilateralLCheck.Value, 0))
            allUnilateralLCheck = app.allUnilateralLCheck.Value;
            save(filePath, "allUnilateralLCheck",'-append');
        end
        if isprop(app.ankleUnilateralLCheck, "Value") && ~(isequal(app.ankleUnilateralLCheck.Value, 0))
            ankleUnilateralLCheck = app.ankleUnilateralLCheck.Value;
            save(filePath, "ankleUnilateralLCheck",'-append');
        end
        if isprop(app.hipUnilateralLCheck, "Value") && ~(isequal(app.hipUnilateralLCheck.Value, 0))
            hipUnilateralLCheck = app.hipUnilateralLCheck.Value;
            save(filePath, "hipUnilateralLCheck",'-append');
        end
        if isprop(app.kneeUnilateralLCheck, "Value") && ~(isequal(app.kneeUnilateralLCheck.Value, 0))
            kneeUnilateralLCheck = app.kneeUnilateralLCheck.Value;
            save(filePath, "kneeUnilateralLCheck",'-append');
        end
        if isprop(app.allUnilateralRCheck, "Value") && ~(isequal(app.allUnilateralRCheck.Value, 0))
            allUnilateralRCheck = app.allUnilateralRCheck.Value;
            save(filePath, "allUnilateralRCheck",'-append');
        end
        if isprop(app.ankleUnilateralRCheck, "Value") && ~(isequal(app.ankleUnilateralRCheck.Value, 0))
            ankleUnilateralRCheck = app.ankleUnilateralRCheck.Value;
            save(filePath, "ankleUnilateralRCheck",'-append');
        end
        if isprop(app.hipUnilateralRCheck, "Value") && ~(isequal(app.hipUnilateralRCheck.Value, 0))
            hipUnilateralRCheck = app.hipUnilateralRCheck.Value;
            save(filePath, "hipUnilateralRCheck",'-append');
        end
        if isprop(app.kneeUnilateralRCheck, "Value") && ~(isequal(app.kneeUnilateralRCheck.Value, 0))
            kneeUnilateralRCheck = app.kneeUnilateralRCheck.Value;
            save(filePath, "kneeUnilateralRCheck",'-append');
        end

        delete(app);
        
    elseif strcmpi(selection, 'Clear and exit')
         cleanOnStartup = true;
         save(filePath, "cleanOnStartup");
         delete(app);
    else 
        disp("cancel tapped")
    end
end