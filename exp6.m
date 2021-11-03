%%% Matlab code for Z-tranform 

clc;
close all;
clear all;
x = [1 2 4 5] %input('Enter the input sequence: ');
b = 0;
n = length(x);
y = sym('z');
for i = 1:n
    b = b+x(i)*y^(1-i); %% z-transform formula
end
display(x)
display('z Transform of the input sequence: ');
display(sum(b))


