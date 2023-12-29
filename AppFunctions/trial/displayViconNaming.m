function displayViconNaming(app, show)
    app.viconNamesA.ImageSource = sprintf('assets%sviconNamesA.png', filesep);
    app.viconNamesB.ImageSource = sprintf('assets%sviconNamesB.png', filesep);
    app.viconNamesA.Visible = show;
    app.viconNamesB.Visible = show;
    app.ViconNameDescription.Visible = show;
end