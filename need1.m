function [sec, left, right, angle]= need1
% sec left right angle
fid=fopen('16_49_27.log','r');
x = textscan(fid, '%n');
x = [x{:}];

n=1;
for i=4:4:length(x)
    
        sec(n)=x(i-3);
        left(n)=x(i-2);
        right(n)=x(i-1);
        angle(n)=x(i);
        n=n+1;

end
fclose(fid);
end