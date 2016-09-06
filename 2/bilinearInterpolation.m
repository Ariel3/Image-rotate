function [  ] = bilinearInterpolation( m,n )
%%m=imread('C:\Users\Student\Desktop\myImRotate\Penguins.jpg');
%%m=rgb2gray(m);
%%m=double(m);
%%m=m/255;
%%imshow(m);
syms tata,sum=0;
for i=0 :1: n
   tata=rand()*360;
   sum=sum+tata;
   m=bilinear(m,tata);
    m=cutM(m);
    figure;
    %%imshow(m);
end
sum=rem(sum,360);
tata=360-sum;
m=bilinear(m,tata);
m=cutM(m);
imshow(m);
end

