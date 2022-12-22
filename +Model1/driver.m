%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'Model1';
M_.dynare_version = '5.3';
oo_.dynare_version = '5.3';
options_.dynare_version = '5.3';
%
% Some global variables initialization
%
global_initialization;
M_.exo_names = cell(4,1);
M_.exo_names_tex = cell(4,1);
M_.exo_names_long = cell(4,1);
M_.exo_names(1) = {'eps_c'};
M_.exo_names_tex(1) = {'eps\_c'};
M_.exo_names_long(1) = {'eps_c'};
M_.exo_names(2) = {'eps_x'};
M_.exo_names_tex(2) = {'eps\_x'};
M_.exo_names_long(2) = {'eps_x'};
M_.exo_names(3) = {'eps_cf'};
M_.exo_names_tex(3) = {'eps\_cf'};
M_.exo_names_long(3) = {'eps_cf'};
M_.exo_names(4) = {'eps_xf'};
M_.exo_names_tex(4) = {'eps\_xf'};
M_.exo_names_long(4) = {'eps_xf'};
M_.endo_names = cell(29,1);
M_.endo_names_tex = cell(29,1);
M_.endo_names_long = cell(29,1);
M_.endo_names(1) = {'dc'};
M_.endo_names_tex(1) = {'dc'};
M_.endo_names_long(1) = {'dc'};
M_.endo_names(2) = {'dd'};
M_.endo_names_tex(2) = {'dd'};
M_.endo_names_long(2) = {'dd'};
M_.endo_names(3) = {'dy'};
M_.endo_names_tex(3) = {'dy'};
M_.endo_names_long(3) = {'dy'};
M_.endo_names(4) = {'f'};
M_.endo_names_tex(4) = {'f'};
M_.endo_names_long(4) = {'f'};
M_.endo_names(5) = {'CE'};
M_.endo_names_tex(5) = {'CE'};
M_.endo_names_long(5) = {'CE'};
M_.endo_names(6) = {'ce'};
M_.endo_names_tex(6) = {'ce'};
M_.endo_names_long(6) = {'ce'};
M_.endo_names(7) = {'m'};
M_.endo_names_tex(7) = {'m'};
M_.endo_names_long(7) = {'m'};
M_.endo_names(8) = {'pd'};
M_.endo_names_tex(8) = {'pd'};
M_.endo_names_long(8) = {'pd'};
M_.endo_names(9) = {'rd'};
M_.endo_names_tex(9) = {'rd'};
M_.endo_names_long(9) = {'rd'};
M_.endo_names(10) = {'rf'};
M_.endo_names_tex(10) = {'rf'};
M_.endo_names_long(10) = {'rf'};
M_.endo_names(11) = {'u'};
M_.endo_names_tex(11) = {'u'};
M_.endo_names_long(11) = {'u'};
M_.endo_names(12) = {'x'};
M_.endo_names_tex(12) = {'x'};
M_.endo_names_long(12) = {'x'};
M_.endo_names(13) = {'dcf'};
M_.endo_names_tex(13) = {'dcf'};
M_.endo_names_long(13) = {'dcf'};
M_.endo_names(14) = {'ddf'};
M_.endo_names_tex(14) = {'ddf'};
M_.endo_names_long(14) = {'ddf'};
M_.endo_names(15) = {'dyf'};
M_.endo_names_tex(15) = {'dyf'};
M_.endo_names_long(15) = {'dyf'};
M_.endo_names(16) = {'ff'};
M_.endo_names_tex(16) = {'ff'};
M_.endo_names_long(16) = {'ff'};
M_.endo_names(17) = {'CEf'};
M_.endo_names_tex(17) = {'CEf'};
M_.endo_names_long(17) = {'CEf'};
M_.endo_names(18) = {'cef'};
M_.endo_names_tex(18) = {'cef'};
M_.endo_names_long(18) = {'cef'};
M_.endo_names(19) = {'mf'};
M_.endo_names_tex(19) = {'mf'};
M_.endo_names_long(19) = {'mf'};
M_.endo_names(20) = {'pdf'};
M_.endo_names_tex(20) = {'pdf'};
M_.endo_names_long(20) = {'pdf'};
M_.endo_names(21) = {'rdf'};
M_.endo_names_tex(21) = {'rdf'};
M_.endo_names_long(21) = {'rdf'};
M_.endo_names(22) = {'rff'};
M_.endo_names_tex(22) = {'rff'};
M_.endo_names_long(22) = {'rff'};
M_.endo_names(23) = {'uf'};
M_.endo_names_tex(23) = {'uf'};
M_.endo_names_long(23) = {'uf'};
M_.endo_names(24) = {'xf'};
M_.endo_names_tex(24) = {'xf'};
M_.endo_names_long(24) = {'xf'};
M_.endo_names(25) = {'de'};
M_.endo_names_tex(25) = {'de'};
M_.endo_names_long(25) = {'de'};
M_.endo_names(26) = {'EC'};
M_.endo_names_tex(26) = {'EC'};
M_.endo_names_long(26) = {'EC'};
M_.endo_names(27) = {'rdex'};
M_.endo_names_tex(27) = {'rdex'};
M_.endo_names_long(27) = {'rdex'};
M_.endo_names(28) = {'s'};
M_.endo_names_tex(28) = {'s'};
M_.endo_names_long(28) = {'s'};
M_.endo_names(29) = {'swc'};
M_.endo_names_tex(29) = {'swc'};
M_.endo_names_long(29) = {'swc'};
M_.endo_partitions = struct();
M_.param_names = cell(10,1);
M_.param_names_tex = cell(10,1);
M_.param_names_long = cell(10,1);
M_.param_names(1) = {'gamma'};
M_.param_names_tex(1) = {'gamma'};
M_.param_names_long(1) = {'gamma'};
M_.param_names(2) = {'psi'};
M_.param_names_tex(2) = {'psi'};
M_.param_names_long(2) = {'psi'};
M_.param_names(3) = {'delta'};
M_.param_names_tex(3) = {'delta'};
M_.param_names_long(3) = {'delta'};
M_.param_names(4) = {'mu'};
M_.param_names_tex(4) = {'mu'};
M_.param_names_long(4) = {'mu'};
M_.param_names(5) = {'rho'};
M_.param_names_tex(5) = {'rho'};
M_.param_names_long(5) = {'rho'};
M_.param_names(6) = {'rho_vecm'};
M_.param_names_tex(6) = {'rho\_vecm'};
M_.param_names_long(6) = {'rho_vecm'};
M_.param_names(7) = {'alpha'};
M_.param_names_tex(7) = {'alpha'};
M_.param_names_long(7) = {'alpha'};
M_.param_names(8) = {'kappa'};
M_.param_names_tex(8) = {'kappa'};
M_.param_names_long(8) = {'kappa'};
M_.param_names(9) = {'theta'};
M_.param_names_tex(9) = {'theta'};
M_.param_names_long(9) = {'theta'};
M_.param_names(10) = {'lever'};
M_.param_names_tex(10) = {'lever'};
M_.param_names_long(10) = {'lever'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 4;
M_.endo_nbr = 29;
M_.param_nbr = 10;
M_.orig_endo_nbr = 29;
M_.aux_vars = [];
M_ = setup_solvers(M_);
M_.Sigma_e = zeros(4, 4);
M_.Correlation_matrix = eye(4, 4);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
M_.surprise_shocks = [];
M_.heteroskedastic_shocks.Qvalue_orig = [];
M_.heteroskedastic_shocks.Qscale_orig = [];
options_.linear = false;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
M_.nonzero_hessian_eqs = [8 9 12 13 14 15 16 17 19 21 22 23 24 25 26 28 29];
M_.hessian_eq_zero = isempty(M_.nonzero_hessian_eqs);
M_.orig_eq_nbr = 29;
M_.eq_nbr = 29;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 1;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 1;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 0 11 40;
 0 12 0;
 0 13 0;
 1 14 0;
 0 15 0;
 2 16 0;
 0 17 41;
 3 18 0;
 0 19 42;
 0 20 0;
 0 21 43;
 4 22 0;
 0 23 44;
 0 24 0;
 0 25 0;
 5 26 0;
 0 27 0;
 6 28 0;
 0 29 45;
 7 30 0;
 0 31 46;
 0 32 0;
 0 33 47;
 8 34 0;
 0 35 0;
 9 36 0;
 0 37 0;
 10 38 0;
 0 39 0;]';
M_.nstatic = 11;
M_.nfwrd   = 8;
M_.npred   = 10;
M_.nboth   = 0;
M_.nsfwrd   = 8;
M_.nspred   = 10;
M_.ndynamic   = 18;
M_.dynamic_tmp_nbr = [10; 16; 1; 0; ];
M_.model_local_variables_dynamic_tt_idxs = {
};
M_.equations_tags = {
  1 , 'name' , 'dy' ;
  2 , 'name' , 'dyf' ;
  3 , 'name' , 'x' ;
  4 , 'name' , 'xf' ;
  5 , 'name' , 'EC' ;
  6 , 'name' , 'dd' ;
  7 , 'name' , 'ddf' ;
  8 , 'name' , 'f' ;
  9 , 'name' , 'ff' ;
  10 , 'name' , 'dc' ;
  11 , 'name' , 'dcf' ;
  12 , 'name' , '12' ;
  13 , 'name' , '13' ;
  14 , 'name' , 'CE' ;
  15 , 'name' , 'CEf' ;
  16 , 'name' , 'ce' ;
  17 , 'name' , 'cef' ;
  18 , 'name' , 's' ;
  19 , 'name' , 'swc' ;
  20 , 'name' , 'de' ;
  21 , 'name' , '21' ;
  22 , 'name' , '22' ;
  23 , 'name' , '23' ;
  24 , 'name' , '24' ;
  25 , 'name' , '25' ;
  26 , 'name' , '26' ;
  27 , 'name' , 'rdex' ;
  28 , 'name' , '28' ;
  29 , 'name' , '29' ;
};
M_.mapping.dc.eqidx = [6 10 14 18 21 ];
M_.mapping.dd.eqidx = [6 26 ];
M_.mapping.dy.eqidx = [1 10 11 ];
M_.mapping.f.eqidx = [8 10 ];
M_.mapping.CE.eqidx = [12 13 14 16 ];
M_.mapping.ce.eqidx = [16 21 ];
M_.mapping.m.eqidx = [18 20 21 23 25 ];
M_.mapping.pd.eqidx = [26 ];
M_.mapping.rd.eqidx = [25 26 27 ];
M_.mapping.rf.eqidx = [23 27 ];
M_.mapping.u.eqidx = [12 14 21 ];
M_.mapping.x.eqidx = [1 3 5 ];
M_.mapping.dcf.eqidx = [7 11 15 18 22 ];
M_.mapping.ddf.eqidx = [7 29 ];
M_.mapping.dyf.eqidx = [2 10 11 ];
M_.mapping.ff.eqidx = [9 11 ];
M_.mapping.CEf.eqidx = [15 17 ];
M_.mapping.cef.eqidx = [17 22 ];
M_.mapping.mf.eqidx = [18 20 22 24 28 ];
M_.mapping.pdf.eqidx = [29 ];
M_.mapping.rdf.eqidx = [28 29 ];
M_.mapping.rff.eqidx = [24 ];
M_.mapping.uf.eqidx = [13 15 22 ];
M_.mapping.xf.eqidx = [2 4 5 ];
M_.mapping.de.eqidx = [20 ];
M_.mapping.EC.eqidx = [1 2 5 ];
M_.mapping.rdex.eqidx = [27 ];
M_.mapping.s.eqidx = [8 9 18 19 ];
M_.mapping.swc.eqidx = [19 ];
M_.mapping.eps_c.eqidx = [1 5 ];
M_.mapping.eps_x.eqidx = [3 ];
M_.mapping.eps_cf.eqidx = [2 5 ];
M_.mapping.eps_xf.eqidx = [4 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [4 6 8 12 16 18 20 24 26 28 ];
M_.exo_names_orig_ord = [1:4];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(29, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(4, 1);
M_.params = NaN(10, 1);
M_.endo_trends = struct('deflator', cell(29, 1), 'log_deflator', cell(29, 1), 'growth_factor', cell(29, 1), 'log_growth_factor', cell(29, 1));
M_.NNZDerivatives = [90; 69; -1; ];
M_.static_tmp_nbr = [4; 3; 0; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
M_.params(1) = 8.000000e+00;
gamma = M_.params(1);
M_.params(2) = 1.500000e+00;
psi = M_.params(2);
M_.params(3) = 9.825000e-01;
delta = M_.params(3);
M_.params(4) = 2.000000e-02;
mu = M_.params(4);
M_.params(5) = 9.850000e-01;
rho = M_.params(5);
M_.params(6) = 5.000000e-04;
rho_vecm = M_.params(6);
M_.params(7) = 9.700000e-01;
alpha = M_.params(7);
M_.params(8) = 3.233333e+01;
kappa = M_.params(8);
M_.params(9) = (-4.761905e-02);
theta = M_.params(9);
M_.params(10) = 1.010000e+00;
lever = M_.params(10);
%
% INITVAL instructions
%
options_.initval_file = false;
oo_.steady_state(1) = 2.000000e-02;
oo_.steady_state(2) = 2.000000e-02;
oo_.steady_state(3) = 0.000000e+00;
oo_.steady_state(4) = (-1.347422e-01);
oo_.steady_state(5) = 4.414207e-05;
oo_.steady_state(6) = (-1.002810e+01);
oo_.steady_state(7) = (-3.098827e-02);
oo_.steady_state(8) = 4.505428e+00;
oo_.steady_state(9) = 3.098827e-02;
oo_.steady_state(10) = 3.098827e-02;
oo_.steady_state(11) = 1.412585e+00;
oo_.steady_state(12) = 0.000000e+00;
oo_.steady_state(13) = 2.000000e-02;
oo_.steady_state(14) = 2.000000e-02;
oo_.steady_state(15) = 0.000000e+00;
oo_.steady_state(16) = (-1.347422e-01);
oo_.steady_state(17) = 4.414207e-05;
oo_.steady_state(18) = (-1.002810e+01);
oo_.steady_state(19) = (-3.098827e-02);
oo_.steady_state(20) = 4.505428e+00;
oo_.steady_state(21) = 3.098827e-02;
oo_.steady_state(22) = 3.098827e-02;
oo_.steady_state(23) = 1.412585e+00;
oo_.steady_state(24) = 0.000000e+00;
oo_.steady_state(25) = 0.000000e+00;
oo_.steady_state(26) = 0.000000e+00;
oo_.steady_state(27) = 0.000000e+00;
oo_.steady_state(28) = 0.000000e+00;
oo_.steady_state(29) = 5.000000e-01;
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
vcov = [3.499200e-04 1.749600e-05 0 0
1.749600e-05 3.499200e-04 0 0
0 0 6.718464e-06 6.046618e-06
0 0 6.046618e-06 6.718464e-06];  
order   = 3;  


oo_.time = toc(tic0);
disp(['Total computing time : ' dynsec2hms(oo_.time) ]);
if ~exist([M_.dname filesep 'Output'],'dir')
    mkdir(M_.dname,'Output');
end
save([M_.dname filesep 'Output' filesep 'Model1_results.mat'], 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'Model1_results.mat'], 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'Model1_results.mat'], 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'Model1_results.mat'], 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'Model1_results.mat'], 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'Model1_results.mat'], 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save([M_.dname filesep 'Output' filesep 'Model1_results.mat'], 'oo_recursive_', '-append');
end
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
