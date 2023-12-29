function [data, sensorNames] = createDataObject(app, joint)

sensorNames.base = app.viconBaseDropDown.Value;

switch(joint)
   case 'hip_L' 
      sensorNames.proximal = app.viconPelvisDropDown.Value;
      sensorNames.distal = app.viconThighLDropDown.Value;
   case 'hip_R' 
      sensorNames.proximal = app.viconPelvisDropDown.Value;
      sensorNames.distal = app.viconThighRDropDown.Value;
   case 'knee_L' 
      sensorNames.proximal = app.viconThighLDropDown.Value;
      sensorNames.distal = app.viconShankLDropDown.Value;
   case 'knee_R'
      sensorNames.proximal = app.viconThighRDropDown.Value;
      sensorNames.distal = app.viconShankRDropDown.Value;
   case 'ankle_L' 
      sensorNames.proximal = app.viconShankLDropDown.Value;
      sensorNames.distal = app.viconFootLDropDown.Value;
   case 'ankle_R' 
      sensorNames.proximal = app.viconShankRDropDown.Value;
      sensorNames.distal = app.viconFootRDropDown.Value;
   otherwise
      disp("nil returning switch")
end

%% movement data
% filePath_current = strcat(app.trialPath, app.trialFile);
filePath_current = strcat(app.trialPath, app.tempTrialFile);
opts = detectImportOptions(filePath_current);
tableData = readtable(filePath_current, opts);
tableData = rmmissing(tableData);
tableNames = tableData.Properties.VariableNames;

% proximal
accIndex = find(contains(tableNames, sensorNames.proximal + "_Accel"));
accOffset = [accIndex, accIndex+2];
gyrIndex = find(contains(tableNames, sensorNames.proximal + "_Gyro"));
gyrOffset = [gyrIndex, gyrIndex+2];
magIndex = find(contains(tableNames, sensorNames.proximal + "_Mag"));
magOffset = [magIndex, magIndex+2];

data.proxAcc = table2array( tableData(:, accOffset(1):accOffset(2)) ); 
data.proxGyr = table2array( tableData(:, gyrOffset(1):gyrOffset(2)) );
data.proxMag = table2array( tableData(:, magOffset(1):magOffset(2)) );

% distal
accIndex = find(contains(tableNames, sensorNames.distal + "_Accel"));
accOffset = [accIndex, accIndex+2];
gyrIndex = find(contains(tableNames, sensorNames.distal + "_Gyro"));
gyrOffset = [gyrIndex, gyrIndex+2];
magIndex = find(contains(tableNames, sensorNames.distal + "_Mag"));
magOffset = [magIndex, magIndex+2];

data.distAcc = table2array( tableData(:, accOffset(1):accOffset(2)) );
data.distGyr = table2array( tableData(:, gyrOffset(1):gyrOffset(2)) );
data.distMag = table2array( tableData(:, magOffset(1):magOffset(2)) );

% base
accIndex = find(contains(tableNames, sensorNames.base + "_Accel"));
accOffset = [accIndex, accIndex+2];
gyrIndex = find(contains(tableNames, sensorNames.base + "_Gyro"));
gyrOffset = [gyrIndex, gyrIndex+2];
magIndex = find(contains(tableNames, sensorNames.base + "_Mag"));
magOffset = [magIndex, magIndex+2];

data.baseAcc = table2array( tableData(:, accOffset(1):accOffset(2)) );
data.baseGyr = table2array( tableData(:, gyrOffset(1):gyrOffset(2)) );
data.baseMag = table2array( tableData(:, magOffset(1):magOffset(2)) );



%% static data
CalFileImport = strcat(app.calibStatPath, app.tempCalibStatFile);
opts = detectImportOptions(CalFileImport);
staticCalData = readtable(CalFileImport,opts);
staticCalData = rmmissing(staticCalData);
staticTableNames = staticCalData.Properties.VariableNames;

% proximal
accIndexStatic = find(contains(staticTableNames, sensorNames.proximal + "_Accel"));
accOffsetStatic = [accIndexStatic, accIndexStatic+2];
gyrIndexStatic = find(contains(staticTableNames, sensorNames.proximal + "_Gyro"));
gyrOffsetStatic = [gyrIndexStatic, gyrIndexStatic+2];
magIndexStatic = find(contains(staticTableNames, sensorNames.proximal + "_Mag"));
magOffsetStatic = [magIndexStatic, magIndexStatic+2];

data.proxAccStatic = table2array( staticCalData(:, accOffsetStatic(1):accOffsetStatic(2)) ); 
data.proxGyrStatic = table2array( staticCalData(:, gyrOffsetStatic(1):gyrOffsetStatic(2)) );
data.proxMagStatic = table2array( staticCalData(:, magOffsetStatic(1):magOffsetStatic(2)) );

% distal
accIndexStatic = find(contains(staticTableNames, sensorNames.distal + "_Accel"));
accOffsetStatic = [accIndexStatic, accIndexStatic+2];
gyrIndexStatic = find(contains(staticTableNames, sensorNames.distal + "_Gyro"));
gyrOffsetStatic = [gyrIndexStatic, gyrIndexStatic+2];
magIndexStatic = find(contains(staticTableNames, sensorNames.distal + "_Mag"));
magOffsetStatic = [magIndexStatic, magIndexStatic+2];

data.distAccStatic = table2array( staticCalData(:, accOffsetStatic(1):accOffsetStatic(2)) ); 
data.distGyrStatic = table2array( staticCalData(:, gyrOffsetStatic(1):gyrOffsetStatic(2)) );
data.distMagStatic = table2array( staticCalData(:, magOffsetStatic(1):magOffsetStatic(2)) );

% base
accIndexStatic = find(contains(staticTableNames, sensorNames.base + "_Accel"));
accOffsetStatic = [accIndexStatic, accIndexStatic+2];
gyrIndexStatic = find(contains(staticTableNames, sensorNames.base + "_Gyro"));
gyrOffsetStatic = [gyrIndexStatic, gyrIndexStatic+2];
magIndexStatic = find(contains(staticTableNames, sensorNames.base + "_Mag"));
magOffsetStatic = [magIndexStatic, magIndexStatic+2];

data.baseAccStatic = table2array( staticCalData(:, accOffsetStatic(1):accOffsetStatic(2)) ); 
data.baseGyrStatic = table2array( staticCalData(:, gyrOffsetStatic(1):gyrOffsetStatic(2)) );
data.baseMagStatic = table2array( staticCalData(:, magOffsetStatic(1):magOffsetStatic(2)) );

end