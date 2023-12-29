function filterTypeDropDownChange(app,event)
    value = app.filterTypeDropDown.Value;
    if isequal(value, "None")
        app.filterPassbandFreqVal.Visible = "on";
        app.filterPassbandFreqVal.Value = "";
        app.filterPassbandRippleVal.Visible = "on";
        app.filterPassbandRippleVal.Value = "";
        app.filterPassbandFreqLab.Visible = "on";
        app.filterPassbandRippleLab.Visible = "on";
        app.filterHalfPowFreq1Val.Visible = "off";
        app.filterHalfPowFreq1Val.Value = "";
        app.filterHalfPowFreq2Val.Visible = "off";
        app.filterHalfPowFreq2Val.Value = "";
        app.filterHalfPowFreq1Lab.Visible = "off";
        app.filterHalfPowFreq2Lab.Visible = "off";
        app.filterOrderVal.Enable = 0;
        app.filterOrderVal.Value = "";
        app.filterOrderLab.Enable = 0;
        app.filterPassbandFreqLab.Enable = 0;
        app.filterPassbandFreqVal.Enable = 0;
        app.filterPassbandFreqVal.Value = "";
        app.filterPassbandRippleLab.Enable = 0;
        app.filterPassbandRippleVal.Enable = 0;
        app.filterPassbandRippleVal.Value = "";
        app.filterSelectButton.Enable = 1;
        app.filterSelectField.Enable = 1;
        app.FIRButton.Enable = 1;
        app.IIRButton.Enable = 1;
        app.SecondorderIIRButton.Enable = 1;
        app.filterPassbandDescLab.Visible = 1;
        app.filterPassbandDescText.Visible = 1;
        app.filterRippleDescLab.Visible = 1;
        app.filterRippleDescText.Visible = 1;
        app.filterHalfpower1DescLab.Visible = 0;
        app.filterHalfpower1DescText.Visible = 0;
        app.filterHalfpower2DescLab.Visible = 0;
        app.filterHalfpower2DescText.Visible = 0;
        
    else
        app.filterSelectButton.Enable = 0;
        app.filterSelectField.Enable = 0;
        app.filterSelectField.Value = "";
        app.FIRButton.Enable = 0;
        app.IIRButton.Enable = 0;
        app.SecondorderIIRButton.Enable = 0;
    end
    
    if isequal(value, "Lowpass")
        app.filterPassbandFreqVal.Visible = "on";
        app.filterPassbandRippleVal.Visible = "on";
        app.filterPassbandFreqLab.Visible = "on";
        app.filterPassbandRippleLab.Visible = "on";
        app.filterHalfPowFreq1Val.Visible = "off";
        app.filterHalfPowFreq2Val.Visible = "off";
        app.filterHalfPowFreq1Lab.Visible = "off";
        app.filterHalfPowFreq2Lab.Visible = "off";
        app.filterOrderVal.Enable = 1;
        app.filterOrderLab.Enable = 1;
        app.filterPassbandFreqLab.Enable = 1;
        app.filterPassbandFreqVal.Enable = 1;
        app.filterPassbandRippleLab.Enable = 1;
        app.filterPassbandRippleVal.Enable = 1;
        app.SecondorderIIRButton.Enable = 1;
        app.filterPassbandDescLab.Visible = 1;
        app.filterPassbandDescText.Visible = 1;
        app.filterRippleDescLab.Visible = 1;
        app.filterRippleDescText.Visible = 1;
        app.filterHalfpower1DescLab.Visible = 0;
        app.filterHalfpower1DescText.Visible = 0;
        app.filterHalfpower2DescLab.Visible = 0;
        app.filterHalfpower2DescText.Visible = 0;
    end
    
    if isequal(value, "Highpass")
        app.filterPassbandFreqVal.Visible = "on";
        app.filterPassbandRippleVal.Visible = "on";
        app.filterPassbandFreqLab.Visible = "on";
        app.filterPassbandRippleLab.Visible = "on";
        app.filterHalfPowFreq1Val.Visible = "off";
        app.filterHalfPowFreq2Val.Visible = "off";
        app.filterHalfPowFreq1Lab.Visible = "off";
        app.filterHalfPowFreq2Lab.Visible = "off";
        app.filterOrderVal.Enable = 1;
        app.filterOrderLab.Enable = 1;
        app.filterPassbandFreqLab.Enable = 1;
        app.filterPassbandFreqVal.Enable = 1;
        app.filterPassbandRippleLab.Enable = 1;
        app.filterPassbandRippleVal.Enable = 1;
        app.SecondorderIIRButton.Enable = 1;
        app.filterPassbandDescLab.Visible = 1;
        app.filterPassbandDescText.Visible = 1;
        app.filterRippleDescLab.Visible = 1;
        app.filterRippleDescText.Visible = 1;
        app.filterHalfpower1DescLab.Visible = 0;
        app.filterHalfpower1DescText.Visible = 0;
        app.filterHalfpower2DescLab.Visible = 0;
        app.filterHalfpower2DescText.Visible = 0;
        
    end
    
    if isequal(value, "Bandpass")
        app.filterPassbandFreqVal.Visible = "off";
        app.filterPassbandRippleVal.Visible = "off";
        app.filterPassbandFreqLab.Visible = "off";
        app.filterPassbandRippleLab.Visible = "off";
        app.filterHalfPowFreq1Val.Visible = "on";
        app.filterHalfPowFreq2Val.Visible = "on";
        app.filterHalfPowFreq1Lab.Visible = "on";
        app.filterHalfPowFreq2Lab.Visible = "on";
        app.filterOrderVal.Enable = 1;
        app.filterOrderLab.Enable = 1;
        app.SecondorderIIRButton.Enable = 1;
        app.filterPassbandDescLab.Visible = 0;
        app.filterPassbandDescText.Visible = 0;
        app.filterRippleDescLab.Visible = 0;
        app.filterRippleDescText.Visible = 0;
        app.filterHalfpower1DescLab.Visible = 1;
        app.filterHalfpower1DescText.Visible = 1;
        app.filterHalfpower2DescLab.Visible = 1;
        app.filterHalfpower2DescText.Visible = 1;
    end
    
    if isequal(value, "Bandstop")
        app.filterPassbandFreqVal.Visible = "off";
        app.filterPassbandRippleVal.Visible = "off";
        app.filterPassbandFreqLab.Visible = "off";
        app.filterPassbandRippleLab.Visible = "off";
        app.filterHalfPowFreq1Val.Visible = "on";
        app.filterHalfPowFreq2Val.Visible = "on";
        app.filterHalfPowFreq1Lab.Visible = "on";
        app.filterHalfPowFreq2Lab.Visible = "on";
        app.filterOrderVal.Enable = 1;
        app.filterOrderLab.Enable = 1;
        app.filterPassbandDescLab.Visible = 0;
        app.filterPassbandDescText.Visible = 0;
        app.filterRippleDescLab.Visible = 0;
        app.filterRippleDescText.Visible = 0;
        app.filterHalfpower1DescLab.Visible = 1;
        app.filterHalfpower1DescText.Visible = 1;
        app.filterHalfpower2DescLab.Visible = 1;
        app.filterHalfpower2DescText.Visible = 1;
    end
end