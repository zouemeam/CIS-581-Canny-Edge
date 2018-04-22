function [Mag, Magx, Magy, Ori] = findDerivatives(I_gray)
%%  Description
%       compute gradient from grayscale image 
%%  Input: 
%         I_gray = (H, W), double matrix, grayscale image matrix 
%
%%  Output:
%         Mag  = (H, W), double matrix, the magnitued of derivative%  
%         Magx = (H, W), double matrix, the magnitude of derivative in x-axis
%         Magx = (H, W), double matrix, the magnitude of derivative in y-axis
% 				Ori = (H, W), double matrix, the orientation of the derivative
%
%% ****YOU CODE STARTS HERE**** 

%Define Sobel operators for calculation of horizontal and vertical
%derivatives
 dx=[-1,0,1;
     -2,0,2;
     -1,0,1];
 dy=[1,2,1;
     0,0,0;
     -1,-2,-1];
sigma=1; %Define standard deviation of guassian filter
I_gray=double(imgaussfilt(I_gray,sigma));%Smooth the image with gaussian filter
Magx = imfilter(I_gray, double(dx),'conv', 'replicate');%Compute horizontal derivative 
Magy = imfilter(I_gray, double(dy),'conv', 'replicate');%Compute vertical derivative
Mag=sqrt(Magx.^2+Magy.^2);%Compute magnitude of derivatives
Ori=atan2(Magy, Magx);%Compute orientation of derivatives
end