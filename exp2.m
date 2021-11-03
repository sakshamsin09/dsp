%% MATLAB program for linear convolution 

close all;
clear all;
clc;
x = [1,2,3,4]; %% sequence of input x(n) %% this line can
              %% be replaced by x=input('enter the input sequence') 
              %% if you want to enter input sequence from command window
              
              
h = [1,2,1,2,5]; %% sequence of input h(n) %% impluse response

n1 = length(x);  %% length means number of sample of x(n)
n2 = length(h);
N = n1+n1-1;   %% length of linear convolved sequence or output signal/sequence

x = [x,zeros(1,(N-n1))]; %% append zero at end of x(n) to make same length with h(n)
h = [h,zeros(1,(N-n2))]; 
y = zeros(1,N)   %% y is the open sequence/signal or convolved signal or system response

for i = 1:N
    for k = 1:i
        y(i) = y(i)+x(k)*h(i-k+1)   %%% here we are using convolution formula
    end
end
