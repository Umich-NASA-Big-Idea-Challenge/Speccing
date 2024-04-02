% ROB 311, Fall 2023
% In-class example
%
% University of Michigan
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
clc
close all

% Load motion profile (motion of output, theta (rad))
load ROB311_modeling_example.mat

% Catapult arm properties
l_a = 1;                        % Arm length (m)
m = 10;                         % Mass of ball (kg_
J_load = m*l_a^2;               % Rotational inertia of arm (kgm^2)

% Transmission properties
eta = 0.8;                      % Transmission efficiency
N = 5;                           % Transmission ratio

% Motor properties - choose these from the MOTOR SPECS.XLS file
L =                             % Winding inductance (H)                      
R =                             % Winding resistance (Ohms)
J =                             % Rotor inertia (kgm^2)
kt =                            % Torque constant (Nm/A)
b =                             % Viscous loss / rotational damping (Nms/rad)
g = 9.81;                       % Gravity (m/s^2)
ddtheta = ddt(dtheta,dt);       % Angular acceleration of output (rad/s^2)

% CALCULATE TORQUE



% CALCULATE CURRENT



% CALCULATE VOLTAGE




% PLOTTING - below uses my variable naming convention; you will need to
% update the variable names if you use a different convention

figure; 
subplot(121)
plot(t,v_w,'linewidth',2)
xlabel('Time (s)')
ylabel('Voltage (V)')
subplot(122)
plot(t,i_w,'linewidth',2)
xlabel('Time (s)')
ylabel('Current (A)')
figure
subplot(121)
plot(t,rad2deg(theta), 'linewidth',2)
xlabel('Time (s)')
ylabel('Theta (^o)')
subplot(122)
plot(t,tau,'linewidth',2)
xlabel('Time (s)')
ylabel('Torque (Nm')



