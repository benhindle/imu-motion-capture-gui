# Matlab-based IMU Motion Capture GUI
This repository provides researchers with a code base and graphical user interface (GUI) for capturing lower limb biomechanics using IMU motion capture techniques outlined in:

_Hindle, B.R.; Keogh, J.W.L.; Lorimer, A.V. Validation of Spatiotemporal and Kinematic Measures in Functional Exercises Using a Minimal Modeling Inertial Sensor Methodology. Sensors 2020, 20, 4586. https://doi.org/10.3390/s20164586_

## Functionality
Current functionality:
- Process synced data collected via Vicon Nexus from IMeasureU Blue Trident units.
- 3D hip, knee and ankle bilateral kinematic output.
- Apply custom filters to data.
- Custom calibration duration.
- Set data sample rate.
- Output plot and csv data.

Future functionality:
- Process data collected directly to IMeasureU Blude Trident units.
- Process data collected via the Vicon Capture.U application.

## Requirements
In addition to a minimum version of Matlab 2020a, the following Matlab toolboxes are required to run the application:
- Aerospace Toolbox
- Sensor Fusion and Tracking Toolbox

## Support
_Please note_ this repository is not currently maintained, however, pull requests will be considered. There are some placeholder buttons within the application that will not function, resulting in the application erroring in the Matlab console. One such error path will be encountered from the dropdown menu presented on the `Setup` window - only the `Vicon` option is functional.

