% https://au.mathworks.com/help/dsp/ug/using-filter-designer.html

function outputAngles = applyFilterFile(app, angles)
    filterObj = load(fullfile(app.filterPath, app.filterFile));
    
    if isequal(app.FIRButton.Value,1)
        numerator = filterObj.Hd.Numerator;    
        denominator = filterObj.Hd.Denominator;
        outputAngles = filtfilt(numerator, denominator, angles);
    end
    
    if isequal(app.IIRButton.Value,1)
        numerator = filterObj.Hd.Numerator;    
        denominator = 1;
        outputAngles = filtfilt(numerator, denominator, angles);
    end
    
    if isequal(app.SecondorderIIRButton.Value,1)
        sosMatrix = filterObj.Hd.sosMatrix;    
        scaleValues = filterObj.Hd.ScaleValues;
        outputAngles = filtfilt(sosMatrix, scaleValues, angles);
    end
end