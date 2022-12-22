function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
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
%   g1
%

if T_flag
    T = Model1.static_g1_tt(T, y, x, params);
end
g1 = zeros(29, 29);
g1(1,3)=1;
g1(1,12)=(-1);
g1(1,26)=(-params(6));
g1(2,15)=1;
g1(2,24)=(-1);
g1(2,26)=(-params(6));
g1(3,12)=1-params(5);
g1(4,24)=1-params(5);
g1(5,12)=1;
g1(5,24)=(-1);
g1(5,26)=1-(1-2*params(6));
g1(6,1)=(-params(10));
g1(6,2)=1;
g1(7,13)=(-params(10));
g1(7,14)=1;
g1(8,4)=1;
g1(8,28)=(-((-params(7))*(-(params(8)*exp(y(28))))/(params(8)*exp(y(28))*params(8)*exp(y(28)))/(1+1/(params(8)*exp(y(28))))+(params(7)-1)*(-(params(8)*exp(y(28))))/(exp(y(28))*exp(y(28)))/(1+params(8)/exp(y(28)))));
g1(9,16)=1;
g1(9,28)=(-((params(7)-1)*params(8)*exp(y(28))/(1+params(8)*exp(y(28)))-params(7)*exp(y(28))/params(8)/(1+exp(y(28))/params(8))));
g1(10,1)=1;
g1(10,3)=(-params(7));
g1(10,15)=(-(1-params(7)));
g1(11,3)=(-(1-params(7)));
g1(11,13)=1;
g1(11,15)=(-params(7));
g1(12,5)=T(6);
g1(12,11)=T(1)*exp(T(1)*y(11));
g1(13,5)=T(6);
g1(13,23)=T(1)*exp(T(1)*y(23));
g1(14,1)=(-((1-params(1))*exp((y(1)+y(11))*(1-params(1)))));
g1(14,5)=1;
g1(14,11)=(-((1-params(1))*exp((y(1)+y(11))*(1-params(1)))));
g1(15,13)=(-((1-params(1))*exp((1-params(1))*(y(13)+y(23)))));
g1(15,17)=1;
g1(15,23)=(-((1-params(1))*exp((1-params(1))*(y(13)+y(23)))));
g1(16,5)=(-(1/y(5)));
g1(16,6)=1;
g1(17,17)=(-(1/y(17)));
g1(17,18)=1;
g1(18,1)=(-1);
g1(18,7)=(-1);
g1(18,13)=1;
g1(18,19)=1;
g1(19,28)=(-((exp(y(28))*(1+exp(y(28)))-exp(y(28))*exp(y(28)))/((1+exp(y(28)))*(1+exp(y(28))))));
g1(19,29)=1;
g1(20,7)=1;
g1(20,19)=(-1);
g1(20,25)=1;
g1(21,1)=(-((T(4)*params(3)*exp((-y(1))/params(2))*(-1)/params(2)+T(5))/exp(y(6)*(1-params(9)))));
g1(21,6)=(-((-(params(3)*exp((-y(1))/params(2))*T(4)*(1-params(9))*exp(y(6)*(1-params(9)))))/(exp(y(6)*(1-params(9)))*exp(y(6)*(1-params(9))))));
g1(21,7)=exp(y(7));
g1(21,11)=(-(T(5)/exp(y(6)*(1-params(9)))));
g1(22,13)=(-((exp((y(13)+y(23))*T(3))*params(3)*exp((-y(13))/params(2))*(-1)/params(2)+T(7))/exp(y(18)*(1-params(9)))));
g1(22,18)=(-((-(params(3)*exp((-y(13))/params(2))*exp((y(13)+y(23))*T(3))*(1-params(9))*exp(y(18)*(1-params(9)))))/(exp(y(18)*(1-params(9)))*exp(y(18)*(1-params(9))))));
g1(22,19)=exp(y(19));
g1(22,23)=(-(T(7)/exp(y(18)*(1-params(9)))));
g1(23,7)=(-exp(y(7)));
g1(23,10)=(-exp(y(10)))/(exp(y(10))*exp(y(10)));
g1(24,19)=(-exp(y(19)));
g1(24,22)=(-exp(y(22)))/(exp(y(22))*exp(y(22)));
g1(25,7)=(-exp(y(7)+y(9)));
g1(25,9)=(-exp(y(7)+y(9)));
g1(26,2)=(-((1+exp(y(8)))/exp(y(8))*exp(y(2))));
g1(26,8)=(-(exp(y(2))*(exp(y(8))*exp(y(8))-exp(y(8))*(1+exp(y(8))))/(exp(y(8))*exp(y(8)))));
g1(26,9)=exp(y(9));
g1(27,9)=(-1);
g1(27,10)=1;
g1(27,27)=1;
g1(28,19)=(-exp(y(19)+y(21)));
g1(28,21)=(-exp(y(19)+y(21)));
g1(29,14)=(-((1+exp(y(20)))/exp(y(20))*exp(y(14))));
g1(29,20)=(-(exp(y(14))*(exp(y(20))*exp(y(20))-exp(y(20))*(1+exp(y(20))))/(exp(y(20))*exp(y(20)))));
g1(29,21)=exp(y(21));
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
