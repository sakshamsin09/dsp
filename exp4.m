%%% Matlab code for Autocorrelation
%%% Autocorrelation check how much similarlity in one signal 
%%% signal with its time delay     %%  x(n) and x(n-3)

clc;  % clear screen 
clear all;  % clear workspace 
close all;  % close all figure window
x = [1,2,3,4]; %% this code is exactly same as crosscorrelation except here we use only one input
x= fliplr(x);    %% flipped left to right %% example h = 1,2,5,4 becomes 4,5,2,1

                 %% we do fliplr here because fliplr of linear convolution is same as correlation
                 %%% This code is exactly same as linear convolution except
                 %%% we fliplr                
n1 = length(x);  %% length means number of sample of x(n)
N = 2*n1-1;   %% length of linear convolved sequence or output signal/sequence

x = [x,zeros(1,(N-n1))]; %% append zero at end of x(n) to make same length with h(n)
y = zeros(1,N)   %% y is the open sequence/signal or convolved signal

for i = 1:N
    for k = 1:i
        y(i) = y(i)+x(k)*x(i-k+1)   %%% here we are using convolution formula
    end
end