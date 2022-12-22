%% Housekeeping
clc; clear all;

%% Calibrations

vCal = [1,1001];
K   = length(vCal);


for ppp=1:K

    % Choose one calibration
    cal     = vCal(ppp);
    % Choose a name for the files to be saved
    model   = ['Model' num2str(cal)];
    main    = ['Main' num2str(cal)];
    % IRF? (Y/n)
    prompt  = "Do you want to print the IRF?: (Y/n) ";
    IRF_OK  = input(prompt, 's');
    if contains('yes', lower(IRF_OK))
        IRF_OK = 1;
    else
        IRF_OK = 0;
    end
    % Parameters: General parameters
    global gamma psi delta mu rho alpha kappa theta lever  rho_vecm
    gamma   = 8;
    psi     = 1.5;
    delta   = .9825;
    mu      = .02;
    rho     = .985;
    rho_vecm    = .005/10;
    alpha   = .97;
    kappa   = alpha / (1-alpha);
    theta   = (1-1/psi) / (1-gamma);
    lever   = 1.01;
    general_param_names = ["gamma" "psi" "delta" "mu" "rho" "rho_vecm" "alpha" "kappa" "theta" "lever"];
    general_param_values = [gamma psi delta mu rho rho_vecm alpha kappa theta lever];
    global sigma_short rho_long;
    sigma_short = .0054*sqrt(12);   % sigma(epsx)
    rho_long    = .90;              % corr(eps1,eps2)
    % Parameters: different choice depending on the calibration that has
    % been chosen.
    global sigma_long rho_short
    if cal == 1
        sigma_long  = sigma_short*.04*sqrt(12); % sigma(eps1)
        rho_short   = .05;                      % corr(epsx,epsy)
    elseif cal==1001
        sigma_long  = 0;                        % sigma(eps1)
        rho_short   = .35;                      % corr(epsx,epsy)
    end
    shocks_parameters_names  = ["rho_vecm" "rho_short" "sigma_short" "rho_long" "sigma_long"];
    shocks_parameters_values = [rho_vecm rho_short sigma_short rho_long sigma_short];
    % Model
    equations = dictionary(string([]),string([]));
    % Variance-Covariance matrix
    vcov = [sigma_short^2           sigma_short^2*rho_short 0                           0
            sigma_short^2*rho_short sigma_short^2           0                           0
            0                       0                       sigma_long^2                sigma_long^2*rho_long
            0                       0                       sigma_long^2*rho_long       sigma_long^2];
    %% Writing the mod file
    mod = modFileGenerator;
    disp(['Calibr: ' num2str(cal)]);
    disp('Writing and solving the mod...')
    fid = fopen([model '.mod'], 'w+');
    mod.calibration(fid);
    % Variables
    fprintf(fid, '// Endogenous and exogenous variables \n');
    fbar = -alpha*log(1+1/kappa)+(alpha-1)*log(1+kappa);
    mbar = log(delta)-mu/psi;
    rfbar = -   mbar;
    pdbar = log(exp(-rfbar+mu)/(1-exp(-rfbar+mu)));
    ubar = log((1-delta)/(1-delta*exp((1-1/psi)*mu)))*(1/(1-1/psi));
    CEbar = exp((ubar+mu)*(1-gamma));
    var_names       = ["dc" "dd" "dy" "f" "CE" "ce" "m" "pd" "rd" "rf" "u" "x"];
    var_bar_values  = [mu   mu     0   fbar CEbar log(CEbar) mbar pdbar rfbar rfbar  ubar 0];
    var_names = add_foreign(var_names);
    var_bar_values = [var_bar_values var_bar_values];
    var_names = [var_names ["de" "EC" "rdex" "s" "swc"]];
    var_bar_values = [var_bar_values [0 0 0 0 0.5]];
    initial_values = dictionary(var_names, var_bar_values);
    
    exo_vars      = ["eps_c" "eps_x"];
    exo_vars      = add_foreign(exo_vars);
    mod.variables(fid, var_names, exo_vars);
    % Parameters
    fprintf(fid,'// Parameters\n');
    param_names = general_param_names; %shocks_parameters_names];
    param_values = general_param_values; % shocks_parameters_values];
    params = dictionary(param_names, param_values);
    mod.parameters(fid, params);
    % Model
    fprintf(fid, "// Model\n");
    fprintf(fid, "model; \n");
    % Model: Home and foreign good-endowments
    equations("dy")     = "dy   = mu+x(-1) + eps_c +rho_vecm*EC;";
    equations("dyf")    = "dyf  = mu+xf(-1)+ eps_cf-rho_vecm*EC;";
    equations("x")      = "x    = rho*x(-1) +eps_x;";
    equations("xf")     = "xf   = rho*xf(-1)+eps_xf;";
    % Model: Error correction
    equations("EC")     = "EC   = (1-2*rho_vecm)*EC(-1)+xf(-1)+eps_cf-(x(-1)+eps_c);";
    % Model: Dividends cash flow
    equations("dd")     = "dd   = mu+lever*(dc-mu);";
    equations("ddf")    = "ddf  = mu+lever*(dcf-mu);";
    % Model: Home- and Foreign-consumer share of endowments
    equations("f")      = "f   = log(1 + 1/(kappa*exp(s)))*(-alpha)+log(1+kappa/exp(s))*(alpha-1);";
    equations("ff")     = "ff  = (alpha-1)*log(1+kappa*exp(s))-alpha*log(1+exp(s)/kappa);";
    % Model: Home- and Foreign-consumption growth
    equations("dc")     = "dc  = f-f(-1)+alpha*dy+(1-alpha)*dyf;";
    equations("dcf")    = "dcf = ff-ff(-1)+(1-alpha)*dy+alpha*dyf;";
    % Model: Home- and Foreign-certaint equivalent and utility
    equations("u")  = "exp((1-1/psi)*u)  = (1-delta)+delta*(CE^theta);";
    equations("uf") = "exp((1-1/psi)*uf)  = (1-delta)+delta*(CEf^theta);";
    equations("CE") = "CE = exp((u(+1)+dc(+1))*(1-gamma));";
    equations("ce") = "ce = log(CE);";
    equations("CEf")= "CEf = exp((uf(+1)+dcf(+1))*(1-gamma));";
    equations("cef")= "cef = log(CEf);";
    equations("s")  = "s = s(-1) + m - mf + dc - dcf;";
    equations("swc")= "swc = exp(s) / (1 + exp(s));";
    equations("de") = "de = mf - m;";
    % Model: SDFs & returns
    equations("m")  =      "exp(m)     = delta*exp(-dc/psi)*exp((u+dc)*(1/psi-gamma))/exp(ce(-1)*(1-theta));";
    equations("mf") =      "exp(mf)    = delta*exp(-dcf/psi)*exp((uf+dcf)*(1/psi-gamma))/exp(cef(-1)*(1-theta));";
    equations("rf") =      "1/exp(rf)  = exp(m(+1));";
    equations("rff")=      "1/exp(rff) = exp(mf(+1));";
    equations("extra1") =  "1     = exp(m(+1)+rd(+1));";
    equations("rd") =       "exp(rd)    = (1+exp(pd))/exp(pd(-1))*exp(dd);";
    equations("rdex") = "rdex       = rd-rf;";
    equations("extra2")  = "1 = exp(mf(+1)+rdf(+1));";
    equations("rdf")    = "exp(rdf) = (1+exp(pdf))/exp(pdf(-1))*exp(ddf);";
    mod.model(fid, equations);
    fprintf(fid, "end;\n\n");
    % Initial Values
    fprintf(fid, '// Initial Values\n');
    fprintf(fid, "initval; \n");
    mod.initial_values(fid, initial_values);
    fprintf(fid, "end;\n\n");
    % Variance-Covariance matrix
    fprintf(fid,'vcov = [%e %e 0 0\n', [sigma_short^2 sigma_short^2*rho_short]);
    fprintf(fid,'%e %e 0 0\n', [sigma_short^2*rho_short, sigma_short^2]);
    fprintf(fid,'0 0 %e %e\n', [sigma_long^2, sigma_long^2*rho_long]);
    fprintf(fid,'0 0 %e %e];  \n', [sigma_long^2*rho_long, sigma_long^2]);
    fprintf(fid,'order   = 3;  \n');
    fclose(fid);
    
    %% Solving
    display(model)
    eval(sprintf('!dpp/dynare++ --per 15 --sim 3 --ss-tol 1e-7 %s.mod',model));
    eval(sprintf('load %s.mat',model));
    disp('Solving: done!')



end % end loop on calibrations


%% AUX FUNCTIONS

function list = add_foreign(list)
    for i=1:length(list)
        list = [list strcat(list(i), "f")];
    end
end
