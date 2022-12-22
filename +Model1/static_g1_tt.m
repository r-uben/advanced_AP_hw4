function T = static_g1_tt(T, y, x, params)
% function T = static_g1_tt(T, y, x, params)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%
% Output:
%   T         [#temp variables by 1]  double   vector of temporary terms
%

assert(length(T) >= 7);

T = Model1.static_resid_tt(T, y, x, params);

T(5) = params(3)*exp((-y(1))/params(2))*T(3)*T(4);
T(6) = (-(params(3)*getPowerDeriv(y(5),params(9),1)));
T(7) = params(3)*exp((-y(13))/params(2))*T(3)*exp((y(13)+y(23))*T(3));

end
