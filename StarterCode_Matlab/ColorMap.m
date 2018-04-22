function OutPut = ColorMap(rgb)
%%  Description
%       function used to create color map of canny edge detection result
%%  Input: 
%        rgb = (H, W, 3), uint8 matrix, the input RGB image
%
%%  Output:
%        OutPut = (H, W, 3), uint8 matrix, the color map result.
%
    
    OutPut=zeros(size(rgb,1),size(rgb,2),size(rgb,3));%Preallocate function output
    Red=rgb;%Define red channel
    Blue=rgb;%Define blue channel
    Green=rgb;%Define green channel
    
    
    Red(:,:,2)=0.001*Red(:,:,2);%Accentuate red by minimizing the other two channels
    Red(:,:,3)=0.001*Red(:,:,3);%*
    Green(:,:,1)=0.001*Green(:,:,1);%Accentuate green
    Green(:,:,3)=0.001*Green(:,:,3);%*
    Blue(:,:,2)=0.001*Blue(:,:,2);%*Accentaute blue
    Blue(:,:,1)=0.001*Blue(:,:,1);%*
    
    Red_ED=cannyEdge(Red);%Obtain result of canny edge for red, green and blue
    Green_ED=cannyEdge(Green);
    Blue_ED=cannyEdge(Blue);
    
    OutPut(:,:,1)=uint8(Red_ED);%Combine results
    OutPut(:,:,2)=uint8(Green_ED);
    OutPut(:,:,3)=uint8(Blue_ED);
    
    imagesc(OutPut);%plot
end