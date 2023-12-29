function outputAngles = applyFilter(app, angles)
    
if isequal(app.filterTypeDropDown.Value, "Lowpass")
  lpFilt = designfilt('lowpassiir','FilterOrder', str2double(app.filterOrderVal.Value), ...
         'PassbandFrequency',str2double(app.filterPassbandFreqVal.Value),'PassbandRipple',str2double(app.filterPassbandRippleVal.Value), ...
         'SampleRate', app.trialRateOut);
  outputAngles = filtfilt(lpFilt, angles);
     
elseif isequal(app.filterTypeDropDown.Value, "Highpass")
  hpFilt = designfilt('highpassiir','FilterOrder',str2double(app.filterOrderVal.Value), ...
         'PassbandFrequency',str2double(app.filterPassbandFreqVal.Value),'PassbandRipple', str2double(app.filterPassbandRippleVal.Value), ...
         'SampleRate', app.trialRateOut);
  outputAngles = filtfilt(hpFilt, angles);
  
elseif isequal(app.filterTypeDropDown.Value, "Bandpass")
   bpFilt = designfilt('bandpassiir','FilterOrder',str2double(app.filterOrderVal.Value), ...
         'HalfPowerFrequency1',str2double(app.filterHalfPowFreq1Val.Value),'HalfPowerFrequency2',str2double(app.filterHalfPowFreq2Val.Value), ...
         'SampleRate', app.trialRateOut);
   outputAngles = filtfilt(bpFilt, angles);
     
elseif isequal(app.filterTypeDropDown.Value, "Bandstop")
   bsFilt = designfilt('bandstopiir','FilterOrder', str2double(app.filterOrderVal.Value), ...
         'HalfPowerFrequency1', str2double(app.filterHalfPowFreq1Val.Value),'HalfPowerFrequency2', str2double(app.filterHalfPowFreq2Val.Value), ...
         'SampleRate', app.trialRateOut);
   outputAngles = filtfilt(bsFilt, angles);
   
end