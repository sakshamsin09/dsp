%%% Matlab code for Crosscorrelation
%%% Crosscorrelation check how much similarlity between two different
%%% signals with time delay in one of the signals  x(n) and h(n-3)

clc;  % clear screen 
clear all;  % clear workspace 
close all;  % close all figure windows
x = [1,2,3,4];
h = [1,2,5,4];
h= fliplr(h);    %% flipped left to right %% example h = 1,2,5,4 becomes 4,5,2,1
                 %% we do fliplr here because fliplr of linear convolution is same as correlation
                 %%% This code is exactly same as linear convolution except
                 %%% we fliplr
                 
n1 = length(x);  %% length means number of sample of x(n)
n2 = length(h);
N = n1+n2-1;   %% length of linear convolved sequence or output signal/sequence

x = [x,zeros(1,(N-n1))]; %% append zero at end of x(n) to make same length with h(n)
h = [h,zeros(1,(N-n2))]; 
y = zeros(1,N)   %% y is the open sequence/signal or convolved signal

for i = 1:N
    for k = 1:i
        y(i) = y(i)+x(k)*h(i-k+1)   %%% here we are using convolution formula
    end
end