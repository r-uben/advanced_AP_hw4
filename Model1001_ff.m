% Usage:
%       out = Model1001_ff(params, y)
%   where
%       out    is a (29,29) matrix of the first order
%              derivatives of the static system residuals
%              columns correspond to endo variables in
%              the ordering as declared
%       params is a (10,1) vector of parameter values
%              in the ordering as declared
%       y      is a (29,1) vector of endogenous variables
%              in the ordering as declared
%
% Created by Dynare++ v. 5.2

% params ordering
% =====================
% gamma
% psi
% delta
% mu
% rho
% rho_vecm
% alpha
% kappa
% theta
% lever
%
% y ordering
% =====================
% dc
% dd
% dy
% f
% CE
% ce
% m
% pd
% rd
% rf
% u
% x
% dcf
% ddf
% dyf
% ff
% CEf
% cef
% mf
% pdf
% rdf
% rff
% uf
% xf
% de
% EC
% rdex
% s
% swc

function out = Model1001_ff(params, y)
if size(y) ~= [29,1]
	error('Wrong size of y, must be [29,1]');
end
if size(params) ~= [10,1]
	error('Wrong size of params, must be [10,1]');
end

% hardwired constants
a0 = 0;
a1 = 1;
a2 = NaN;
a3 = 1.1283792;
% numerical constants
a33 = 1;
a34 = 2;
% parameter values
a125 = params(1); % gamma
a100 = params(2); % psi
a106 = params(3); % delta
a5 = params(4); % mu
a23 = params(5); % rho
a10 = params(6); % rho_vecm
a65 = params(7); % alpha
a58 = params(8); % kappa
a109 = params(9); % theta
a45 = params(10); % lever
% exogenous variables to zeros
a8 = 0.0; % eps_c
a25 = 0.0; % eps_x
a18 = 0.0; % eps_cf
a30 = 0.0; % eps_xf
% endogenous variables to y
a46 = y(1); % dc
a123 = y(1); % dc
a44 = y(2); % dd
a4 = y(3); % dy
a85 = y(4); % f
a57 = y(4); % f
a108 = y(5); % CE
a167 = y(6); % ce
a130 = y(6); % ce
a143 = y(7); % m
a190 = y(7); % m
a208 = y(8); % pd
a205 = y(8); % pd
a203 = y(9); % rd
a199 = y(9); % rd
a187 = y(10); % rf
a103 = y(11); % u
a122 = y(11); % u
a6 = y(12); % x
a22 = y(12); % x
a52 = y(13); % dcf
a134 = y(13); % dcf
a51 = y(14); % ddf
a15 = y(15); % dyf
a93 = y(16); % ff
a75 = y(16); % ff
a117 = y(17); % CEf
a182 = y(18); % cef
a139 = y(18); % cef
a145 = y(19); % mf
a196 = y(19); % mf
a226 = y(20); % pdf
a223 = y(20); % pdf
a221 = y(21); % rdf
a217 = y(21); % rdf
a193 = y(22); % rff
a114 = y(23); % uf
a133 = y(23); % uf
a16 = y(24); % xf
a28 = y(24); % xf
a154 = y(25); % de
a37 = y(26); % EC
a11 = y(26); % EC
a214 = y(27); % rdex
a142 = y(28); % s
a59 = y(28); % s
a150 = y(29); % swc

t1 = a1;
t232 = -(a10);
t233 = -(a1);
t234 = -(t232);
t235 = -(a23);
t236 = -(t233);
t35 = a10 * a34;
t36 = a33 - t35;
t237 = -(t36);
t238 = -(a45);
t66 = -(a65);
t60 = exp(a59);
t61 = a58 * t60;
t239 = a33 * t61;
t240 = -(t239);
t241 = t61 * t61;
t242 = t240 / t241;
t62 = a33 / t61;
t63 = a33 + t62;
t243 = t242 / t63;
t244 = t66 * t243;
t71 = a65 - a33;
t245 = -(t61);
t246 = t60 * t60;
t247 = t245 / t246;
t68 = a58 / t60;
t69 = a33 + t68;
t248 = t247 / t69;
t249 = t71 * t248;
t250 = t244 + t249;
t251 = -(t250);
t76 = a33 + t61;
t330 = t61 / t76;
t331 = t71 * t330;
t79 = t60 / a58;
t80 = a33 + t79;
t332 = t79 / t80;
t333 = a65 * t332;
t334 = t331 - t333;
t335 = -(t334);
t89 = a33 - a65;
t370 = -(t89);
t372 = a109 - a1;
t373 = a108 ^ t372;
t374 = a109 * t373;
t375 = a106 * t374;
t376 = -(t375);
t101 = a33 / a100;
t102 = a33 - t101;
t104 = t102 * a103;
t105 = exp(t104);
t377 = t102 * t105;
t396 = a117 ^ t372;
t397 = a109 * t396;
t398 = a106 * t397;
t399 = -(t398);
t115 = t102 * a114;
t116 = exp(t115);
t400 = t102 * t116;
t126 = a33 - a125;
t124 = a122 + a123;
t127 = t124 * t126;
t128 = exp(t127);
t416 = t126 * t128;
t417 = -(t416);
t422 = a1 / a108;
t423 = -(t422);
t135 = a133 + a134;
t136 = t126 * t135;
t137 = exp(t136);
t433 = t126 * t137;
t434 = -(t433);
t439 = a1 / a117;
t440 = -(t439);
t151 = a33 + t60;
t450 = t60 * t151;
t451 = t450 - t246;
t452 = t151 * t151;
t453 = t451 / t452;
t454 = -(t453);
t158 = -(a46);
t159 = t158 / a100;
t160 = exp(t159);
t161 = a106 * t160;
t163 = t101 - a125;
t162 = a46 + a103;
t164 = t162 * t163;
t165 = exp(t164);
t484 = t163 * t165;
t485 = t161 * t484;
t481 = t233 / a100;
t482 = t160 * t481;
t483 = a106 * t482;
t486 = t165 * t483;
t487 = t485 + t486;
t168 = a33 - a109;
t169 = a167 * t168;
t170 = exp(t169);
t488 = t487 / t170;
t489 = -(t488);
t157 = exp(a143);
t490 = t485 / t170;
t491 = -(t490);
t166 = t161 * t165;
t492 = t168 * t170;
t493 = t166 * t492;
t494 = -(t493);
t495 = t170 * t170;
t496 = t494 / t495;
t497 = -(t496);
t174 = -(a52);
t175 = t174 / a100;
t176 = exp(t175);
t177 = a106 * t176;
t178 = a52 + a114;
t179 = t163 * t178;
t180 = exp(t179);
t602 = t163 * t180;
t603 = t177 * t602;
t600 = t176 * t481;
t601 = a106 * t600;
t604 = t180 * t601;
t605 = t603 + t604;
t183 = t168 * a182;
t184 = exp(t183);
t606 = t605 / t184;
t607 = -(t606);
t173 = exp(a145);
t608 = t603 / t184;
t609 = -(t608);
t181 = t177 * t180;
t610 = t168 * t184;
t611 = t181 * t610;
t612 = -(t611);
t613 = t184 * t184;
t614 = t612 / t613;
t615 = -(t614);
t191 = exp(a190);
t718 = -(t191);
t188 = exp(a187);
t719 = a33 * t188;
t720 = -(t719);
t721 = t188 * t188;
t722 = t720 / t721;
t197 = exp(a196);
t741 = -(t197);
t194 = exp(a193);
t742 = a33 * t194;
t743 = -(t742);
t744 = t194 * t194;
t745 = t743 / t744;
t200 = a190 + a199;
t201 = exp(t200);
t764 = -(t201);
t206 = exp(a205);
t207 = a33 + t206;
t209 = exp(a208);
t210 = t207 / t209;
t211 = exp(a44);
t212 = t210 * t211;
t765 = -(t212);
t766 = t206 / t209;
t767 = t211 * t766;
t768 = -(t767);
t204 = exp(a203);
t769 = t207 * t209;
t770 = -(t769);
t771 = t209 * t209;
t772 = t770 / t771;
t773 = t211 * t772;
t774 = -(t773);
t218 = a196 + a217;
t219 = exp(t218);
t808 = -(t219);
t224 = exp(a223);
t225 = a33 + t224;
t227 = exp(a226);
t228 = t225 / t227;
t229 = exp(a51);
t230 = t228 * t229;
t809 = -(t230);
t810 = t224 / t227;
t811 = t229 * t810;
t812 = -(t811);
t222 = exp(a221);
t813 = t225 * t227;
t814 = -(t813);
t815 = t227 * t227;
t816 = t814 / t815;
t817 = t229 * t816;
t818 = -(t817);
% setting the output variable
out = zeros(29, 29);
out(1,3) = out(1,3) + t1; % dy(0)
out(1,26) = out(1,26) + t232; % EC(0)
out(1,12) = out(1,12) + t233; % x(-1)
out(2,15) = out(2,15) + t1; % dyf(0)
out(2,26) = out(2,26) + t234; % EC(0)
out(2,24) = out(2,24) + t233; % xf(-1)
out(3,12) = out(3,12) + t1; % x(0)
out(3,12) = out(3,12) + t235; % x(-1)
out(4,24) = out(4,24) + t1; % xf(0)
out(4,24) = out(4,24) + t235; % xf(-1)
out(5,26) = out(5,26) + t1; % EC(0)
out(5,12) = out(5,12) + t236; % x(-1)
out(5,24) = out(5,24) + t233; % xf(-1)
out(5,26) = out(5,26) + t237; % EC(-1)
out(6,2) = out(6,2) + t1; % dd(0)
out(6,1) = out(6,1) + t238; % dc(0)
out(7,14) = out(7,14) + t1; % ddf(0)
out(7,13) = out(7,13) + t238; % dcf(0)
out(8,4) = out(8,4) + t1; % f(0)
out(8,28) = out(8,28) + t251; % s(0)
out(9,16) = out(9,16) + t1; % ff(0)
out(9,28) = out(9,28) + t335; % s(0)
out(10,3) = out(10,3) + t66; % dy(0)
out(10,15) = out(10,15) + t370; % dyf(0)
out(10,4) = out(10,4) + t233; % f(0)
out(10,1) = out(10,1) + t1; % dc(0)
out(10,4) = out(10,4) + t236; % f(-1)
out(11,3) = out(11,3) + t370; % dy(0)
out(11,15) = out(11,15) + t66; % dyf(0)
out(11,16) = out(11,16) + t233; % ff(0)
out(11,13) = out(11,13) + t1; % dcf(0)
out(11,16) = out(11,16) + t236; % ff(-1)
out(12,5) = out(12,5) + t376; % CE(0)
out(12,11) = out(12,11) + t377; % u(0)
out(13,17) = out(13,17) + t399; % CEf(0)
out(13,23) = out(13,23) + t400; % uf(0)
out(14,1) = out(14,1) + t417; % dc(1)
out(14,11) = out(14,11) + t417; % u(1)
out(14,5) = out(14,5) + t1; % CE(0)
out(15,5) = out(15,5) + t423; % CE(0)
out(15,6) = out(15,6) + t1; % ce(0)
out(16,13) = out(16,13) + t434; % dcf(1)
out(16,23) = out(16,23) + t434; % uf(1)
out(16,17) = out(16,17) + t1; % CEf(0)
out(17,17) = out(17,17) + t440; % CEf(0)
out(17,18) = out(17,18) + t1; % cef(0)
out(18,28) = out(18,28) + t1; % s(0)
out(18,1) = out(18,1) + t233; % dc(0)
out(18,7) = out(18,7) + t233; % m(0)
out(18,13) = out(18,13) + t236; % dcf(0)
out(18,19) = out(18,19) + t236; % mf(0)
out(18,28) = out(18,28) + t233; % s(-1)
out(19,29) = out(19,29) + t1; % swc(0)
out(19,28) = out(19,28) + t454; % s(0)
out(20,25) = out(20,25) + t1; % de(0)
out(20,7) = out(20,7) + t236; % m(0)
out(20,19) = out(20,19) + t233; % mf(0)
out(21,1) = out(21,1) + t489; % dc(0)
out(21,7) = out(21,7) + t157; % m(0)
out(21,11) = out(21,11) + t491; % u(0)
out(21,6) = out(21,6) + t497; % ce(-1)
out(22,13) = out(22,13) + t607; % dcf(0)
out(22,19) = out(22,19) + t173; % mf(0)
out(22,23) = out(22,23) + t609; % uf(0)
out(22,18) = out(22,18) + t615; % cef(-1)
out(23,7) = out(23,7) + t718; % m(1)
out(23,10) = out(23,10) + t722; % rf(0)
out(24,19) = out(24,19) + t741; % mf(1)
out(24,22) = out(24,22) + t745; % rff(0)
out(25,7) = out(25,7) + t764; % m(1)
out(25,9) = out(25,9) + t764; % rd(1)
out(26,2) = out(26,2) + t765; % dd(0)
out(26,8) = out(26,8) + t768; % pd(0)
out(26,9) = out(26,9) + t204; % rd(0)
out(26,8) = out(26,8) + t774; % pd(-1)
out(27,10) = out(27,10) + t236; % rf(0)
out(27,27) = out(27,27) + t1; % rdex(0)
out(27,9) = out(27,9) + t233; % rd(0)
out(28,19) = out(28,19) + t808; % mf(1)
out(28,21) = out(28,21) + t808; % rdf(1)
out(29,14) = out(29,14) + t809; % ddf(0)
out(29,20) = out(29,20) + t812; % pdf(0)
out(29,21) = out(29,21) + t222; % rdf(0)
out(29,20) = out(29,20) + t818; % pdf(-1)
