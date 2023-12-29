%{
// VERSION:0.2.0
// BUILD DATE:220803
// UPDATES/FEATURES:    adapted for Macquarie University
                        Single standing trial for sensor calibration by Jordan Andersen

// REFERENCE:
    https://www.mathworks.com/help/supportpkg/arduinoio/examples/estimate-orientation-inertial-sensor-fusion-and-mpu-9250.html?searchHighlight=helperorientationviewer&s_tid=doc_srchtitle
    Hindle et al 2020
%}
function appMainRun(app, joint)
clearvars -except acc_n pos_n timestamp locs app joint
% close all
warning('off');



%% Check and select output viewing tab
if isequal(app.settingsAutoRadio.SelectedObject.Text, "Auto")
    app.PlotTabGroup.SelectedTab = app.AutoPlots;
    app.TrialAxes.Visible = 1;   
    app.StaticAxes.Visible = 0;
    app.MotionAxes.Visible = 0;
    app.TrialAxes2.Visible = 0;
else
    app.PlotTabGroup.SelectedTab = app.ManualPlots;
    app.TrialAxes.Visible = 0;   
    app.StaticAxes.Visible = 1;
    app.MotionAxes.Visible = 1;
    app.TrialAxes2.Visible = 1;
end



%% FOR EACH JOINT BEING ANALYSED
[data, sensorNames] = createDataObject(app, joint);
[trialStartFrame, trialEndFrame] = getTrialFrames(app);

% --- BASE SENSOR --- %
if app.calibStaticStartFrame == 0 || app.calibStaticStartFrame >= app.calibStaticEndFrame || app.calibStaticStartFrame > length(data.distAcc)
    app.calibStaticStartFrame = 1;
end
if app.calibStaticEndFrame == 0 || app.calibStaticEndFrame <= app.calibStaticStartFrame || app.calibStaticEndFrame > length(data.distAcc)
    app.calibStaticEndFrame = app.calibRateIn;
end

[baseStaticFusion, debugPlotFigure] = getGlobalOrientation(app, data.baseAccStatic, data.baseGyrStatic, data.baseMagStatic,...
    app.calibStaticStartFrame, app.calibStaticEndFrame, app.calibRateIn, sensorNames.base, app.magCalTable);
app.debugFigures = [app.debugFigures, debugPlotFigure];
if isequal(app.SaveDiagnosticPlotCheckBox.Value, 1)
    saveas(debugPlotFigure, sprintf('%s%s%s%s_motiondebug', app.plotOutPath, filesep, app.debugTitle, "base"),'jpg');
end

% establish base coord system
q_os = establishBaseCoordinateSys(baseStaticFusion);

% --- DISTAL SENSOR --- %
% static orientation
[distalStaticFusion, debugPlotFigure] = getGlobalOrientation(app, data.distAccStatic, data.distGyrStatic, data.distMagStatic,...
    app.calibStaticStartFrame, app.calibStaticEndFrame, app.calibRateIn, sensorNames.distal, app.magCalTable);
app.debugFigures = [app.debugFigures, debugPlotFigure];
if isequal(app.SaveDiagnosticPlotCheckBox.Value, 1)
    saveas(debugPlotFigure, sprintf('%s%s%s%s_motiondebug', app.plotOutPath, filesep, app.debugTitle, "distal"),'jpg');
end

% establish transformation quaternion of distal sensor in the segment frame
distalOriginOrientQuat = quatmultiply(quatconj(q_os), compact(meanrot(distalStaticFusion.fusion)));
    
% distal sensor movement 
if trialStartFrame == 0 || trialStartFrame >= trialEndFrame || trialStartFrame > length(data.distAcc)
    trialStartFrame = 1;
end
if trialEndFrame == 0 || trialEndFrame <= trialStartFrame || trialEndFrame > length(data.distAcc)
    trialEndFrame = length(data.distAcc);
end
disp(sprintf("trialStartFrame %d", trialStartFrame))
disp(sprintf("trialEndFrame %d", trialEndFrame))
[distalFusion, debugPlotData] = getGlobalOrientation(app, data.distAcc, data.distGyr, data.distMag,...
    trialStartFrame, trialEndFrame, app.trialRateIn, sensorNames.distal, app.magCalTable);
app.debugFigures = [app.debugFigures, debugPlotData];

% transform orientation of distal sensor into segment frame at each time point
distalFusion.orientQuat = quaternion(quatmultiply(quatnormalize(compact(distalFusion.fusion)), quatconj(distalOriginOrientQuat)));
distalFusion.degree = eulerd(distalFusion.orientQuat, app.rotationDropDown.Value, 'frame');



% --- PROXIMAL SENSOR --- %
% static orientation
[proximalStaticFusion, debugPlotFigure] = getGlobalOrientation(app, data.proxAccStatic, data.proxGyrStatic, data.proxMagStatic,...
app.calibStaticStartFrame, app.calibStaticEndFrame, app.calibRateIn, sensorNames.proximal, app.magCalTable);
app.debugFigures = [app.debugFigures, debugPlotFigure];
if isequal(app.SaveDiagnosticPlotCheckBox.Value, 1)
    saveas(debugPlotFigure, sprintf('%s%s%s%s_motiondebug', app.plotOutPath, filesep, app.debugTitle, "proximal"),'jpg');
    plotStaticCalibration(app, baseStaticFusion, proximalStaticFusion, distalStaticFusion);
end


% establish transformation quaternion of proximal sensor in the segment frame
proximalOriginOrientQuat = quatmultiply(quatconj(q_os), compact(meanrot(proximalStaticFusion.fusion)));

% proximal sensor movement
[proximalFusion, debugPlotData] = getGlobalOrientation(app, data.proxAcc, data.proxGyr, data.proxMag,...
trialStartFrame, trialEndFrame, app.trialRateIn, sensorNames.proximal, app.magCalTable);
app.debugFigures = [app.debugFigures, debugPlotData];

% transform orientation of proximal sensor into segment frame at each time point
proximalFusion.orientQuat = quaternion(quatmultiply(quatnormalize(compact(proximalFusion.fusion)), quatconj(proximalOriginOrientQuat)));
proximalFusion.degree = eulerd(proximalFusion.orientQuat, app.rotationSequence, 'frame');



% --- REALTIVE JOINT ANGLE --- %
jointAngle.quat = quatmultiply(quatconj(compact(proximalFusion.orientQuat)), compact(distalFusion.orientQuat));
jointAngle.time = proximalFusion.time;

[rad1, rad2, rad3] = quat2angle(jointAngle.quat, app.rotationSequence); 
jointAngle.radian = [rad1, rad2, rad3]; %sagittal, frontal, transverse (yxz)
jointAngle.degree = (jointAngle.radian*(180/pi));


% --- RESULT PLOTS --- %
% static calibration plots
% debugFigureStaticProximal = figure('visible','off');
% debugFigureStaticDistal = figure('visible','off');
% app.debugFigures = [app.debugFigures, debugFigureStaticProximal, debugFigureStaticDistal];

% main joint angle
mainFigure = figure('visible','off');
set(gca,'position',[0.07 0.07 0.92 0.88]);
time = distalFusion.time / app.trialRateIn;
[angles_to_plot, planes] = getAnglesToPlot(jointAngle.degree, app.legendArray);
jointTitle = generatePlotTitle(joint);

if isequal(app.settingsAutoRadio.SelectedObject.Text, "Auto")
    plot(time, angles_to_plot, "Parent", app.TrialAxes)
    app.TrialAxes.Title.String = strcat(jointTitle, " angle");
else
    plot(time, angles_to_plot, "Parent", app.TrialAxes2)
    app.TrialAxes2.Title.String = strcat(jointTitle, " angle");
end

% apply filter if requested. 1) Try dropdown -> 2) try file dir
if ~isequal(app.filterTypeDropDown.Value, "None")
   angles_to_plot = applyFilter(app, angles_to_plot);
elseif ~isempty(app.filterFile)
    angles_to_plot = applyFilterFile(app, angles_to_plot);
end

plot(time, angles_to_plot)
title([app.rotationSequence, strcat(jointTitle, " angle")])
xlabel('frames');
ylabel('(deg)');
legend(app.legendArray);
hold off;

app.outputTime = time;
app.outputFrame = linspace(1, length(time), length(time)).';
app.outputJointAngle = angles_to_plot;
app.planes = planes;

% --- PLOT AND DATA EXPORTS --- %

saveas(mainFigure, sprintf('%s%s%s%s', app.plotOutPath, filesep, app.plotfiletitle, app.plotJoint),'jpg');

