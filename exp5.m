%% exp.5 Matlab code for Sampling Theorem
clc;
close all;
clear all;
fm = 10; %   max frequency   %%%   fm = input('Enter frequency of message signal: ');
fs1 =  5; %%    fs = sampling frequency fs1 < 2fm  %%%%  fs1 = input('Enter frequency of sampling frequency(<2fm): ');
fs2 = 20; %%%    fs2 = 2fm    %%%%   fs2 =input('Enter frequency of sampling frequency(=2fm): ');
fs3 = 40;   %%%%  fs3 > 2fm    %%%  fs3 = input('Enter frequency of sampling frequency(>2fm): ');

%% Plot for continuous signal or message signal or input signal
t = 0:0.001:2;
x = sin(2*pi*fm*t);
subplot(4,2,1);
plot(t,x);
xlabel('Time');
ylabel('Amplitude');
title('Continuous Sine Wave');
subplot(4,2,2);
stem(t,x);
xlabel('Time');
ylabel('Amplitude');
title('Discrete Sine Wave');


%%% Undersampled Reconstructed Signal %%% fs1 < 2fm
t1 = 0:1/fs1:2;
x1 = sin(2*pi*fm*t1);
subplot(4,2,3);
plot(t1,x1);
xlabel('Time');
ylabel('Amplitude');
title('Undersampled Reconstructed Continuous Signal');
subplot(4,2,4);
stem(t1,x1);
xlabel('Time');
ylabel('Amplitude');
title('Undersampled Reconstructed Discrete Signal');


%%% Nyquist rate Signal %%% fs2=2fm
t2 = 0:1/fs2:2;
x2 = sin(2*pi*fm*t2);
subplot(4,2,5);
plot(t2,x2);
xlabel('Time');
ylabel('Amplitude');
title('Nyquist Rate Reconstructed Continuous Signal');
subplot(4,2,6);
stem(t2,x2);
xlabel('Time');
ylabel('Amplitude');
title('Nyquist Rate Reconstructed Discrete Signal');

%%% Oversampled Reconstructed Signal
t3 = 0:1/fs3:2;
x3 = sin(2*pi*fm*t3);
subplot(4,2,7);
plot(t3,x3);
xlabel('Time');
ylabel('Amplitude');
title('Oversampled Reconstructed Continuous Signal');
subplot(4,2,8);
stem(t3,x3);
xlabel('Time');
ylabel('Amplitude');
title('Oversampled Reconstructed Discrete Signal');

