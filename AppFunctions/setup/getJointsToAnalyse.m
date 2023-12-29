function getJointsToAnalyse(app)
    if app.allDataCheck.Value == 1
        app.joints = ["ankle_R", "ankle_L", "hip_R", "hip_L", "knee_R", "knee_L"];
       
    else
        if app.ankleRDataCheck.Value == 1 || app.ankleUnilateralRCheck.Value == 1 || app.ankleBilateralCheck == 1
            app.joints = [app.joints, "ankle_R"];
        end
        if app.ankleLDataCheck.Value == 1 || app.ankleUnilateralLCheck.Value == 1 || app.ankleBilateralCheck == 1
            app.joints = [app.joints, "ankle_L"];
        end
        if app.hipRDataCheck.Value == 1 || app.hipUnilateralRCheck.Value == 1 || app.hipBilateralCheck.Value == 1
            app.joints = [app.joints, "hip_R"];
        end
        if app.hipLDataCheck.Value == 1 || app.hipUnilateralLCheck.Value == 1 || app.hipBilateralCheck.Value == 1
            app.joints = [app.joints, "hip_L"];
        end
        if app.kneeRDataCheck.Value == 1 || app.kneeUnilateralRCheck.Value == 1 || app.kneeBilateralCheck.Value == 1
            app.joints = [app.joints, "knee_R"];
        end
        if app.kneeLDataCheck.Value == 1 || app.kneeUnilateralLCheck.Value == 1 || app.kneeBilateralCheck.Value == 1
            app.joints = [app.joints, "knee_L"];
        end
    end
end