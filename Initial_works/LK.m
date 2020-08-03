
M = dir('D:\SIH\INSAT3D_TIR1_India\INSAT3D_TIR1_India');
i=3;
%Vy=0;
while i <length(M)-1
    %disp(M(i).name)
    p=M(i).name;
    %q=M(i).name;
    img=imread(strcat('D:\SIH\INSAT3D_TIR1_India\INSAT3D_TIR1_India\',p));
    %im2=imread(strcat('D:\SIH\INSAT3D_TIR1_India\INSAT3D_TIR1_India\',q));
    %e = imread('D:\SIH\INSAT3D_TIR1_India\INSAT3D_TIR1_India\3DIMG_07NOV2019_0000_L1C_SGP.tif');
    %imshow(X,map)
    %frameGray = bgr2gray(img);  
    opticFlow = opticalFlowLK;
   %hs flow = estimateFlow(opticFlow,img/450);

   flow = estimateFlow(opticFlow,img/500);
    imshow(img,[]);
   % opflow = opticalFlow(flow);
    hold on
  %hs  plot(flow,'DecimationFactor',[8 8],'ScaleFactor',1);
   plot(flow,'DecimationFactor',[5 5],'ScaleFactor',1);
   pause(0.00001)
    hold off
    
    
    i=i+1;

end 

%figure,imshow(img/400,[]);
e = imread('D:\SIH\INSAT3D_TIR1_India\INSAT3D_TIR1_India\3DIMG_07NOV2019_2300_L1C_SGP.tif');
g = imread('D:\SIH\INSAT3D_TIR1_India\INSAT3D_TIR1_India\3DIMG_07NOV2019_2330_L1C_SGP.tif');
[x,y]=meshgrid(1:size(e,2),1:size(e,1));
d=interp2(double(e),x+flow.Vx,y+flow.Vy);
%figure,imshow(e,[]);
figure,imshow(g,[]);
%figure,imshow(d,[]);
d=imgaussfilt(d,2);
figure,imshow(d,[]);
i=d-g;
%figure,imshow(i,[]);

M = dir('D:\SIH\INSAT3D_TIR1_India\INSAT3D_TIR1_India');
%MyFolderInfo(2).name
x=zeros(45,1);
y=zeros(45,1);
j=1;
%ls;
length(M);
ptx=0;
pty=0;
dt=0;
for i = 3:length(M)
    %disp(M(i).name)
    p=M(i).name;
    G2=imread(strcat('D:\SIH\INSAT3D_TIR1_India\INSAT3D_TIR1_India\',p));
    binaryImage = true(size(G2));
    measurements = regionprops(binaryImage,G2, 'WeightedCentroid');
    cog = measurements(1).WeightedCentroid;
    t=cog(1);
    x(j)=t;
    y(j)=cog(2);
    if j>0
        ptx=((cog(1)+ptx)/2)+cog(1)-ptx;
        pty=((cog(2)+pty)/2)+cog(2)-pty;
    else
        ptx=cog(1);
        pty=cog(2);
    end    
  % disp([cog(1) cog(2) ptx pty])    
    j=j+1;    
    %cog(1)
end
plot(x,y,'*')
hold on
plot(ptx,pty,'*')

sum = 0.0;
for x=1:984
   for y=1:1074
       if isnan(d(x,y))
           
          %disp([x y]);
       elseif isnan(d(x,y))
           
         % disp([x y]);
      
       else
           difference = (double(g(x,y)) - d(x,y));
           sum = sum + difference*difference;
       end
   end
end

mse = sqrt(sum /(984*1074));
disp(mse);
