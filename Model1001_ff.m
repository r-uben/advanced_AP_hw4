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
a178 = y(6); % ce
a136 = y(6); % ce
a143 = y(7); % m
a201 = y(7); % m
a219 = y(8); % pd
a216 = y(8); % pd
a214 = y(9); % rd
a210 = y(9); % rd
a198 = y(10); % rf
a103 = y(11); % u
a122 = y(11); % u
a6 = y(12); % x
a22 = y(12); % x
a52 = y(13); % dcf
a131 = y(13); % dcf
a51 = y(14); % ddf
a15 = y(15); % dyf
a93 = y(16); % ff
a75 = y(16); % ff
a117 = y(17); % CEf
a193 = y(18); % cef
a139 = y(18); % cef
a145 = y(19); % mf
a207 = y(19); % mf
a162 = y(20); % pdf
a159 = y(20); % pdf
a157 = y(21); % rdf
a228 = y(21); % rdf
a204 = y(22); % rff
a114 = y(23); % uf
a130 = y(23); % uf
a16 = y(24); % xf
a28 = y(24); % xf
a154 = y(25); % de
a37 = y(26); % EC
a11 = y(26); % EC
a225 = y(27); % rdex
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
t132 = a130 + a131;
t133 = t126 * t132;
t134 = exp(t133);
t422 = t126 * t134;
t423 = -(t422);
t428 = a1 / a108;
t429 = -(t428);
t439 = a1 / a117;
t440 = -(t439);
t151 = a33 + t60;
t450 = t60 * t151;
t451 = t450 - t246;
t452 = t151 * t151;
t453 = t451 / t452;
t454 = -(t453);
t160 = exp(a159);
t161 = a33 + t160;
t163 = exp(a162);
t164 = t161 / t163;
t165 = exp(a51);
t166 = t164 * t165;
t481 = -(t166);
t482 = t160 / t163;
t483 = t165 * t482;
t484 = -(t483);
t158 = exp(a157);
t485 = t161 * t163;
t486 = -(t485);
t487 = t163 * t163;
t488 = t486 / t487;
t489 = t165 * t488;
t490 = -(t489);
t169 = -(a46);
t170 = t169 / a100;
t171 = exp(t170);
t172 = a106 * t171;
t174 = t101 - a125;
t173 = a46 + a103;
t175 = t173 * t174;
t176 = exp(t175);
t527 = t174 * t176;
t528 = t172 * t527;
t524 = t233 / a100;
t525 = t171 * t524;
t526 = a106 * t525;
t529 = t176 * t526;
t530 = t528 + t529;
t179 = a33 - a109;
t180 = a178 * t179;
t181 = exp(t180);
t531 = t530 / t181;
t532 = -(t531);
t168 = exp(a143);
t533 = t528 / t181;
t534 = -(t533);
t177 = t172 * t176;
t535 = t179 * t181;
t536 = t177 * t535;
t537 = -(t536);
t538 = t181 * t181;
t539 = t537 / t538;
t540 = -(t539);
t185 = -(a52);
t186 = t185 / a100;
t187 = exp(t186);
t188 = a106 * t187;
t189 = a52 + a114;
t190 = t174 * t189;
t191 = exp(t190);
t645 = t174 * t191;
t646 = t188 * t645;
t643 = t187 * t524;
t644 = a106 * t643;
t647 = t191 * t644;
t648 = t646 + t647;
t194 = t179 * a193;
t195 = exp(t194);
t649 = t648 / t195;
t650 = -(t649);
t184 = exp(a145);
t651 = t646 / t195;
t652 = -(t651);
t192 = t188 * t191;
t653 = t179 * t195;
t654 = t192 * t653;
t655 = -(t654);
t656 = t195 * t195;
t657 = t655 / t656;
t658 = -(t657);
t202 = exp(a201);
t761 = -(t202);
t199 = exp(a198);
t762 = a33 * t199;
t763 = -(t762);
t764 = t199 * t199;
t765 = t763 / t764;
t208 = exp(a207);
t784 = -(t208);
t205 = exp(a204);
t785 = a33 * t205;
t786 = -(t785);
t787 = t205 * t205;
t788 = t786 / t787;
t211 = a201 + a210;
t212 = exp(t211);
t807 = -(t212);
t217 = exp(a216);
t218 = a33 + t217;
t220 = exp(a219);
t221 = t218 / t220;
t222 = exp(a44);
t223 = t221 * t222;
t808 = -(t223);
t809 = t217 / t220;
t810 = t222 * t809;
t811 = -(t810);
t215 = exp(a214);
t812 = t218 * t220;
t813 = -(t812);
t814 = t220 * t220;
t815 = t813 / t814;
t816 = t222 * t815;
t817 = -(t816);
t229 = a207 + a228;
t230 = exp(t229);
t851 = -(t230);
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
out(15,13) = out(15,13) + t423; % dcf(1)
out(15,23) = out(15,23) + t423; % uf(1)
out(15,17) = out(15,17) + t1; % CEf(0)
out(16,5) = out(16,5) + t429; % CE(0)
out(16,6) = out(16,6) + t1; % ce(0)
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
out(21,14) = out(21,14) + t481; % ddf(0)
out(21,20) = out(21,20) + t484; % pdf(0)
out(21,21) = out(21,21) + t158; % rdf(0)
out(21,20) = out(21,20) + t490; % pdf(-1)
out(22,1) = out(22,1) + t532; % dc(0)
out(22,7) = out(22,7) + t168; % m(0)
out(22,11) = out(22,11) + t534; % u(0)
out(22,6) = out(22,6) + t540; % ce(-1)
out(23,13) = out(23,13) + t650; % dcf(0)
out(23,19) = out(23,19) + t184; % mf(0)
out(23,23) = out(23,23) + t652; % uf(0)
out(23,18) = out(23,18) + t658; % cef(-1)
out(24,7) = out(24,7) + t761; % m(1)
out(24,10) = out(24,10) + t765; % rf(0)
out(25,19) = out(25,19) + t784; % mf(1)
out(25,22) = out(25,22) + t788; % rff(0)
out(26,7) = out(26,7) + t807; % m(1)
out(26,9) = out(26,9) + t807; % rd(1)
out(27,2) = out(27,2) + t808; % dd(0)
out(27,8) = out(27,8) + t811; % pd(0)
out(27,9) = out(27,9) + t215; % rd(0)
out(27,8) = out(27,8) + t817; % pd(-1)
out(28,10) = out(28,10) + t236; % rf(0)
out(28,27) = out(28,27) + t1; % rdex(0)
out(28,9) = out(28,9) + t233; % rd(0)
out(29,19) = out(29,19) + t851; % mf(1)
out(29,21) = out(29,21) + t851; % rdf(1)
