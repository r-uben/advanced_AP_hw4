function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
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
%   g1
%

if T_flag
    T = Model1.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(29, 51);
g1(1,13)=1;
g1(1,4)=(-1);
g1(1,36)=(-params(6));
g1(1,48)=(-1);
g1(2,25)=1;
g1(2,8)=(-1);
g1(2,36)=(-params(6));
g1(2,50)=(-1);
g1(3,4)=(-params(5));
g1(3,22)=1;
g1(3,49)=(-1);
g1(4,8)=(-params(5));
g1(4,34)=1;
g1(4,51)=(-1);
g1(5,4)=1;
g1(5,8)=(-1);
g1(5,9)=(-(1-2*params(6)));
g1(5,36)=1;
g1(5,48)=1;
g1(5,50)=(-1);
g1(6,11)=(-params(10));
g1(6,12)=1;
g1(7,23)=(-params(10));
g1(7,24)=1;
g1(8,14)=1;
g1(8,38)=(-((-params(7))*T(25)/T(1)+(params(7)-1)*T(26)/T(2)));
g1(9,26)=1;
g1(9,38)=(-((params(7)-1)*params(8)*exp(y(38))/(1+params(8)*exp(y(38)))-params(7)*T(3)/T(4)));
g1(10,11)=1;
g1(10,13)=(-params(7));
g1(10,1)=1;
g1(10,14)=(-1);
g1(10,25)=(-(1-params(7)));
g1(11,13)=(-(1-params(7)));
g1(11,23)=1;
g1(11,25)=(-params(7));
g1(11,5)=1;
g1(11,26)=(-1);
g1(12,15)=T(15);
g1(12,21)=T(5)*exp(T(5)*y(21));
g1(13,15)=T(15);
g1(13,33)=T(5)*exp(T(5)*y(33));
g1(14,40)=(-((1-params(1))*exp((y(43)+y(40))*(1-params(1)))));
g1(14,15)=1;
g1(14,43)=(-((1-params(1))*exp((y(43)+y(40))*(1-params(1)))));
g1(15,44)=(-((1-params(1))*exp((1-params(1))*(y(47)+y(44)))));
g1(15,27)=1;
g1(15,47)=(-((1-params(1))*exp((1-params(1))*(y(47)+y(44)))));
g1(16,15)=(-(1/y(15)));
g1(16,16)=1;
g1(17,27)=(-(1/y(27)));
g1(17,28)=1;
g1(18,11)=(-1);
g1(18,17)=(-1);
g1(18,23)=1;
g1(18,29)=1;
g1(18,10)=(-1);
g1(18,38)=1;
g1(19,38)=(-((exp(y(38))*(1+exp(y(38)))-exp(y(38))*exp(y(38)))/((1+exp(y(38)))*(1+exp(y(38))))));
g1(19,39)=1;
g1(20,17)=1;
g1(20,29)=(-1);
g1(20,35)=1;
g1(21,11)=(-((T(9)*T(13)+T(14))/exp(y(2)*(1-params(9)))));
g1(21,2)=(-((-(T(7)*T(9)*(1-params(9))*exp(y(2)*(1-params(9)))))/T(16)));
g1(21,17)=exp(y(17));
g1(21,21)=(-(T(14)/exp(y(2)*(1-params(9)))));
g1(22,23)=(-((exp(T(8)*(y(23)+y(33)))*T(19)+T(20))/exp((1-params(9))*y(6))));
g1(22,6)=(-((-(T(10)*exp(T(8)*(y(23)+y(33)))*(1-params(9))*exp((1-params(9))*y(6))))/T(21)));
g1(22,29)=exp(y(29));
g1(22,33)=(-(T(20)/exp((1-params(9))*y(6))));
g1(23,41)=(-exp(y(41)));
g1(23,20)=(-exp(y(20)))/(exp(y(20))*exp(y(20)));
g1(24,45)=(-exp(y(45)));
g1(24,32)=(-exp(y(32)))/(exp(y(32))*exp(y(32)));
g1(25,41)=(-exp(y(41)+y(42)));
g1(25,42)=(-exp(y(41)+y(42)));
g1(26,12)=(-((1+exp(y(18)))/exp(y(3))*exp(y(12))));
g1(26,3)=T(17);
g1(26,18)=T(18);
g1(26,19)=exp(y(19));
g1(27,19)=(-1);
g1(27,20)=1;
g1(27,37)=1;
g1(28,45)=(-exp(y(45)+y(46)));
g1(28,46)=(-exp(y(45)+y(46)));
g1(29,24)=(-((1+exp(y(30)))/exp(y(7))*exp(y(24))));
g1(29,7)=T(22);
g1(29,30)=T(23);
g1(29,31)=exp(y(31));

end
