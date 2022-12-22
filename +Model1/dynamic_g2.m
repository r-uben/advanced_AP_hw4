function g2 = dynamic_g2(T, y, x, params, steady_state, it_, T_flag)
% function g2 = dynamic_g2(T, y, x, params, steady_state, it_, T_flag)
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
%   g2
%

if T_flag
    T = Model1.dynamic_g2_tt(T, y, x, params, steady_state, it_);
end
g2_i = zeros(69,1);
g2_j = zeros(69,1);
g2_v = zeros(69,1);

g2_i(1)=8;
g2_i(2)=9;
g2_i(3)=12;
g2_i(4)=12;
g2_i(5)=13;
g2_i(6)=13;
g2_i(7)=14;
g2_i(8)=14;
g2_i(9)=14;
g2_i(10)=14;
g2_i(11)=15;
g2_i(12)=15;
g2_i(13)=15;
g2_i(14)=15;
g2_i(15)=16;
g2_i(16)=17;
g2_i(17)=19;
g2_i(18)=21;
g2_i(19)=21;
g2_i(20)=21;
g2_i(21)=21;
g2_i(22)=21;
g2_i(23)=21;
g2_i(24)=21;
g2_i(25)=21;
g2_i(26)=21;
g2_i(27)=21;
g2_i(28)=22;
g2_i(29)=22;
g2_i(30)=22;
g2_i(31)=22;
g2_i(32)=22;
g2_i(33)=22;
g2_i(34)=22;
g2_i(35)=22;
g2_i(36)=22;
g2_i(37)=22;
g2_i(38)=23;
g2_i(39)=23;
g2_i(40)=24;
g2_i(41)=24;
g2_i(42)=25;
g2_i(43)=25;
g2_i(44)=25;
g2_i(45)=25;
g2_i(46)=26;
g2_i(47)=26;
g2_i(48)=26;
g2_i(49)=26;
g2_i(50)=26;
g2_i(51)=26;
g2_i(52)=26;
g2_i(53)=26;
g2_i(54)=26;
g2_i(55)=26;
g2_i(56)=28;
g2_i(57)=28;
g2_i(58)=28;
g2_i(59)=28;
g2_i(60)=29;
g2_i(61)=29;
g2_i(62)=29;
g2_i(63)=29;
g2_i(64)=29;
g2_i(65)=29;
g2_i(66)=29;
g2_i(67)=29;
g2_i(68)=29;
g2_i(69)=29;
g2_j(1)=1925;
g2_j(2)=1925;
g2_j(3)=729;
g2_j(4)=1041;
g2_j(5)=729;
g2_j(6)=1665;
g2_j(7)=2029;
g2_j(8)=2032;
g2_j(9)=2182;
g2_j(10)=2185;
g2_j(11)=2237;
g2_j(12)=2240;
g2_j(13)=2390;
g2_j(14)=2393;
g2_j(15)=729;
g2_j(16)=1353;
g2_j(17)=1925;
g2_j(18)=521;
g2_j(19)=512;
g2_j(20)=62;
g2_j(21)=531;
g2_j(22)=1031;
g2_j(23)=53;
g2_j(24)=72;
g2_j(25)=1022;
g2_j(26)=833;
g2_j(27)=1041;
g2_j(28)=1145;
g2_j(29)=1128;
g2_j(30)=278;
g2_j(31)=1155;
g2_j(32)=1655;
g2_j(33)=261;
g2_j(34)=288;
g2_j(35)=1638;
g2_j(36)=1457;
g2_j(37)=1665;
g2_j(38)=2081;
g2_j(39)=989;
g2_j(40)=2289;
g2_j(41)=1613;
g2_j(42)=2081;
g2_j(43)=2082;
g2_j(44)=2132;
g2_j(45)=2133;
g2_j(46)=573;
g2_j(47)=564;
g2_j(48)=114;
g2_j(49)=579;
g2_j(50)=879;
g2_j(51)=105;
g2_j(52)=120;
g2_j(53)=870;
g2_j(54)=885;
g2_j(55)=937;
g2_j(56)=2289;
g2_j(57)=2290;
g2_j(58)=2340;
g2_j(59)=2341;
g2_j(60)=1197;
g2_j(61)=1180;
g2_j(62)=330;
g2_j(63)=1203;
g2_j(64)=1503;
g2_j(65)=313;
g2_j(66)=336;
g2_j(67)=1486;
g2_j(68)=1509;
g2_j(69)=1561;
g2_v(1)=(-((-params(7))*(T(1)*((-(params(8)*exp(y(38))))*T(24)-(-(params(8)*exp(y(38))))*(T(24)+T(24)))/(T(24)*T(24))-T(25)*T(25))/(T(1)*T(1))+(params(7)-1)*(T(2)*((-(params(8)*exp(y(38))))*exp(y(38))*exp(y(38))-(-(params(8)*exp(y(38))))*(exp(y(38))*exp(y(38))+exp(y(38))*exp(y(38))))/(exp(y(38))*exp(y(38))*exp(y(38))*exp(y(38)))-T(26)*T(26))/(T(2)*T(2))));
g2_v(2)=(-((params(7)-1)*(params(8)*exp(y(38))*(1+params(8)*exp(y(38)))-T(24))/((1+params(8)*exp(y(38)))*(1+params(8)*exp(y(38))))-params(7)*(T(3)*T(4)-T(3)*T(3))/(T(4)*T(4))));
g2_v(3)=T(27);
g2_v(4)=T(5)*T(5)*exp(T(5)*y(21));
g2_v(5)=T(27);
g2_v(6)=T(5)*T(5)*exp(T(5)*y(33));
g2_v(7)=(-((1-params(1))*(1-params(1))*exp((y(43)+y(40))*(1-params(1)))));
g2_v(8)=(-((1-params(1))*(1-params(1))*exp((y(43)+y(40))*(1-params(1)))));
g2_v(9)=g2_v(8);
g2_v(10)=(-((1-params(1))*(1-params(1))*exp((y(43)+y(40))*(1-params(1)))));
g2_v(11)=(-((1-params(1))*(1-params(1))*exp((1-params(1))*(y(47)+y(44)))));
g2_v(12)=(-((1-params(1))*(1-params(1))*exp((1-params(1))*(y(47)+y(44)))));
g2_v(13)=g2_v(12);
g2_v(14)=(-((1-params(1))*(1-params(1))*exp((1-params(1))*(y(47)+y(44)))));
g2_v(15)=(-((-1)/(y(15)*y(15))));
g2_v(16)=(-((-1)/(y(27)*y(27))));
g2_v(17)=(-(((1+exp(y(38)))*(1+exp(y(38)))*(exp(y(38))*exp(y(38))+exp(y(38))*(1+exp(y(38)))-(exp(y(38))*exp(y(38))+exp(y(38))*exp(y(38))))-(exp(y(38))*(1+exp(y(38)))-exp(y(38))*exp(y(38)))*(exp(y(38))*(1+exp(y(38)))+exp(y(38))*(1+exp(y(38)))))/((1+exp(y(38)))*(1+exp(y(38)))*(1+exp(y(38)))*(1+exp(y(38))))));
g2_v(18)=(-((T(13)*T(8)*T(9)+T(9)*params(3)*T(11)*T(12)+T(13)*T(8)*T(9)+T(7)*T(8)*T(8)*T(9))/exp(y(2)*(1-params(9)))));
g2_v(19)=(-((-((T(9)*T(13)+T(14))*(1-params(9))*exp(y(2)*(1-params(9)))))/T(16)));
g2_v(20)=g2_v(19);
g2_v(21)=(-((T(13)*T(8)*T(9)+T(7)*T(8)*T(8)*T(9))/exp(y(2)*(1-params(9)))));
g2_v(22)=g2_v(21);
g2_v(23)=(-((T(16)*(-(T(7)*T(9)*(1-params(9))*(1-params(9))*exp(y(2)*(1-params(9)))))-(-(T(7)*T(9)*(1-params(9))*exp(y(2)*(1-params(9)))))*(exp(y(2)*(1-params(9)))*(1-params(9))*exp(y(2)*(1-params(9)))+exp(y(2)*(1-params(9)))*(1-params(9))*exp(y(2)*(1-params(9)))))/(T(16)*T(16))));
g2_v(24)=(-((-(T(14)*(1-params(9))*exp(y(2)*(1-params(9)))))/T(16)));
g2_v(25)=g2_v(24);
g2_v(26)=exp(y(17));
g2_v(27)=(-(T(7)*T(8)*T(8)*T(9)/exp(y(2)*(1-params(9)))));
g2_v(28)=(-((T(19)*T(8)*exp(T(8)*(y(23)+y(33)))+exp(T(8)*(y(23)+y(33)))*params(3)*T(11)*exp((-y(23))/params(2))*T(11)+T(19)*T(8)*exp(T(8)*(y(23)+y(33)))+T(10)*T(8)*T(8)*exp(T(8)*(y(23)+y(33))))/exp((1-params(9))*y(6))));
g2_v(29)=(-((-((exp(T(8)*(y(23)+y(33)))*T(19)+T(20))*(1-params(9))*exp((1-params(9))*y(6))))/T(21)));
g2_v(30)=g2_v(29);
g2_v(31)=(-((T(19)*T(8)*exp(T(8)*(y(23)+y(33)))+T(10)*T(8)*T(8)*exp(T(8)*(y(23)+y(33))))/exp((1-params(9))*y(6))));
g2_v(32)=g2_v(31);
g2_v(33)=(-((T(21)*(-(T(10)*exp(T(8)*(y(23)+y(33)))*(1-params(9))*(1-params(9))*exp((1-params(9))*y(6))))-(-(T(10)*exp(T(8)*(y(23)+y(33)))*(1-params(9))*exp((1-params(9))*y(6))))*(exp((1-params(9))*y(6))*(1-params(9))*exp((1-params(9))*y(6))+exp((1-params(9))*y(6))*(1-params(9))*exp((1-params(9))*y(6))))/(T(21)*T(21))));
g2_v(34)=(-((-(T(20)*(1-params(9))*exp((1-params(9))*y(6))))/T(21)));
g2_v(35)=g2_v(34);
g2_v(36)=exp(y(29));
g2_v(37)=(-(T(10)*T(8)*T(8)*exp(T(8)*(y(23)+y(33)))/exp((1-params(9))*y(6))));
g2_v(38)=(-exp(y(41)));
g2_v(39)=((-exp(y(20)))*exp(y(20))*exp(y(20))-(-exp(y(20)))*(exp(y(20))*exp(y(20))+exp(y(20))*exp(y(20))))/(exp(y(20))*exp(y(20))*exp(y(20))*exp(y(20)));
g2_v(40)=(-exp(y(45)));
g2_v(41)=((-exp(y(32)))*exp(y(32))*exp(y(32))-(-exp(y(32)))*(exp(y(32))*exp(y(32))+exp(y(32))*exp(y(32))))/(exp(y(32))*exp(y(32))*exp(y(32))*exp(y(32)));
g2_v(42)=(-exp(y(41)+y(42)));
g2_v(43)=(-exp(y(41)+y(42)));
g2_v(44)=g2_v(43);
g2_v(45)=(-exp(y(41)+y(42)));
g2_v(46)=(-((1+exp(y(18)))/exp(y(3))*exp(y(12))));
g2_v(47)=T(17);
g2_v(48)=g2_v(47);
g2_v(49)=T(18);
g2_v(50)=g2_v(49);
g2_v(51)=(-(exp(y(12))*((-((1+exp(y(18)))*exp(y(3))))*exp(y(3))*exp(y(3))-(-((1+exp(y(18)))*exp(y(3))))*(exp(y(3))*exp(y(3))+exp(y(3))*exp(y(3))))/(exp(y(3))*exp(y(3))*exp(y(3))*exp(y(3)))));
g2_v(52)=(-(exp(y(12))*(-(exp(y(18))*exp(y(3))))/(exp(y(3))*exp(y(3)))));
g2_v(53)=g2_v(52);
g2_v(54)=T(18);
g2_v(55)=exp(y(19));
g2_v(56)=(-exp(y(45)+y(46)));
g2_v(57)=(-exp(y(45)+y(46)));
g2_v(58)=g2_v(57);
g2_v(59)=(-exp(y(45)+y(46)));
g2_v(60)=(-((1+exp(y(30)))/exp(y(7))*exp(y(24))));
g2_v(61)=T(22);
g2_v(62)=g2_v(61);
g2_v(63)=T(23);
g2_v(64)=g2_v(63);
g2_v(65)=(-(exp(y(24))*((-((1+exp(y(30)))*exp(y(7))))*exp(y(7))*exp(y(7))-(-((1+exp(y(30)))*exp(y(7))))*(exp(y(7))*exp(y(7))+exp(y(7))*exp(y(7))))/(exp(y(7))*exp(y(7))*exp(y(7))*exp(y(7)))));
g2_v(66)=(-(exp(y(24))*(-(exp(y(30))*exp(y(7))))/(exp(y(7))*exp(y(7)))));
g2_v(67)=g2_v(66);
g2_v(68)=T(23);
g2_v(69)=exp(y(31));
g2 = sparse(g2_i,g2_j,g2_v,29,2601);
end
