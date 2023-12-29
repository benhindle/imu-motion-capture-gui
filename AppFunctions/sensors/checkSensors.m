function checkSensors(app)
    value = false;
    if isequal(app.methodDropDown.Value, "Vicon")
        if isequal(app.viconBaseDropDown.Value, "none")
            value = false;
        else
            count = 0;
            if ~isequal(app.viconPelvisDropDown.Value, "none")
                count = count + 1;
            end
            if ~isequal(app.viconThighLDropDown.Value, "none")
                count = count + 1;
            end
            if ~isequal(app.viconThighRDropDown.Value, "none")
                count = count + 1;
            end
            if ~isequal(app.viconShankLDropDown.Value, "none")
                count = count + 1;
            end
            if ~isequal(app.viconShankRDropDown.Value, "none")
                count = count + 1;
            end
            if ~isequal(app.viconFootLDropDown.Value, "none")
                count = count + 1;
            end
            if ~isequal(app.viconFootRDropDown.Value, "none")
                count = count + 1;
            end
            
            if count > 1
                value = true;
            end
        end
    end
    
    if isequal(value, false)
        errordlg('Please ensure you have selected at least one base sensor and two limb sensors, then re-run your analysis.','Sensor Error');
    else
        return
    end
end