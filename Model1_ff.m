% Usage:
%       out = model1_ff(params, y)
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

function out = model1_ff(params, y)
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
a127 = params(1); % gamma
a102 = params(2); % psi
a108 = params(3); % delta
a5 = params(4); % mu
a23 = params(5); % rho
a10 = params(6); % rho_vecm
a58 = params(7); % alpha
a62 = params(8); % kappa
a111 = params(9); % theta
a45 = params(10); % lever
% exogenous variables to zeros
a8 = 0.0; % eps_c
a18 = 0.0; % eps_cf
a25 = 0.0; % eps_x
a30 = 0.0; % eps_xf
% endogenous variables to y
a46 = y(1); % dc
a125 = y(1); % dc
a44 = y(2); % dd
a4 = y(3); % dy
a88 = y(4); % f
a57 = y(4); % f
a110 = y(5); % CE
a172 = y(6); % ce
a132 = y(6); % ce
a145 = y(7); % m
a195 = y(7); % m
a213 = y(8); % pd
a210 = y(8); % pd
a208 = y(9); % rd
a204 = y(9); % rd
a192 = y(10); % rf
a105 = y(11); % u
a124 = y(11); % u
a6 = y(12); % x
a22 = y(12); % x
a52 = y(13); % dcf
a136 = y(13); % dcf
a51 = y(14); % ddf
a15 = y(15); % dyf
a95 = y(16); % ff
a75 = y(16); % ff
a119 = y(17); % CEf
a187 = y(18); % cef
a141 = y(18); % cef
a147 = y(19); % mf
a201 = y(19); % mf
a231 = y(20); % pdf
a228 = y(20); % pdf
a226 = y(21); % rdf
a222 = y(21); % rdf
a198 = y(22); % rff
a116 = y(23); % uf
a135 = y(23); % uf
a16 = y(24); % xf
a28 = y(24); % xf
a157 = y(25); % de
a37 = y(26); % EC
a11 = y(26); % EC
a219 = y(27); % rdex
a144 = y(28); % s
a59 = y(28); % s
a153 = y(29); % swc

t1 = a1;
t237 = -(a10);
t238 = -(a1);
t239 = -(t237);
t240 = -(a23);
t241 = -(t238);
t35 = a10 * a34;
t36 = a33 - t35;
t242 = -(t36);
t243 = -(a45);
t60 = -(a59);
t61 = exp(t60);
t244 = t61 * t238;
t245 = t244 / a62;
t63 = t61 / a62;
t64 = a33 + t63;
t246 = t245 / t64;
t247 = a58 * t246;
t67 = a33 - a58;
t248 = a62 * t244;
t68 = t61 * a62;
t69 = a33 + t68;
t249 = t248 / t69;
t250 = t67 * t249;
t251 = t247 + t250;
t252 = -(t251);
t253 = -(t252);
t76 = exp(a59);
t77 = t76 / a62;
t78 = a33 + t77;
t304 = t77 / t78;
t305 = a58 * t304;
t81 = a62 * t76;
t82 = a33 + t81;
t306 = t81 / t82;
t307 = t67 * t306;
t308 = t305 + t307;
t309 = -(t308);
t310 = -(t309);
t349 = -(a58);
t350 = -(t67);
t352 = a111 - a1;
t353 = a110 ^ t352;
t354 = a111 * t353;
t355 = a108 * t354;
t356 = -(t355);
t103 = a33 / a102;
t104 = a33 - t103;
t106 = t104 * a105;
t107 = exp(t106);
t357 = t104 * t107;
t376 = a119 ^ t352;
t377 = a111 * t376;
t378 = a108 * t377;
t379 = -(t378);
t117 = t104 * a116;
t118 = exp(t117);
t380 = t104 * t118;
t128 = a33 - a127;
t126 = a124 + a125;
t129 = t126 * t128;
t130 = exp(t129);
t396 = t128 * t130;
t397 = -(t396);
t402 = a1 / a110;
t403 = -(t402);
t137 = a135 + a136;
t138 = t128 * t137;
t139 = exp(t138);
t413 = t128 * t139;
t414 = -(t413);
t419 = a1 / a119;
t420 = -(t419);
t146 = a144 + a145;
t148 = t146 - a147;
t149 = a46 + t148;
t150 = t149 - a52;
t151 = exp(t150);
t430 = -(t151);
t431 = t151 * t238;
t432 = -(t431);
t154 = a33 + t76;
t438 = t76 * t154;
t437 = t76 * t76;
t439 = t438 - t437;
t440 = t154 * t154;
t441 = t439 / t440;
t442 = -(t441);
t158 = exp(a157);
t159 = a147 - a145;
t160 = exp(t159);
t471 = t160 * t238;
t472 = -(t471);
t473 = -(t160);
t163 = -(a46);
t164 = t163 / a102;
t165 = exp(t164);
t166 = a108 * t165;
t168 = t103 - a127;
t167 = a46 + a105;
t169 = t167 * t168;
t170 = exp(t169);
t481 = t168 * t170;
t482 = t166 * t481;
t478 = t238 / a102;
t479 = t165 * t478;
t480 = a108 * t479;
t483 = t170 * t480;
t484 = t482 + t483;
t173 = a33 - a111;
t174 = a172 * t173;
t175 = exp(t174);
t485 = t484 / t175;
t486 = -(t485);
t162 = exp(a145);
t487 = t482 / t175;
t488 = -(t487);
t171 = t166 * t170;
t489 = t173 * t175;
t490 = t171 * t489;
t491 = -(t490);
t492 = t175 * t175;
t493 = t491 / t492;
t494 = -(t493);
t179 = -(a52);
t180 = t179 / a102;
t181 = exp(t180);
t182 = a108 * t181;
t183 = a52 + a116;
t184 = t168 * t183;
t185 = exp(t184);
t599 = t168 * t185;
t600 = t182 * t599;
t597 = t181 * t478;
t598 = a108 * t597;
t601 = t185 * t598;
t602 = t600 + t601;
t188 = t173 * a187;
t189 = exp(t188);
t603 = t602 / t189;
t604 = -(t603);
t178 = exp(a147);
t605 = t600 / t189;
t606 = -(t605);
t186 = t182 * t185;
t607 = t173 * t189;
t608 = t186 * t607;
t609 = -(t608);
t610 = t189 * t189;
t611 = t609 / t610;
t612 = -(t611);
t196 = exp(a195);
t715 = -(t196);
t193 = exp(a192);
t716 = a33 * t193;
t717 = -(t716);
t718 = t193 * t193;
t719 = t717 / t718;
t202 = exp(a201);
t738 = -(t202);
t199 = exp(a198);
t739 = a33 * t199;
t740 = -(t739);
t741 = t199 * t199;
t742 = t740 / t741;
t205 = a195 + a204;
t206 = exp(t205);
t761 = -(t206);
t211 = exp(a210);
t212 = a33 + t211;
t214 = exp(a213);
t215 = t212 / t214;
t216 = exp(a44);
t217 = t215 * t216;
t762 = -(t217);
t763 = t211 / t214;
t764 = t216 * t763;
t765 = -(t764);
t209 = exp(a208);
t766 = t212 * t214;
t767 = -(t766);
t768 = t214 * t214;
t769 = t767 / t768;
t770 = t216 * t769;
t771 = -(t770);
t223 = a201 + a222;
t224 = exp(t223);
t805 = -(t224);
t229 = exp(a228);
t230 = a33 + t229;
t232 = exp(a231);
t233 = t230 / t232;
t234 = exp(a51);
t235 = t233 * t234;
t806 = -(t235);
t807 = t229 / t232;
t808 = t234 * t807;
t809 = -(t808);
t227 = exp(a226);
t810 = t230 * t232;
t811 = -(t810);
t812 = t232 * t232;
t813 = t811 / t812;
t814 = t234 * t813;
t815 = -(t814);
% setting the output variable
out = zeros(29, 29);
out(1,3) = out(1,3) + t1; % dy(0)
out(1,26) = out(1,26) + t237; % EC(0)
out(1,12) = out(1,12) + t238; % x(-1)
out(2,15) = out(2,15) + t1; % dyf(0)
out(2,26) = out(2,26) + t239; % EC(0)
out(2,24) = out(2,24) + t238; % xf(-1)
out(3,12) = out(3,12) + t1; % x(0)
out(3,12) = out(3,12) + t240; % x(-1)
out(4,24) = out(4,24) + t1; % xf(0)
out(4,24) = out(4,24) + t240; % xf(-1)
out(5,26) = out(5,26) + t1; % EC(0)
out(5,12) = out(5,12) + t241; % x(-1)
out(5,24) = out(5,24) + t238; % xf(-1)
out(5,26) = out(5,26) + t242; % EC(-1)
out(6,2) = out(6,2) + t1; % dd(0)
out(6,1) = out(6,1) + t243; % dc(0)
out(7,14) = out(7,14) + t1; % ddf(0)
out(7,13) = out(7,13) + t243; % dcf(0)
out(8,4) = out(8,4) + t1; % f(0)
out(8,28) = out(8,28) + t253; % s(0)
out(9,16) = out(9,16) + t1; % ff(0)
out(9,28) = out(9,28) + t310; % s(0)
out(10,3) = out(10,3) + t349; % dy(0)
out(10,15) = out(10,15) + t350; % dyf(0)
out(10,4) = out(10,4) + t238; % f(0)
out(10,1) = out(10,1) + t1; % dc(0)
out(10,4) = out(10,4) + t241; % f(-1)
out(11,3) = out(11,3) + t350; % dy(0)
out(11,15) = out(11,15) + t349; % dyf(0)
out(11,16) = out(11,16) + t238; % ff(0)
out(11,13) = out(11,13) + t1; % dcf(0)
out(11,16) = out(11,16) + t241; % ff(-1)
out(12,5) = out(12,5) + t356; % CE(0)
out(12,11) = out(12,11) + t357; % u(0)
out(13,17) = out(13,17) + t379; % CEf(0)
out(13,23) = out(13,23) + t380; % uf(0)
out(14,1) = out(14,1) + t397; % dc(1)
out(14,11) = out(14,11) + t397; % u(1)
out(14,5) = out(14,5) + t1; % CE(0)
out(15,5) = out(15,5) + t403; % CE(0)
out(15,6) = out(15,6) + t1; % ce(0)
out(16,13) = out(16,13) + t414; % dcf(1)
out(16,23) = out(16,23) + t414; % uf(1)
out(16,17) = out(16,17) + t1; % CEf(0)
out(17,17) = out(17,17) + t420; % CEf(0)
out(17,18) = out(17,18) + t1; % cef(0)
out(18,28) = out(18,28) + t76; % s(0)
out(18,1) = out(18,1) + t430; % dc(0)
out(18,7) = out(18,7) + t430; % m(0)
out(18,13) = out(18,13) + t432; % dcf(0)
out(18,19) = out(18,19) + t432; % mf(0)
out(18,28) = out(18,28) + t430; % s(-1)
out(19,29) = out(19,29) + t1; % swc(0)
out(19,28) = out(19,28) + t442; % s(0)
out(20,25) = out(20,25) + t158; % de(0)
out(20,7) = out(20,7) + t472; % m(0)
out(20,19) = out(20,19) + t473; % mf(0)
out(21,1) = out(21,1) + t486; % dc(0)
out(21,7) = out(21,7) + t162; % m(0)
out(21,11) = out(21,11) + t488; % u(0)
out(21,6) = out(21,6) + t494; % ce(-1)
out(22,13) = out(22,13) + t604; % dcf(0)
out(22,19) = out(22,19) + t178; % mf(0)
out(22,23) = out(22,23) + t606; % uf(0)
out(22,18) = out(22,18) + t612; % cef(-1)
out(23,7) = out(23,7) + t715; % m(1)
out(23,10) = out(23,10) + t719; % rf(0)
out(24,19) = out(24,19) + t738; % mf(1)
out(24,22) = out(24,22) + t742; % rff(0)
out(25,7) = out(25,7) + t761; % m(1)
out(25,9) = out(25,9) + t761; % rd(1)
out(26,2) = out(26,2) + t762; % dd(0)
out(26,8) = out(26,8) + t765; % pd(0)
out(26,9) = out(26,9) + t209; % rd(0)
out(26,8) = out(26,8) + t771; % pd(-1)
out(27,10) = out(27,10) + t241; % rf(0)
out(27,27) = out(27,27) + t1; % rdex(0)
out(27,9) = out(27,9) + t238; % rd(0)
out(28,19) = out(28,19) + t805; % mf(1)
out(28,21) = out(28,21) + t805; % rdf(1)
out(29,14) = out(29,14) + t806; % ddf(0)
out(29,20) = out(29,20) + t809; % pdf(0)
out(29,21) = out(29,21) + t227; % rdf(0)
out(29,20) = out(29,20) + t815; % pdf(-1)
