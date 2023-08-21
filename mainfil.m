%Instructions to run the script
%Please run this script, the other script contains the function
%Do not change the name of the other file,it is same as the function name


initial_concentration_of_species = [4.30,0,0,0.957,0,0,0,0,0,0,0,0,0,0,0];

% Time interval for solving the odes

time_interval_for_integration = [0,2];

% Solve the equations using the ode solver
% We use ode23s here because the system we are solving is a stiff system

[time, solutions] = ode23s(@equations_1, time_interval_for_integration, initial_concentration_of_species);
plot(time,solutions(:,1)) 


% Change the above line of code from (:,1) to (:,2) to get the plot for CH3
% (:,3) would give the plot for H
% (:,4) would give the plot for ZnCl2
% (:,5) would give the plot for ZnCl
% (:,6) would give the plot for Cl
% (:,7) would give the plot for CH3ZnCl and so on for HCl,H2,CH3Cl,C2H6
% HZnCl ,ZnCH3 ,CH2ZnCl and Cl2



xlabel('time (in seconds)');
ylabel('Concentration of CH4 in (in mol/m3)');

