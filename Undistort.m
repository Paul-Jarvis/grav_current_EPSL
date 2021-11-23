function Undistort(imgDir, paramFile, outDir)
%Undistort Undistort images to be used in the manuscript

%% Input parameters %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
imgDir = Directory containing photos

paramFile = Parameter file of camera used to capture images

outDir = Directory to contain undistorted photos
%}

%% Get list of images in directory
dir_inf = dir(imgDir);
fileNames = {dir_inf.name};
fileNames = {fileNames{3:end}};

%% Read in camera parameters
load(paramFile);
%% Undistort each image
for i = 1:size(fileNames, 2)
    %Read image
    fileName = strcat(imgDir, '/', fileNames{i});
    img = imread(fileName);
    
    %Undistort image
    newImg = undistortImage(img, cameraParams);
    
    %Crop image
    if i == 1
        [newImg, crop_stats] = imcrop(newImg);
    else
        newImg = imcrop(newImg, crop_stats);
    end
    %Output image
    outFile = strcat(outDir, '/', fileNames{i});
    imwrite(newImg, outFile);
end

end

