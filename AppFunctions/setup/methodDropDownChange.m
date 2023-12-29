function methodDropDownChange(app, event)
    value = app.methodDropDown.Value;
    if value == "Vicon"
        hideIMeasureUDropdowns(app)
        showViconDropdowns(app)
        
    elseif value == "IMeasureU" 
        hideViconDropdowns(app)
        showIMeasureUDropdowns(app)
    end
end