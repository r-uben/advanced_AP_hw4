function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
% function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = Model1.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(29, 1);
lhs = y(13);
rhs = params(4)+y(4)+params(6)*y(36)+x(it_, 1);
residual(1) = lhs - rhs;
lhs = y(25);
rhs = params(6)*y(36)+params(4)+y(8)+x(it_, 3);
residual(2) = lhs - rhs;
lhs = y(22);
rhs = y(4)*params(5)+x(it_, 2);
residual(3) = lhs - rhs;
lhs = y(34);
rhs = y(8)*params(5)+x(it_, 4);
residual(4) = lhs - rhs;
lhs = y(36);
rhs = x(it_, 3)+y(8)+(1-2*params(6))*y(9)-(y(4)+x(it_, 1));
residual(5) = lhs - rhs;
lhs = y(12);
rhs = params(4)+params(10)*(y(11)-params(4));
residual(6) = lhs - rhs;
lhs = y(24);
rhs = params(4)+params(10)*(y(23)-params(4));
residual(7) = lhs - rhs;
lhs = y(14);
rhs = log(T(1))*(-params(7))+log(T(2))*(params(7)-1);
residual(8) = lhs - rhs;
lhs = y(26);
rhs = (params(7)-1)*log(1+params(8)*exp(y(38)))-params(7)*log(T(4));
residual(9) = lhs - rhs;
lhs = y(11);
rhs = y(14)-y(1)+y(13)*params(7)+y(25)*(1-params(7));
residual(10) = lhs - rhs;
lhs = y(23);
rhs = y(26)-y(5)+y(13)*(1-params(7))+y(25)*params(7);
residual(11) = lhs - rhs;
lhs = exp(T(5)*y(21));
rhs = T(6);
residual(12) = lhs - rhs;
lhs = exp(T(5)*y(33));
rhs = T(6);
residual(13) = lhs - rhs;
lhs = y(15);
rhs = exp((y(43)+y(40))*(1-params(1)));
residual(14) = lhs - rhs;
lhs = y(27);
rhs = exp((1-params(1))*(y(47)+y(44)));
residual(15) = lhs - rhs;
lhs = y(16);
rhs = log(y(15));
residual(16) = lhs - rhs;
lhs = y(28);
rhs = log(y(27));
residual(17) = lhs - rhs;
lhs = y(38);
rhs = y(11)+y(10)+y(17)-y(29)-y(23);
residual(18) = lhs - rhs;
lhs = y(39);
rhs = exp(y(38))/(1+exp(y(38)));
residual(19) = lhs - rhs;
lhs = y(35);
rhs = y(29)-y(17);
residual(20) = lhs - rhs;
lhs = exp(y(17));
rhs = T(7)*T(9)/exp(y(2)*(1-params(9)));
residual(21) = lhs - rhs;
lhs = exp(y(29));
rhs = T(10)*exp(T(8)*(y(23)+y(33)))/exp((1-params(9))*y(6));
residual(22) = lhs - rhs;
lhs = 1/exp(y(20));
rhs = exp(y(41));
residual(23) = lhs - rhs;
lhs = 1/exp(y(32));
rhs = exp(y(45));
residual(24) = lhs - rhs;
lhs = 1;
rhs = exp(y(41)+y(42));
residual(25) = lhs - rhs;
lhs = exp(y(19));
rhs = (1+exp(y(18)))/exp(y(3))*exp(y(12));
residual(26) = lhs - rhs;
lhs = y(37);
rhs = y(19)-y(20);
residual(27) = lhs - rhs;
lhs = 1;
rhs = exp(y(45)+y(46));
residual(28) = lhs - rhs;
lhs = exp(y(31));
rhs = (1+exp(y(30)))/exp(y(7))*exp(y(24));
residual(29) = lhs - rhs;

end
