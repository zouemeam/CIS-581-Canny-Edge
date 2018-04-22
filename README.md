# CIS-581-Canny-Edge
The project focuses on understanding image convolution and edge detection. The final goal of this project 
is to compute the Canny Edges for any RGB image

LocalThreshold takes in the magnitude matrix from find derivatives to compute local high
and low threshold for each pixel in the image. This was accomplished by dividing the image 
into 20x20 windows. Max is found for each window and the values are interpolated to find max for 
each pixel. The output are two matrices, H, and L, containing values for high and low threshold
respectively. 

ColorMap takes in the uint8 matrix for the RGB image. Values of each color channel are extracted, 
and processed with cannyEdge.m. Resulting maps are then recombined to form a RGB image. 
