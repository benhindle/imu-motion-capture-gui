function [orientation, debugFigure] = getGlobalOrientation(app, acc, gyr, mag,...
    startFrame, endFrame, SAMPLE_RATE, baseName, tableData)

tableNames = tableData.Properties.VariableNames;

accX = acc(startFrame:endFrame, 1);
accY = acc(startFrame:endFrame, 2);
accZ = acc(startFrame:endFrame, 3);
gyroX = gyr(startFrame:endFrame, 1);
gyroY = gyr(startFrame:endFrame, 2);
gyroZ = gyr(startFrame:endFrame, 3);
magX = mag(startFrame:endFrame, 1);
magY = mag(startFrame:endFrame, 2);
magZ = mag(startFrame:endFrame, 3);

gyroArray = [gyroX, gyroY, gyroZ];
gyroArray = gyroArray * (pi / 180);
accArray = [accX, accY, accZ];
magArray = [magX, magY, magZ];

accIndex = find(contains(tableNames, baseName+"_Accel"));
accOffset = [accIndex, accIndex+2];
magIndex = find(contains(tableNames, baseName+"_Mag"));
magOffset = [magIndex, magIndex+2];

accCalib = table2array( tableData(:, accOffset(1):accOffset(2)) ); 
magCalib = table2array( tableData(:, magOffset(1):magOffset(2)) );

% motion = abs(accCalib(:,1)) < 1.5*10^4;
motion = (abs(accCalib(:,1)) < 1.5*10^4);
motion = ~bwareaopen(motion, 2*10^4);
motion = motion * max(abs(accCalib(:,1)));
% disp(motion)

debugFigure = figure('visible','off');
plot(motion, 'b-', 'LineWidth', 2, "Parent", app.MotionAxes);
hold(app.MotionAxes, "on")
plot(abs(accCalib(:,1) ), '-', 'Color', [0,0.5,0], "Parent", app.MotionAxes);
hold(app.MotionAxes, "off")

hold("on")
plot(motion, 'b-', 'LineWidth', 2);
hold("on")
plot(abs(accCalib(:,1) ), '-', 'Color', [0,0.5,0]);
hold("off")

changeIndexOn = find(motion, 1, 'first');
changeIndexOff = find(motion, 1, 'last');

[bmcA, bmcB, EXPECTED_MAGNETIC_FS] = magcal(magCalib(changeIndexOn:changeIndexOff,:)); %sym

magArrayCorrected = (magArray - bmcB) * bmcA;

ahrsfilt = ahrsfilter();
ahrsfilt.SampleRate = SAMPLE_RATE;
ahrsfilt.LinearAccelerationNoise = 3.9506236;
ahrsfilt.LinearAccelerationDecayFactor = 0.8;
ahrsfilt.ExpectedMagneticFieldStrength = EXPECTED_MAGNETIC_FS;

fusion = ahrsfilt(accArray, gyroArray, magArrayCorrected);

orientation.fusion = fusion;
orientation.accArray = accArray;
orientation.gyroArray = gyroArray;
orientation.magArrayCorrected = magArrayCorrected;
orientation.time = linspace( 0, length(accArray), length(accArray) ).';

reset(ahrsfilter)
end