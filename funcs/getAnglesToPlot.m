function [output, titles] = getAnglesToPlot(angleArray, planes)
    output = [];
    titles = [];

    if any(strcmp(planes, "Sagittal"))
        output = angleArray(:, 1);
        titles = ["sagt"];
    end

    if any(strcmp(planes, "Frontal"))
        output = [output, angleArray(:, 2)];
        titles = [titles, "frnt"];
    end

    if any(strcmp(planes, "Transverse"))
        output = [output, angleArray(:, 3)];
        titles = [titles, "trvs"];
    end
end