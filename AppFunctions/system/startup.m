function startup(app)
    filePath = fullfile(matlabroot, "imuapp_config.mat");
    
        if (isfile(filePath))
            struct = load(filePath);
            
            if isprop(struct, "cleanOnStartup") && struct.cleanOnStartup
                disp("cleaning startup")
                
                return
            end
            
            disp("---- starting app ----")
            
            % if isfield(struct, "rootDirectoryPath") && (~isequal(struct.rootDirectoryPath, ''))
            %     app.rootDirectoryPath = struct.rootDirectoryPath;  
            %     app.rootDirectoryDisplayPath.Value = struct.rootDirectoryPath;
            % end

            if isfield(struct, "settingsManual") && ~(isequal(struct.settingsManual, 0))
                app.settingsManual.Value = struct.settingsManual;    
            end
            if isfield(struct, "SaveDiagnosticPlotCheckBox") && ~(isequal(struct.SaveDiagnosticPlotCheckBox, 0))
                app.SaveDiagnosticPlotCheckBox.Value = struct.SaveDiagnosticPlotCheckBox;    
            end
            
            % ---- FLITER ----
            if isfield(struct, "filterPassbandFreqVal") && ~(isequal(struct.filterPassbandFreqVal, 0))
                app.filterPassbandFreqVal.Value = struct.filterPassbandFreqVal;    
            end
            if isfield(struct, "filterPassbandRippleVal") && ~(isequal(struct.filterPassbandRippleVal, 0))
                app.filterPassbandRippleVal.Value = struct.filterPassbandRippleVal;
            end
            if isfield(struct, "filterHalfPowFreq2Val") && ~(isequal(struct.filterHalfPowFreq2Val, 0))
                app.filterHalfPowFreq2Val.Value = struct.filterHalfPowFreq2Val;
            end
            if isfield(struct, "filterHalfPowFreq1Val") && ~(isequal(struct.filterHalfPowFreq1Val, 0))
                app.filterHalfPowFreq1Val.Value = struct.filterHalfPowFreq1Val;    
            end
            if isfield(struct, "filterOrderVal") && ~(isequal(struct.filterOrderVal, 0))
                app.filterOrderVal.Value = struct.filterOrderVal;    
            end
            if isfield(struct, "filterTypeDropDown") && ~(isequal(struct.filterTypeDropDown, 0))
                app.filterTypeDropDown.Value = struct.filterTypeDropDown;    
            end

            % ---- CALIBRATION ----
            if isfield(struct, "calibFreqInText") && ~(isequal(struct.calibFreqInText, 0))
                app.calibFreqInText.Value = struct.calibFreqInText;    
            end
            if isfield(struct, "calibFreqOutText") && ~(isequal(struct.calibFreqOutText, 0))
                app.calibFreqOutText.Value = struct.calibFreqOutText;    
            end
            if isfield(struct, "calibEntireRadioButton") && ~(isequal(struct.calibEntireRadioButton, 0))
                app.calibEntireRadioButton.Value = struct.calibEntireRadioButton;    
            end
            if isfield(struct, "calibSelectRadioButton") && ~(isequal(struct.calibSelectRadioButton, 0))
                app.calibSelectRadioButton.Value = struct.calibSelectRadioButton;    
            end
            if isfield(struct, "calibDurationUnits") && ~(isequal(struct.calibDurationUnits, 0))
                app.calibDurationUnits.Value = struct.calibDurationUnits;    
            end
            if isfield(struct, "calibStartFrameText") && ~(isequal(struct.calibStartFrameText, 0))
                app.calibStartFrameText.Value = struct.calibStartFrameText;    
            end
            if isfield(struct, "calibEndFrameText") && ~(isequal(struct.calibEndFrameText, 0))
                app.calibEndFrameText.Value = struct.calibEndFrameText;    
            end
            if isfield(struct, "calibEndTimeHH") && ~(isequal(struct.calibEndTimeHH, 0))
                app.calibEndTimeHH.Value = struct.calibEndTimeHH;    
            end
            if isfield(struct, "calibEndTimeMM") && ~(isequal(struct.calibEndTimeMM, 0))
                app.calibEndTimeMM.Value = struct.calibEndTimeMM;    
            end
            if isfield(struct, "calibEndTimeSS") && ~(isequal(struct.calibEndTimeSS, 0))
                app.calibEndTimeSS.Value = struct.calibEndTimeSS;    
            end
            if isfield(struct, "calibEndTimess") && ~(isequal(struct.calibEndTimess, 0))
                app.calibEndTimess.Value = struct.calibEndTimess;    
            end
            if isfield(struct, "calibStartTimeHH") && ~(isequal(struct.calibStartTimeHH, 0))
                app.calibStartTimeHH.Value = struct.calibStartTimeHH;    
            end
            if isfield(struct, "calibStartTimeMM") && ~(isequal(struct.calibStartTimeMM, 0))
                app.calibStartTimeMM.Value = struct.calibStartTimeMM;    
            end
            if isfield(struct, "calibStartTimeSS") && ~(isequal(struct.calibStartTimeSS, 0))
                app.calibStartTimeSS.Value = struct.calibStartTimeSS;    
            end
            if isfield(struct, "calibStartTimess") && ~(isequal(struct.calibStartTimess, 0))
                app.calibStartTimess.Value = struct.calibStartTimess;    
            end

            % ---- TRIAL ----
            if isfield(struct, "trialFreqInText") && ~(isequal(struct.trialFreqInText, 0))
                app.trialFreqInText.Value = struct.trialFreqInText;    
            end
            if isfield(struct, "trialFreqOutText") && ~(isequal(struct.trialFreqOutText, 0))
                app.trialFreqOutText.Value = struct.trialFreqOutText;    
            end
            if isfield(struct, "trialEntireRadioButton") && ~(isequal(struct.trialEntireRadioButton, 0))
                app.trialEntireRadioButton.Value = struct.trialEntireRadioButton;    
            end
            if isfield(struct, "trialSelectStartEndButton") && ~(isequal(struct.trialSelectStartEndButton, 0))
                app.trialSelectStartEndButton.Value = struct.trialSelectStartEndButton;    
            end
            if isfield(struct, "trialDurationUnits") && ~(isequal(struct.trialDurationUnits, 0))
                app.trialDurationUnits.Value = struct.trialDurationUnits;    
            end
            if isfield(struct, "trialStartFrameText") && ~(isequal(struct.trialStartFrameText, 0))
                app.trialStartFrameText.Value = struct.trialStartFrameText;
                app.trialStartFrame = app.trialStartFrameText.Value;
            end
            if isfield(struct, "trialEndFrameText") && ~(isequal(struct.trialEndFrameText, 0))
                app.trialEndFrameText.Value = struct.trialEndFrameText;    
                app.trialEndFrame = app.trialEndFrameText.Value;
            end
            if isfield(struct, "trialStartTimeHH") && ~(isequal(struct.trialStartTimeHH, 0))
                app.trialStartTimeHH.Value = struct.trialStartTimeHH;    
            end
            if isfield(struct, "trialStartTimeMM") && ~(isequal(struct.trialStartTimeMM, 0))
                app.trialStartTimeMM.Value = struct.trialStartTimeMM;    
            end
            if isfield(struct, "trialStartTimeSS") && ~(isequal(struct.trialStartTimeSS, 0))
                app.trialStartTimeSS.Value = struct.trialStartTimeSS;    
            end
            if isfield(struct, "trialStartTimess") && ~(isequal(struct.trialStartTimess, 0))
                app.trialStartTimess.Value = struct.trialStartTimess;    
            end
            if isfield(struct, "trialEndTimeHH") && ~(isequal(struct.trialEndTimeHH, 0))
                app.trialEndTimeHH.Value = struct.trialEndTimeHH;    
            end
            if isfield(struct, "trialEndTimeMM") && ~(isequal(struct.trialEndTimeMM, 0))
                app.trialEndTimeMM.Value = struct.trialEndTimeMM;    
            end
            if isfield(struct, "trialEndTimeSS") && ~(isequal(struct.trialEndTimeSS, 0))
                app.trialEndTimeSS.Value = struct.trialEndTimeSS;    
            end
            if isfield(struct, "trialEndTimess") && ~(isequal(struct.trialEndTimess, 0))
                app.trialEndTimess.Value = struct.trialEndTimess;    
            end

            % ---- EXPORT ----
            if isfield(struct, "sagittalCheck") && ~(isequal(struct.sagittalCheck, 0))
                app.sagittalCheck.Value = struct.sagittalCheck;    
            end
            if isfield(struct, "transverseCheck") && ~(isequal(struct.transverseCheck, 0))
                app.transverseCheck.Value = struct.transverseCheck;    
            end
            if isfield(struct, "frontalCheck") && ~(isequal(struct.frontalCheck, 0))
                app.frontalCheck.Value = struct.frontalCheck;    
            end
            if isfield(struct, "allPlaneCheck") && ~(isequal(struct.allPlaneCheck, 0))
                app.allPlaneCheck.Value = struct.allPlaneCheck;    
            end
            if isfield(struct, "allDataCheck") && ~(isequal(struct.allDataCheck, 0))
                app.allDataCheck.Value = struct.allDataCheck;    
            end
            if isfield(struct, "ankleLDataCheck") && ~(isequal(struct.ankleLDataCheck, 0))
                app.ankleLDataCheck.Value = struct.ankleLDataCheck;    
            end
            if isfield(struct, "hipLDataCheck") && ~(isequal(struct.hipLDataCheck, 0))
                app.hipLDataCheck.Value = struct.hipLDataCheck;    
            end
            if isfield(struct, "kneeLDataCheck") && ~(isequal(struct.kneeLDataCheck, 0))
                app.kneeLDataCheck.Value = struct.kneeLDataCheck;    
            end
            if isfield(struct, "timeDataCheck") && ~(isequal(struct.timeDataCheck, 0))
                app.timeDataCheck.Value = struct.timeDataCheck;    
            end
            if isfield(struct, "ankleRDataCheck") && ~(isequal(struct.ankleRDataCheck, 0))
                app.ankleRDataCheck.Value = struct.ankleRDataCheck;    
            end
            if isfield(struct, "hipRDataCheck") && ~(isequal(struct.hipRDataCheck, 0))
                app.hipRDataCheck.Value = struct.hipRDataCheck;    
            end
            if isfield(struct, "kneeRDataCheck") && ~(isequal(struct.kneeRDataCheck, 0))
                app.kneeRDataCheck.Value = struct.kneeRDataCheck;    
            end
            if isfield(struct, "allBilateralCheck") && ~(isequal(struct.allBilateralCheck, 0))
                app.allBilateralCheck.Value = struct.allBilateralCheck;    
            end
            if isfield(struct, "ankleBilateralCheck") && ~(isequal(struct.ankleBilateralCheck, 0))
                app.ankleBilateralCheck.Value = struct.ankleBilateralCheck;    
            end
            if isfield(struct, "hipBilateralCheck") && ~(isequal(struct.hipBilateralCheck, 0))
                app.hipBilateralCheck.Value = struct.hipBilateralCheck;    
            end
            if isfield(struct, "kneeBilateralCheck") && ~(isequal(struct.kneeBilateralCheck, 0))
                app.kneeBilateralCheck.Value = struct.kneeBilateralCheck;    
            end
            if isfield(struct, "allUnilateralLCheck") && ~(isequal(struct.allUnilateralLCheck, 0))
                app.allUnilateralLCheck.Value = struct.allUnilateralLCheck;    
            end
            if isfield(struct, "ankleUnilateralLCheck") && ~(isequal(struct.ankleUnilateralLCheck, 0))
                app.ankleUnilateralLCheck.Value = struct.ankleUnilateralLCheck;    
            end
            if isfield(struct, "hipUnilateralLCheck") && ~(isequal(struct.hipUnilateralLCheck, 0))
                app.hipUnilateralLCheck.Value = struct.hipUnilateralLCheck;    
            end
            if isfield(struct, "kneeUnilateralLCheck") && ~(isequal(struct.kneeUnilateralLCheck, 0))
                app.kneeUnilateralLCheck.Value = struct.kneeUnilateralLCheck;    
            end
            if isfield(struct, "allUnilateralRCheck") && ~(isequal(struct.allUnilateralRCheck, 0))
                app.allUnilateralRCheck.Value = struct.allUnilateralRCheck;    
            end
            if isfield(struct, "ankleUnilateralRCheck") && ~(isequal(struct.ankleUnilateralRCheck, 0))
                app.ankleUnilateralRCheck.Value = struct.ankleUnilateralRCheck;    
            end
            if isfield(struct, "hipUnilateralRCheck") && ~(isequal(struct.hipUnilateralRCheck, 0))
                app.hipUnilateralRCheck.Value = struct.hipUnilateralRCheck;    
            end
            if isfield(struct, "kneeUnilateralRCheck") && ~(isequal(struct.kneeUnilateralRCheck, 0))
                app.kneeUnilateralRCheck.Value = struct.kneeUnilateralRCheck;    
            end


            if isequal(app.filterTypeDropDown.Value, 'Bandpass') || isequal(app.filterTypeDropDown.Value, 'Bandstop')
                app.filterHalfPowFreq1Val.Visible = true;
                app.filterHalfPowFreq1Val.Enable = true;
                app.filterPassbandFreqLab.Visible = false;
                app.filterPassbandRippleLab.Visible = false;
                app.filterHalfPowFreq1Lab.Visible = true;
                app.filterHalfPowFreq1Lab.Enable = true;
                app.filterHalfPowFreq2Val.Visible = true;
                app.filterHalfPowFreq2Val.Enable = true;
                app.filterHalfPowFreq2Lab.Visible = true;
                app.filterHalfPowFreq2Lab.Enable = true;
                app.filterOrderVal.Visible = true;
                app.filterOrderVal.Enable = true;
                app.filterOrderLab.Visible = true;
                app.filterOrderLab.Enable = true;
            end

            if isequal(app.filterTypeDropDown.Value, 'Highpass') || isequal(app.filterTypeDropDown.Value, 'Lowpass')
                app.filterPassbandFreqVal.Visible = true;
                app.filterPassbandFreqVal.Enable = true;
                app.filterPassbandFreqLab.Visible = true;
                app.filterPassbandFreqLab.Enable = true;
                app.filterPassbandRippleVal.Visible = true;
                app.filterPassbandRippleVal.Enable = true;
                app.filterPassbandRippleLab.Visible = true;
                app.filterPassbandRippleLab.Enable = true;
                app.filterOrderVal.Visible = true;
                app.filterOrderVal.Enable = true;
                app.filterOrderLab.Visible = true;
                app.filterOrderLab.Enable = true;
            end


            if isequal(app.trialSelectStartEndButton.Value, 1)
                app.trialDurationUnits.Enable = true;
                app.trialStartFrameText.Enable = true;
                app.trialEndFrameText.Enable = true;
            end

            if isequal(app.trialDurationUnits.Value, 'Time')
                app.trialStartFrameText.Visible = false;
                app.trialEndFrameText.Visible = false;
                app.trialStartTimeHH.Visible = true;
                app.trialStartTimeHH.Enable = true;
                app.trialStarttimeLabelTrial.Visible = true;
                app.trialHHLabel.Visible = true;
                app.trialStartTimeMM.Visible = true;
                app.trialStartTimeMM.Enable = true;
                app.trialMMLabel.Visible = true;
                app.trialStartTimeSS.Visible = true;
                app.trialStartTimeSS.Enable = true;
                app.trialSSLabel.Visible = true;
                app.trialStartTimess.Visible = true;
                app.trialStartTimess.Enable = true;
                app.trialSsLabel.Visible = true;
                app.trialEndTimeHH.Visible = true;
                app.trialEndTimeHH.Enable = true;
                app.trialEndTimeMM.Visible = true;
                app.trialEndTimeMM.Enable = true;
                app.trialEndTimeSS.Visible = true;
                app.trialEndTimeSS.Enable = true;
                app.trialEndTimess.Visible = true;
                app.trialEndTimess.Enable = true;
                app.trialEndtimeLabel.Visible = true;
            end

            if isequal(app.calibSelectRadioButton.Value, 1)
                app.calibDurationUnits.Enable = true;
                app.calibStartFrameText.Enable = true;
                app.calibEndFrameText.Enable = true;
            end

            if isequal(app.calibDurationUnits.Value, 'Time')
                app.calibStartFrameText.Visible = false;
                app.calibEndFrameText.Visible = false;
                app.calibStartTimeHH.Visible = true;
                app.calibStartTimeHH.Enable = true;
                app.calibStartTimeMM.Visible = true;
                app.calibStartTimeMM.Enable = true;
                app.calibStartTimeSS.Visible = true;
                app.calibStartTimeSS.Enable = true;
                app.calibStartTimess.Visible = true;
                app.calibStartTimess.Enable = true;
                app.calibEndTimeHH.Visible = true;
                app.calibEndTimeHH.Enable = true;
                app.calibEndTimeMM.Visible = true;
                app.calibEndTimeMM.Enable = true;
                app.calibEndTimeSS.Visible = true;
                app.calibEndTimeSS.Enable = true;
                app.calibEndTimess.Visible = true;
                app.calibEndTimess.Enable = true;
                app.calibHHLabel.Visible = true;
                app.calibMMLabel.Visible = true;
                app.calibSSLabel.Visible = true;
                app.calibSsLabel.Visible = true;
                app.calibStartLabel.Text = 'Start time';
                app.calibEndLabel.Text = 'End time';
            end

        else
            %% create file
            save(filePath);
        end

end