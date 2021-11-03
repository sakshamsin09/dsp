%%% exp.1: GENERATION OF  BASIC SIGNALS  USING MATLAB  

%%% exp.1.(a)Program for the generation of unit impulse signal  
clear all;     %% to clear all the previous data
close all;     %% to close all the dsiplayed figures
clc;           %% to clear all the warning displayed at command window of matlab
N = 5;         %% number of samples at one side of the signal
x = -5:5;      %% Interval of the signal
y = [zeros(1,N),ones(1,1),zeros(1,N)];  %% Generate Impulse signal

%% Plot for continuous unit impulse signal
subplot(3,2,1);                         %% Plot the subfigure (2 = two rows, 2 = two columns, 1= postion of subfigure)
plot(x,y);                              %% plot continuous signal
ylabel('Amplitude');                    %% labeling for y-axis
xlabel('Time (t)');                         %% labeling for x-axis
title('Continuous unit impulse signal');%% Giving tilte name of the subfigure
%% Plot for discrete unit impulse signal
subplot(3,2,2);
stem(x,y);                              %% plot discrete signal
ylabel('Amplitude');
xlabel('Time (n)');
title('Discrete unit impulse signal');

%%% exp.1.(b)Program for the generation of unit step signal   
N=5;   
t=0:N-1;  
y=ones(1,N); 
%% Plot for continuous unit step signal
subplot(3,2,3); 
plot(t,y); 
ylabel('Amplitude');                    
xlabel('Time');                        
title('Continuous unit step signal');
%% Plot for discrete unit step signal
subplot(3,2,4); 
stem(t,y);  
ylabel('Amplitude');                   
xlabel('Time');                        
title('Discrete unit step signal');

%%% exp.1.(c)Program for the generation of unit ramp signal   
N =4;
t=0:N;  
%% Plot for continuous unit ramp signal
subplot(3,2,5); 
plot(t,t); 
ylabel('Amplitude');                  
xlabel('Time');                        
title('Continuous unit ramp signal');
%% Plot for discrete unit rampp signal
subplot(3,2,6); 
stem(t,t);  
ylabel('Amplitude');                   
xlabel('Time');                        
title('Discrete unit ramp signal');






