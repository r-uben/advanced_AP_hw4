function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double  vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double  vector of endogenous variables in the order stored
%                                                    in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double  matrix of exogenous variables (in declaration order)
%                                                    for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double  vector of steady state values
%   params        [M_.param_nbr by 1]        double  vector of parameter values in declaration order
%   it_           scalar                     double  time period for exogenous variables for which
%                                                    to evaluate the model
%
% Output:
%   T           [#temp variables by 1]       double  vector of temporary terms
%

assert(length(T) >= 26);

T = Model1.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(11) = (-1)/params(2);
T(12) = exp((-y(11))/params(2))*T(11);
T(13) = params(3)*T(12);
T(14) = T(7)*T(8)*T(9);
T(15) = (-(params(3)*getPowerDeriv(y(15),params(9),1)));
T(16) = exp(y(2)*(1-params(9)))*exp(y(2)*(1-params(9)));
T(17) = (-(exp(y(12))*(-((1+exp(y(18)))*exp(y(3))))/(exp(y(3))*exp(y(3)))));
T(18) = (-(exp(y(12))*exp(y(18))/exp(y(3))));
T(19) = params(3)*exp((-y(23))/params(2))*T(11);
T(20) = T(10)*T(8)*exp(T(8)*(y(23)+y(33)));
T(21) = exp((1-params(9))*y(6))*exp((1-params(9))*y(6));
T(22) = (-(exp(y(24))*(-((1+exp(y(30)))*exp(y(7))))/(exp(y(7))*exp(y(7)))));
T(23) = (-(exp(y(24))*exp(y(30))/exp(y(7))));
T(24) = params(8)*exp(y(38))*params(8)*exp(y(38));
T(25) = (-(params(8)*exp(y(38))))/T(24);
T(26) = (-(params(8)*exp(y(38))))/(exp(y(38))*exp(y(38)));

end
