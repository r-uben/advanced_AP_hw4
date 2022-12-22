function residual = static_resid(T, y, x, params, T_flag)
% function residual = static_resid(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = Model1.static_resid_tt(T, y, x, params);
end
residual = zeros(29, 1);
lhs = y(3);
rhs = params(4)+y(12)+params(6)*y(26)+x(1);
residual(1) = lhs - rhs;
lhs = y(15);
rhs = params(6)*y(26)+params(4)+y(24)+x(3);
residual(2) = lhs - rhs;
lhs = y(12);
rhs = y(12)*params(5)+x(2);
residual(3) = lhs - rhs;
lhs = y(24);
rhs = y(24)*params(5)+x(4);
residual(4) = lhs - rhs;
lhs = y(26);
rhs = x(3)+y(24)+y(26)*(1-2*params(6))-(y(12)+x(1));
residual(5) = lhs - rhs;
lhs = y(2);
rhs = params(4)+params(10)*(y(1)-params(4));
residual(6) = lhs - rhs;
lhs = y(14);
rhs = params(4)+params(10)*(y(13)-params(4));
residual(7) = lhs - rhs;
lhs = y(4);
rhs = log(1+1/(params(8)*exp(y(28))))*(-params(7))+log(1+params(8)/exp(y(28)))*(params(7)-1);
residual(8) = lhs - rhs;
lhs = y(16);
rhs = (params(7)-1)*log(1+params(8)*exp(y(28)))-params(7)*log(1+exp(y(28))/params(8));
residual(9) = lhs - rhs;
lhs = y(1);
rhs = y(3)*params(7)+y(15)*(1-params(7));
residual(10) = lhs - rhs;
lhs = y(13);
rhs = y(3)*(1-params(7))+y(15)*params(7);
residual(11) = lhs - rhs;
lhs = exp(T(1)*y(11));
rhs = T(2);
residual(12) = lhs - rhs;
lhs = exp(T(1)*y(23));
rhs = T(2);
residual(13) = lhs - rhs;
lhs = y(5);
rhs = exp((y(1)+y(11))*(1-params(1)));
residual(14) = lhs - rhs;
lhs = y(17);
rhs = exp((1-params(1))*(y(13)+y(23)));
residual(15) = lhs - rhs;
lhs = y(6);
rhs = log(y(5));
residual(16) = lhs - rhs;
lhs = y(18);
rhs = log(y(17));
residual(17) = lhs - rhs;
lhs = y(28);
rhs = y(1)+y(28)+y(7)-y(19)-y(13);
residual(18) = lhs - rhs;
lhs = y(29);
rhs = exp(y(28))/(1+exp(y(28)));
residual(19) = lhs - rhs;
lhs = y(25);
rhs = y(19)-y(7);
residual(20) = lhs - rhs;
lhs = exp(y(7));
rhs = params(3)*exp((-y(1))/params(2))*T(4)/exp(y(6)*(1-params(9)));
residual(21) = lhs - rhs;
lhs = exp(y(19));
rhs = params(3)*exp((-y(13))/params(2))*exp((y(13)+y(23))*T(3))/exp(y(18)*(1-params(9)));
residual(22) = lhs - rhs;
lhs = 1/exp(y(10));
rhs = exp(y(7));
residual(23) = lhs - rhs;
lhs = 1/exp(y(22));
rhs = exp(y(19));
residual(24) = lhs - rhs;
lhs = 1;
rhs = exp(y(7)+y(9));
residual(25) = lhs - rhs;
lhs = exp(y(9));
rhs = (1+exp(y(8)))/exp(y(8))*exp(y(2));
residual(26) = lhs - rhs;
lhs = y(27);
rhs = y(9)-y(10);
residual(27) = lhs - rhs;
lhs = 1;
rhs = exp(y(19)+y(21));
residual(28) = lhs - rhs;
lhs = exp(y(21));
rhs = (1+exp(y(20)))/exp(y(20))*exp(y(14));
residual(29) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
