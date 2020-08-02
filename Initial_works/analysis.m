% This script uses all the Motion Estimation algorithms written for the
% final project and save their results.
% The algorithms being used are Exhaustive Search, Three Step Search, New
% Three Step Search, Simple and Efficient Search, Four Step Search, Diamond
% Search, and Adaptive Rood Pattern Search.
%
%
% Aroh Barjatya
% For DIP ECE 6620 final project Spring 2004
close all
clear all
% the directory and files will be saved based on the image name
% Thus we just change the sequence / image name and the whole analysis is
% done for that particular sequence
imageName = 'caltrain';
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
end    
    
    
    % Exhaustive Search
    [motionVect, computations] = motionEstES(imgP,imgI,mbSize,p);
    imgComp = motionComp(imgI, motionVect, mbSize);
    ESpsnr(i+1) = imgPSNR(imgP, imgComp, 255);
    EScomputations(i+1) = computations;
    % Three Step Search
    [motionVect,computations ] = motionEstTSS(imgP,imgI,mbSize,p);
    imgComp = motionComp(imgI, motionVect, mbSize);
    TSSpsnr(i+1) = imgPSNR(imgP, imgComp, 255);
    TSScomputations(i+1) = computations;
    % Simple and Efficient Three Step Search
    [motionVect, computations] = motionEstSESTSS(imgP,imgI,mbSize,p);
    imgComp = motionComp(imgI, motionVect, mbSize);
    SESTSSpsnr(i+1) = imgPSNR(imgP, imgComp, 255);
    SESTSScomputations(i+1) = computations;
    % New Three Step Search
    [motionVect,computations ] = motionEstNTSS(imgP,imgI,mbSize,p);
    imgComp = motionComp(imgI, motionVect, mbSize);
    NTSSpsnr(i+1) = imgPSNR(imgP, imgComp, 255);
    NTSScomputations(i+1) = computations;
    % Four Step Search
    [motionVect, computations] = motionEst4SS(imgP,imgI,mbSize,p);
    imgComp = motionComp(imgI, motionVect, mbSize);
    SS4psnr(i+1) = imgPSNR(imgP, imgComp, 255);
    SS4computations(i+1) = computations;
    % Diamond Search
    [motionVect, computations] = motionEstDS(imgP,imgI,mbSize,p);
    imgComp = motionComp(imgI, motionVect, mbSize);
    DSpsnr(i+1) = imgPSNR(imgP, imgComp, 255);
    DScomputations(i+1) = computations;
    
    % Adaptive Rood Patern Search
    [motionVect, computations] = motionEstARPS(imgP,imgI,mbSize,p);
    imgComp = motionComp(imgI, motionVect, mbSize);
    ARPSpsnr(i+1) = imgPSNR(imgP, imgComp, 255); 
    ARPScomputations(i+1) = computations;

save dsplots2 DSpsnr DScomputations ESpsnr EScomputations TSSpsnr ...
      TSScomputations SS4psnr SS4computations NTSSpsnr NTSScomputations ...
       SESTSSpsnr SESTSScomputations ARPSpsnr ARPScomputations