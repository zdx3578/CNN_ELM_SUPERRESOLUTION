clear all; close all; clc
time = zeros(1,10);
for i = 1:10
tic
a= magic(3000);
b = magic(3000);
c = a*b;
time(i) = toc;
end
time
x = 1:1:10;
plot(x,time);
