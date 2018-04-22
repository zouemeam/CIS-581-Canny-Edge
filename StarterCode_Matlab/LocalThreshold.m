function [H,L]=LocalThreshold(Mag)
%%  Description
%       function used to compute local high and low threshold for each
%       pixel
%%  Input: 
%        Mag = (H, W), uint8 matrix, the input magnitude of grayscale image

%
%%  Output:
%        H = (H, W), double matrix, the output contains high threshold value for each pixel.
%        L = (H, W), double matrix, the output contains low threshold value for each pixel.

[row,col]=size(Mag);%Extract size of the image
nr=ones(1,int8(row/20))*20;%create vectors to segment image into windows
nc=ones(1,int8(col/20))*20;%
nr=[nr,1];%
nc=[nc,1];%

Max=zeros(length(nr), length(nc));%Declare a variable to store max value of each window
Mcell=mat2cell(Mag, nr, nc);%Segment image into windows 
for i=1:size(Mcell,1)%Compute max of each window 
    for j=1:size(Mcell,2)
        Max(i,j)=max(max(cell2mat(Mcell(i,j))));
    end
end

x=10:20:col;%Create input vectors for meshgrid of max values 
y=10:20:row;
x=[x,col];
y=[y,row];

xq=1:1:col;%Create input vectors for meshgrid of query points 
yq=1:1:row;

[X,Y]=meshgrid(x,y);%Create meshgrids
[Xq,Yq]=meshgrid(xq,yq);

Maximum=interp2(X,Y,Max,Xq,Yq);%Determine max value for each pixel 

H=0.135*Maximum;%Compute high and low threshold for each pixel
L=0.5*H;

end