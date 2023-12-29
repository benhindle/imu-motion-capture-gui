function displaySensorLocation(app, show)
    app.sensorLocationImage.ImageSource = sprintf('assets%ssensorLocation.png', filesep);
    app.sensorLocationImage.Visible = show;
    app.sensorDescriptionLabel.Visible = show;
    app.sensorDescriptionLabel2.Visible = show;
    app.sensorLocations.Visible = show;
end