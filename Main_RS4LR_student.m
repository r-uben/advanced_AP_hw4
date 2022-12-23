%% Solving and Simulating the dynamics of Pareto-weights for RS4LR
% Max 03/24/2012 (updated by Philip 04/04/2013)

%% Housekeeping
clc; clear all; %close all;

%% Calibrations
% 1 and 1001 -> psi=1.5, with and wituout LRR

% Select calibrations stored below. This can be a Vector of calibrations. If you want just
% one calibration, just select one scalar
Calibration_V=[1,1001];

%% Begin big loop
for ppp=1:length(Calibration_V)
    Calibration = Calibration_V(ppp);
    
    %%% Let's choose a name for the files to be saved
    filename0 = ['Model' num2str(Calibration)];
    filename1 = ['Main' num2str(Calibration)];
    
    % IRF options
    IRF_OK    = 1; % 1 if you want the IRF
    
    %% Parameters
    gam   = 8;
    ies   = 1.5;
    del   = .9825;
    mu    = .02;
    rho   = .985;
    alpha = .97;
    kappa = alpha/(1-alpha);
    theta = (1-1/ies)/(1-gam);
    lever = 1.01;
    rho_vecm = .005/10;
    sig_short = .0054*sqrt(12); % sigma(epsx)
    rho_long  = .90; % corr(eps1,eps2)
    
    if Calibration==1 % IES=1.5, CM    
        sig_long  = sig_short*.04*sqrt(12); % sigma(eps1)
        rho_short = .05; % corr(epsx,epsy)
    end
    
    if Calibration==1001 % IES=1.5, CM, no-lrr, recalibrated corr
        sig_long  = 0; % sigma(eps1)
        rho_short = .35; % corr(epsx,epsy)
    end
    
        
        vcov = [sig_short^2 sig_short^2*rho_short 0 0
             sig_short^2*rho_short sig_short^2 0 0
             0 0 sig_long^2 sig_long^2*rho_long
             0 0 sig_long^2*rho_long sig_long^2];
    
    %% Writing the mod file
    disp(['Calibr: ' num2str(Calibration)]);
    disp('Writing and solving the mod...')
    
    fid = fopen([filename0 '.mod'], 'w+');
     
    % FOR STUDENTS TO FILL IN
    fclose(fid);
    
    %% Solving
    eval(['!dynare++ --per 50 --sim 1 ' [[filename0 '.mod']]]);
    load([filename0 '.mat']);
    disp('Solving: done!')
    
    %% Nice IRFs
    if IRF_OK==1;
        % Altering the IRF  %
        % TFP Shock         %
        
        % SHORT-RUN SHOCK to Home
        shocks = [ 0 1*sqrt(dyn_vcov_exo(1,1))*ones(1,1) zeros(1,400-1); zeros(1,401); zeros(1,401); zeros(1,401)];
        tempor = dynare_simul([filename0 '.mat'],shocks);
        dyn_irfp_ec_mean = tempor(:,2:401)-tempor(:,1)*ones(1,400);
        tempor = dynare_simul([filename0 '.mat'],-shocks);
        dyn_irfm_ec_mean = tempor(:,2:401)-tempor(:,1)*ones(1,400);
        % LONG-RUN SHOCK to Home
        PATH = [zeros(1,401); zeros(1,401); 0 1*sqrt(dyn_vcov_exo(3,3))*ones(1,1) zeros(1,400-1); zeros(1,401)];
        tempor = dynare_simul([filename0 '.mat'],PATH);
        dyn_irfp_ex_mean = tempor(:,2:401)-tempor(:,1)*ones(1,400);
        tempor = dynare_simul([filename0 '.mat'],-shocks);
        dyn_irfm_ex_mean = tempor(:,2:401)-tempor(:,1)*ones(1,400);
        
        %% Figures 2 & 5
        % FOR STUDENTS TO FILL IN
        
    end % End IRF
end % end loop on calibrations