function [x,y,q]=tr( left, right)
b=.12;
le=2*pi*.025;
l=length(left);
left=left*le;
right=right*le;
dr=0; dl=0; q= zeros(1,l);
 x(1)=0;
 y(1)=0;
 q(1)=0;
for i=2:l
    q(i)= q(i-1)+(dr-dl)/b;
    x(i)= x(i-1)+((dr+dl)/2)*(cos(q(i)+(dr-dl)/(2*b)));
    y(i)=y(i-1)+((dr+dl)/2)*(sin(q(i)+(dr-dl)/(2*b)));
    
   
    dr=right(i)-right(i-1);
    dl=left(i)-left(i-1);

end
Fp=[1 0 -]
end