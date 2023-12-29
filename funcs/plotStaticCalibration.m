function plotStaticCalibration(app, baseStaticFusion, proximalStaticFusion, distalStaticFusion)

mainFigure = figure('visible','off');
baseAngle = eulerd(baseStaticFusion.fusion, app.rotationSequence, 'frame');
proximalAngle = eulerd(proximalStaticFusion.fusion, app.rotationSequence, 'frame');
distalAngle = eulerd(distalStaticFusion.fusion, app.rotationSequence, 'frame');

plot(baseStaticFusion.time / app.trialRateIn, baseAngle, "Parent", app.StaticAxes)
hold(app.StaticAxes,'on');
plot(proximalStaticFusion.time / app.trialRateIn, proximalAngle, "Parent", app.StaticAxes)
hold(app.StaticAxes,'on');
plot(distalStaticFusion.time / app.trialRateIn, distalAngle, "Parent", app.StaticAxes)
hold(app.StaticAxes,'off');

hold(app.StaticAxes,'on');
plot(baseStaticFusion.time / app.trialRateIn, baseAngle)
hold(app.StaticAxes,'on');
plot(proximalStaticFusion.time / app.trialRateIn, proximalAngle)
hold(app.StaticAxes,'on');
plot(distalStaticFusion.time / app.trialRateIn, distalAngle)
hold(app.StaticAxes,'off');
saveas(mainFigure, sprintf('%s%s%sstaticdebug', app.plotOutPath, filesep, app.debugTitle),'jpg');