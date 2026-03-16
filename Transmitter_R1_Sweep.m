clear
clc
close all

%% --- Circuit Parameters ---
Vplus = 5;          % Op-amp supply (V)
v1 = 2.5;           % reference voltage (V)

R2 = 2e3;           % 2 kOhm
R3 = 10e3;          % 10 kOhm
R1 = 10e3;          % Choose one R1 for this simulation

% Hysteresis band
deltaV = 2*(R2/R3)*Vplus;

%% --- Water tank model ---
tank_height = 1;              % normalized height (0–1)

water_level = linspace(0,1,100);   % 0% to 100% full

%% --- Capacitance vs water level ---
% Assume capacitance varies between these values

C_empty = 8e-9;       % 8 nF (tank empty)
C_full  = 10e-9;      % 10 nF (tank full)

C = C_empty + (C_full - C_empty).*water_level;

%% --- Oscillation frequency ---
f = (Vplus - v1) ./ (2*deltaV*R1.*C);

%% --- Plot frequency vs water level ---
figure
plot(water_level*100 , f/1000,'LineWidth',2)

grid on
xlabel('Water Level (%)')
ylabel('Oscillation Frequency (kHz)')
title('Oscillation Frequency vs Water Level')

%% --- Display some values
disp('Water Level (%)   Capacitance (nF)   Frequency (kHz)')
disp([water_level(1:10:end)'*100   C(1:10:end)'*1e9   f(1:10:end)'/1000])