function [ ] = idea( m,n )
%%m=imread('C:\Users\Student\Desktop\myImRotate\Penguins.jpg');
%%m=rgb2gray(m);
%%m=double(m);
%%m=m/255;
%%imshow(m);

syms tata,sum=0;
[r,c]=size(m);
for i=0 :1: n
   tata=rand()*360;
   sum=sum+tata;
   m=bilinear(m,tata);
    m=cutM(m);
    figure;
  imshow(m);
end
sum=rem(sum,360);
tata=360-sum;
m=bilinear(m,tata);
m=cutM(m);
[NewR,NewC]=size(m);
Rcut=ceil((NewR-r));
Ccut=ceil((NewC-c));
for i=0 : 1 : Rcut
   
    m(NewR-i,:)=[];  
end
for i=1 : 1 : Rcut
    m(1,:)=[];
    
end
for i=0 : 1 : Ccut 
    m(:,NewC-i)=[];
    
end
for i=1 : 1 : Ccut
    m(:,1)=[];
    
end
imshow(m);
end

