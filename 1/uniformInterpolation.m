function [  ] = uniformInterpolation( m,n )
%%m=imread('C:\Users\Student\Desktop\myImRotate\Penguins.jpg');
%%m=rgb2gray(m);
%%m=double(m);
%%m=m/255;
%%imshow(m);
syms teta,sum=0;
for i=0 :1: n
   teta=rand()*360;
   sum=sum+teta;
   m=myImRotate(m,teta);
    m=cutM(m);
    figure;
%%imshow(m);
end
sum=rem(sum,360);
teta=360-sum;
m=myImRotate(m,teta);
m=cutM(m);
imshow(m);
end

