function [x,y,q]=KF( left, right, angle)
b=.12;
le=2*pi*.025;
l=length(left);
left=left*le;
right=right*le;
dr(1)=0; dl(1)=0; q= zeros(1,l);
 x(1)=0;
 y(1)=0;
 q(1)=0;
 dss(1)=(dr(1)-dl(1))/b;
 dqq(1)=(dr(1)+dl(1))/2;

for i=2:l
    dr(i)=right(i)-right(i-1);
    dl(i)=left(i)-left(i-1);
    dss(i)=(dr(i)-dl(i))/b;
    dqq(i)=(dr(i)+dl(i))/2;
    q(i)= q(i-1)+dss(i);
    x(i)= x(i-1)+dqq(i)*(cos(q(i)+dss(i)/2));
    y(i)=y(i-1)+dqq(i)*(sin(q(i)+dss(i)/2));
end
%Fp=[1, 0, (-dss*sin(q+dqq/2));0, 1, dss*cos(q+dqq/2); 0, 0, 1];
df=[0 0 0];
dh=[0 0 1];
q=0;
P=0;
Pk=0;
for i=2:l
    Pk= (eye(1)-'Kk'*dh)*P;
    P=df*Pk*df'+q;
    K=P*dh'/(dh*P*dh'+r);
    Xr(i)=q(i);
    XX(i)=Xr(i)+K(y(i)-63);
    
end


end