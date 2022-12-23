%% Housekeeping
clc; clear all;

%% Calibrations

vCal = [1,1001];
K   = length(vCal);


for ppp=1:K

    % Choose one calibration
    cal     = vCal(ppp);
    % Choose a name for the files to be saved
    model   = ['model' num2str(cal)];
    main    = ['Main' num2str(cal)];
    % IRF? (Y/n)
    IRF_OK = InputPromtIRF(cal); 
   
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
    elseif cal==1001 % No long-run risk
        sigma_long  = 0;                        % sigma(eps1)
        rho_short   = .35;                      % corr(epsx,epsy)
    end
    shocks_parameters_names  = ["rho_vecm" "rho_short" "sigma_short" "rho_long" "sigma_long"];
    shocks_parameters_values = [rho_vecm rho_short sigma_short rho_long sigma_long];
    % model
    equations = dictionary(string([]),string([]));
    %% Writing the mod file
    mod = modFileGenerator;
    disp(['Calibr: ' num2str(cal)]);
    fid = fopen([model '.mod'], 'w+');
    mod.calibration(fid);
    % Variables
    fprintf(fid, '// Endogenous and exogenous variables \n');
    % Variables: Initial values
    global fbar mbar rfbar pdbar ubar CEbar cebar xbar
    xbar = 0;
    fbar = -alpha*log(1+1/kappa)+(alpha-1)*log(1+kappa);
    mbar = log(delta)-mu/psi;
    rfbar = -   mbar;
    pdbar = log(exp(-rfbar+mu)/(1-exp(-rfbar+mu)));
    ubar = log((1-delta)/(1-delta*exp((1-1/psi)*mu)))*(1/(1-1/psi));
    CEbar = exp((ubar+mu)*(1-gamma));
    cebar = log(CEbar);
    % Variables: Names
    var_names       = ["dc" "dd" "dy" "f" "CE" "ce" "m" "pd" "rd" "rf" "u" "x"];
    var_bar_values  = [mu   mu   mu   fbar CEbar cebar mbar pdbar rfbar rfbar  ubar xbar];
    var_names = add_foreign_at_the_end(var_names);
    var_bar_values = [var_bar_values var_bar_values];
    var_names = [var_names ["de" "EC" "rdex" "s" "swc"]];
    var_bar_values = [var_bar_values [0 0 0 0 1/2]];
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
    % model
    fprintf(fid, "// model\n");
    fprintf(fid, "model; \n");
    equations = mod_equations(equations);
    mod.model(fid, equations);
    fprintf(fid, "end;\n\n");
    % Initial Values
    fprintf(fid, '// Initial Values\n');
    fprintf(fid, "initval; \n");
    mod.initial_values(fid, initial_values);
    fprintf(fid, "end;\n\n");
    % Variance-Covariance matrix
    fprintf(fid,'vcov = [%e %e 0 0\n',  [sigma_short^2 sigma_short^2*rho_short]);
    fprintf(fid,'%e %e 0 0\n',          [sigma_short^2*rho_short sigma_short^2]);
    fprintf(fid,'0 0 %e %e\n',          [sigma_long^2 sigma_long^2*rho_long]);
    fprintf(fid,'0 0 %e %e];  \n',      [sigma_long^2*rho_long sigma_long^2]);
    fprintf(fid,'order   = 3;  \n');
    fclose(fid);
    %% Solving
    eval(sprintf('!dpp/dynare++ --per 15 --sim 3 --ss-tol 1e-8 %s.mod',model));
    eval(sprintf('load %s.mat',model));

    %% TABLE II

    
    %% IRFs
    if IRF_OK==1 && cal==1
        
        N = 400;
        % SHORT-RUN SHOCK to Home
        shocks = [ 0 sqrt(dyn_vcov_exo(1,1)) zeros(1,N-1); zeros(1,N+1); zeros(1,N+1); zeros(1,N+1)];
        tempor = dynare_simul([model '.mat'],shocks);
        dyn_irfp_ec_mean = tempor(:,2:N+1)-tempor(:,1)*ones(1,N);
        % LONG-RUN SHOCK to Home
        shocks = [zeros(1,N+1); zeros(1,N+1); 0 sqrt(dyn_vcov_exo(3,3)) zeros(1,N-1); zeros(1,N+1)];
        tempor = dynare_simul([model '.mat'],shocks);
        dyn_irfp_ex_mean = tempor(:,2:N+1)-tempor(:,1)*ones(1,N);
        
        %% FIGURE 2

        fig2=figure;
        fig2.Position = [0, 0, 800, 500]; 
        

        subplot(2, 2, 1);
        hold on
        grid on
        plot(1:N, dyn_irfp_ec_mean(dyn_i_dy,:), '-');
        plot(1, dyn_irfp_ec_mean(dyn_i_dy,1),'o','MarkerEdgeColor','red','MarkerFaceColor','red','MarkerSize',5);
        tit  = title('Orthogonalized Short-Run Shock');
        ylab = ylabel('Endowment Growth ($\Delta x$)');
        latex_interpreter(ylab);
        latex_interpreter(tit);
        ax = gca;
        ax.YAxis.Exponent = 0; 
        ax.Box = 'on';
        
        hold off
       
        subplot(2, 2, 2);
        hold on
        grid on
        plot(1:N, dyn_irfp_ex_mean(dyn_i_dy,:), '-');
        plot(1, dyn_irfp_ex_mean(dyn_i_dy,2),'o','MarkerEdgeColor','red','MarkerFaceColor','red','MarkerSize',5);
        tit = title('Orthogonalized Long-Run Shock');
        latex_interpreter(tit);
        ax = gca;
        ax.YAxis.Exponent = 0;
        ax.Box = 'on';
        
        hold off
       
        subplot(2, 2, 3);
        hold on
        grid on
        plot(0:N, [0 dyn_irfp_ec_mean(dyn_i_s,:)], '--', 0:N, [0 dyn_irfp_ec_mean(dyn_i_swc, :)], '-');
        xlab = xlabel('Time');
        latex_interpreter(xlab);
        ax = gca;
        ax.YAxis.Exponent = 0;
        lgd = legend({'Log-Ratio Pareto-weights $(\log{S_t})$','Consumption Share $(SWC_t)$'}, ...
            'FontSize',12, ...
            'Location','southeast');
        latex_interpreter(lgd);
        ax.Box = 'on';
        hold off
       
        subplot(2, 2, 4);
        hold on
        grid on
        plot(0:N, [0 dyn_irfp_ex_mean(dyn_i_s,:)], '--', 0:N, [0 dyn_irfp_ex_mean(dyn_i_swc, :)], '-');
        xlab = xlabel('Time');
        latex_interpreter(xlab);
        ax = gca;
        ax.YAxis.Exponent = 0; 
        lgd = legend({'Log-Ratio Pareto-weights $(\log{S_t})$','Consumption Share $(SWC_t)$'}, ...
            'FontSize',12, ...
            'Location','southeast');
        latex_interpreter(lgd);
        ax.Box = 'on';
        hold off
        
  
        saveas(fig2, 'fig/fig2.eps', 'epsc');
        saveas(fig2, 'fig/fig2.png', 'png');
        
        
        %% FIGURE 5

        fig5=figure;
        fig5.Position = [0.5,0.5, 720, 800];

        subplot(6, 2, 1);
        hold on
        grid on
        plot(0:10, [0 dyn_irfp_ec_mean(dyn_i_dy,1:10)], '-');
        plot(1, dyn_irfp_ec_mean(dyn_i_dy,1),'o','MarkerEdgeColor','red','MarkerFaceColor','red','MarkerSize',4);
        tit = title('Short-Run Shock');
        tit.FontSize = 12;
        ylab = ylabel('$\Delta x$');
        latex_interpreter(tit);
        latex_interpreter(ylab);
        ax = gca;
        ax.YAxis.Exponent = 0; 
        ax.Box = 'on';
        
        hold off
       
        subplot(6, 2, 2);
        hold on
        grid on
        plot(0:10, [0 dyn_irfp_ex_mean(dyn_i_dy,1:10)], '-');
        plot(2, dyn_irfp_ex_mean(dyn_i_dy,2),'o','MarkerEdgeColor','RED','MarkerFaceColor','RED','MarkerSize',4);
        tit = title('Long-Run Shock');
        tit.FontSize = 12;
        latex_interpreter(tit);
        ax = gca;
        ax.YAxis.Exponent = 0; 
        ax.Box = 'on';
        
        hold off
       
        subplot(6, 2, 3);
        hold on
        grid on
        plot(0:10, [0 dyn_irfp_ec_mean(dyn_i_s,1:10)], '-');
        ylab = ylabel('s');
        latex_interpreter(ylab);
        ax = gca;
        ax.Box = 'on';
        ax.YAxis.Exponent = 0; 
        hold off
       
        subplot(6, 2, 4);
        hold on
        grid on
        plot(0:10, [0 dyn_irfp_ex_mean(dyn_i_s,1:10)], '-');
        ax = gca;
        ax.YAxis.Exponent = 0; 
        ax.Box = 'on';
        hold off
 
        subplot(6, 2, 5);
        hold on
        grid on
        h1 = plot(0:10, [0 dyn_irfp_ec_mean(dyn_i_dc,1:10)], '-', 0:10, [0 dyn_irfp_ec_mean(dyn_i_dcf, 1:10)], '--');
        ylab = ylabel('$\Delta c$');
        latex_interpreter(ylab);
        ax = gca;
        ax.YAxis.Exponent = 0; 
        ax.Box = 'on';
        hold off
       
        subplot(6, 2, 6);
        hold on
        grid on
        plot(0:10, [0 dyn_irfp_ex_mean(dyn_i_dc,1:10)], '-', 0:10, [0 dyn_irfp_ex_mean(dyn_i_dcf, 1:10)], '--');
        ax = gca;
        ax.Box = 'on';
        hold off

        subplot(6, 2, 7);
        hold on
        grid on
        plot(0:10, [0 dyn_irfp_ec_mean(dyn_i_de,1:10)], '-');
        ylab = ylabel('$\Delta e$');
        latex_interpreter(ylab);
        ax = gca;
        ax.YAxis.Exponent = 0; 
        ax.Box = 'on';
        hold off

        subplot(6, 2, 8);
        hold on
        grid on
        plot(0:10, [0 dyn_irfp_ex_mean(dyn_i_de,1:10)], '-');
        ax = gca;
        ax.YAxis.Exponent = 0; 
        ax.Box = 'on';
        hold off
       
        subplot(6, 2, 9);
        hold on
        grid on
        plot(0:10, [0 dyn_irfp_ec_mean(dyn_i_m,1:10)], '-', 0:10, [0 dyn_irfp_ec_mean(dyn_i_mf, 1:10)], '--');
        ylab = ylabel('m');
        latex_interpreter(ylab);
        ax = gca;
        ax.YAxis.Exponent = 0; 
        ax.Box = 'on';
        hold off
       
        subplot(6, 2, 10);
        hold on
        grid on
        plot(0:10, [0 dyn_irfp_ex_mean(dyn_i_m,1:10)], '-', 0:10, [0 dyn_irfp_ex_mean(dyn_i_mf, 1:10)], '--');
        ax = gca;
        ax.YAxis.Exponent = 0; 
        ax.Box = 'on';
        hold off

        lgd = legend({'Home','Foreign'}, 'Position', [0.45 0.08 0.1 0.25]);
        lgd.Orientation = 'horizontal';
        lgd.FontSize = 12;
        latex_interpreter(lgd);
        
        saveas(fig5, 'fig/fig5.png', 'png');
        saveas(fig5, 'fig/fig5.eps', 'epsc');
        
    end

end % end loop on calibrations


%% COMPILE THE LATEX FILE
compile;
close(fig2);
close(fig5);

%% AUX FUNCTIONS

function IRF_OK = InputPromtIRF(cal)
    if cal == 1
    prompt  = "Do you want to print the IRF?: (Y/n) ";
    IRF_OK  = input(prompt, 's');
        if contains('yes', lower(IRF_OK))
            IRF_OK = 1;
        else
            IRF_OK = 0;
        end
    else
        IRF_OK = 0;
    end
end

function newlist = add_foreign(list)
    newlist = [];
    N = length(list);
    for i=1:N
        newlist = [newlist [list(i) strcat(list(i), "f")]];
    end
end

function newlist = add_foreign_at_the_end(list)
    newlist = list;
    N = length(list);
    for i=1:N
        newlist = [newlist strcat(list(i), "f")];
    end
end


function equations = mod_equations(equations)
    % model: Home and foreign good-endowments
    equations("dy")     = "dy   = mu+x(-1) + eps_c +rho_vecm*EC;";
    equations("dyf")    = "dyf  = mu+xf(-1)+ eps_cf-rho_vecm*EC;";
    equations("x")      = "x    = rho*x(-1) +eps_x;";
    equations("xf")     = "xf   = rho*xf(-1)+eps_xf;";
    % model: Error correction
    equations("EC")     = "EC   = (1-2*rho_vecm)*EC(-1)+xf(-1)+eps_cf-(x(-1)+eps_c);";
    % model: Dividends cash flow
    equations("dd")     = "dd   = mu+lever*(dc-mu);";
    equations("ddf")    = "ddf  = mu+lever*(dcf-mu);";
    % model: Home- and Foreign-consumer share of endowments
    equations("f")      = "f   = - ( alpha*log(1+exp(-s)/kappa) + (1-alpha)*log(1+kappa*exp(-s)));";
    equations("ff")     = "ff  = - ( alpha*log(1+exp(s)/kappa)+ (1-alpha)*log(1+kappa*exp(s)));";
    % model: Home- and Foreign-consumption growth
    equations("dc")     = "dc  = f-f(-1)+alpha*dy+(1-alpha)*dyf;";
    equations("dcf")    = "dcf = ff-ff(-1)+(1-alpha)*dy+alpha*dyf;";
    % model: Home- and Foreign-certaint equivalent and utility
    equations("u")  = "exp((1-1/psi)*u)  = (1-delta)+delta*(CE^theta);";
    equations("uf") = "exp((1-1/psi)*uf)  = (1-delta)+delta*(CEf^theta);";
    equations("CE") = "CE = exp((u(+1)+dc(+1))*(1-gamma));";
    equations("ce") = "ce = log(CE);";
    equations("CEf")= "CEf = exp((uf(+1)+dcf(+1))*(1-gamma));";
    equations("cef")= "cef = log(CEf);";
    equations("s")  = "exp(s) = exp(s(-1) + m - mf + dc - dcf);";
    equations("swc")= "swc = exp(s) / (1 + exp(s));";
    equations("de") = "exp(de) = exp(mf - m);";
    % model: SDFs & returns
    equations("m")  =      "exp(m)     = delta*exp(-dc/psi)*exp((u+dc)*(1/psi-gamma))/exp(ce(-1)*(1-theta));";
    equations("mf") =      "exp(mf)    = delta*exp(-dcf/psi)*exp((uf+dcf)*(1/psi-gamma))/exp(cef(-1)*(1-theta));";
    equations("rf") =      "1/exp(rf)  = exp(m(+1));";
    equations("rff")=      "1/exp(rff) = exp(mf(+1));";
    equations("extra1") =  "1     = exp(m(+1)+rd(+1));";
    equations("rd") =       "exp(rd)    = (1+exp(pd))/exp(pd(-1))*exp(dd);";
    equations("rdex") = "rdex       = rd-rf;";
    equations("extra2")  = "1 = exp(mf(+1)+rdf(+1));";
    equations("rdf")    = "exp(rdf) = (1+exp(pdf))/exp(pdf(-1))*exp(ddf);";
end



function latex_interpreter(x)
    x.Interpreter = 'latex';
end
function fancy_legend(lgd)
    lgd.Location = 'southeast';
    lgd.Interpreter = 'latex';
    lgd.FontSize = 12;
end

function compile()
    old_path = getenv("PATH");
    setenv('PATH', '/usr/local/texlive/2022/bin/universal-darwin/');
    system('pdflatex -shell-escape Main_RubenFernandez.tex');
    setenv("PATH", old_path);
    setenv('PATH', '/usr/bin/');
    system('open Main_RubenFernandez.pdf');
end