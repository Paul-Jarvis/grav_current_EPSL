%% GC45
%{
%Left
imgDir = 'GC45/left_raw';
cameraParams = '/media/paul/Geneva1/experimental/camera_calib/DSLR/dslr.mat';
outDir = 'GC45/left_undistort';
Undistort(imgDir, cameraParams, outDir);

%Right
imgDir = 'GC45/right_raw';
cameraParams = '/media/paul/Geneva1/experimental/camera_calib/hi_res/hi_res.mat';
outDir = 'GC45/right_undistort';
Undistort(imgDir, cameraParams, outDir);
%}


%% GC48

%Left
imgDir = 'GC48/left_raw';
cameraParams = '/media/paul/Geneva1/experimental/camera_calib/DSLR/dslr.mat';
outDir = 'GC48/left_undistort';
Undistort(imgDir, cameraParams, outDir);

%Right
imgDir = 'GC48/right_raw';
cameraParams = '/media/paul/Geneva1/experimental/camera_calib/hi_res/hi_res.mat';
outDir = 'GC48/right_undistort';
Undistort(imgDir, cameraParams, outDir);

