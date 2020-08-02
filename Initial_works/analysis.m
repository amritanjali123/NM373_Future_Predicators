close all
clear all

mbSize = 16;
p = 7;
for i = 0:30
     
    [imgI cmap] = imread('3DIMG_07NOV2019_0000_L1C_SGP.tif');
    [imgP cmap] = imread('3DIMG_07NOV2019_0030_L1C_SGP.tif');
    imgI = imgI(:,1:1074);
    imgP = imgP(:,1:1074);
    %imshow(imgI,cmap);
    % Four Step Search
    [motionVect, computations] = motionEst4SS(imgP,imgI,mbSize,p);
    imgComp = motionComp(imgI, motionVect, mbSize);
    SS4psnr(i+1) = imgPSNR(imgP, imgComp, 255);
    SS4computations(i+1) = computations; 
    
    
    % Exhaustive Search
    [motionVect, computations] = motionEstES(imgP,imgI,mbSize,p);
    imgComp = motionComp(imgI, motionVect, mbSize);
    ESpsnr(i+1) = imgPSNR(imgP, imgComp, 255);
    EScomputations(i+1) = computations;
end
