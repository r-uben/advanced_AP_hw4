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
a5 = 1;
a6 = 2;
% parameter values
a46 = params(1); % gamma
a39 = params(2); % psi
a37 = params(3); % delta
a22 = params(4); % mu
a131 = params(5); % rho
a7 = params(6); % rho_vecm
a149 = params(7); % alpha
a142 = params(8); % kappa
a52 = params(9); % theta
a23 = params(10); % lever
% exogenous variables to zeros
a17 = 0.0; % eps_c
a133 = 0.0; % eps_x
a14 = 0.0; % eps_cf
a138 = 0.0; % eps_xf
% endogenous variables to y
a24 = y(1); % dc
a197 = y(1); % dc
a21 = y(2); % dd
a119 = y(3); % dy
a169 = y(4); % f
a141 = y(4); % f
a188 = y(5); % CE
a51 = y(6); % ce
a210 = y(6); % ce
a35 = y(7); % m
a77 = y(7); % m
a95 = y(8); % pd
a92 = y(8); % pd
a90 = y(9); % rd
a86 = y(9); % rd
a74 = y(10); % rf
a43 = y(11); % u
a196 = y(11); % u
a16 = y(12); % x
a130 = y(12); % x
a30 = y(13); % dcf
a205 = y(13); % dcf
a29 = y(14); % ddf
a125 = y(15); % dyf
a177 = y(16); % ff
a159 = y(16); % ff
a203 = y(17); % CEf
a69 = y(18); % cef
a213 = y(18); % cef
a58 = y(19); % mf
a83 = y(19); % mf
a113 = y(20); % pdf
a110 = y(20); % pdf
a108 = y(21); % rdf
a104 = y(21); % rdf
a80 = y(22); % rff
a64 = y(23); % uf
a204 = y(23); % uf
a12 = y(24); % xf
a136 = y(24); % xf
a226 = y(25); % de
a10 = y(26); % EC
a4 = y(26); % EC
a101 = y(27); % rdex
a216 = y(28); % s
a143 = y(28); % s
a222 = y(29); % swc

t1 = a1;
t229 = -(a1);
t230 = -(t229);
t8 = a6 * a7;
t9 = a5 - t8;
t231 = -(t9);
t232 = -(a23);
t38 = -(a24);
t40 = t38 / a39;
t41 = exp(t40);
t42 = a37 * t41;
t45 = a5 / a39;
t47 = t45 - a46;
t44 = a24 + a43;
t48 = t44 * t47;
t49 = exp(t48);
t236 = t47 * t49;
t237 = t42 * t236;
t233 = t229 / a39;
t234 = t41 * t233;
t235 = a37 * t234;
t238 = t49 * t235;
t239 = t237 + t238;
t53 = a5 - a52;
t54 = a51 * t53;
t55 = exp(t54);
t240 = t239 / t55;
t241 = -(t240);
t36 = exp(a35);
t242 = t237 / t55;
t243 = -(t242);
t50 = t42 * t49;
t244 = t53 * t55;
t245 = t50 * t244;
t246 = -(t245);
t247 = t55 * t55;
t248 = t246 / t247;
t249 = -(t248);
t60 = -(a30);
t61 = t60 / a39;
t62 = exp(t61);
t63 = a37 * t62;
t65 = a30 + a64;
t66 = t47 * t65;
t67 = exp(t66);
t354 = t47 * t67;
t355 = t63 * t354;
t352 = t62 * t233;
t353 = a37 * t352;
t356 = t67 * t353;
t357 = t355 + t356;
t70 = t53 * a69;
t71 = exp(t70);
t358 = t357 / t71;
t359 = -(t358);
t59 = exp(a58);
t360 = t355 / t71;
t361 = -(t360);
t68 = t63 * t67;
t362 = t53 * t71;
t363 = t68 * t362;
t364 = -(t363);
t365 = t71 * t71;
t366 = t364 / t365;
t367 = -(t366);
t78 = exp(a77);
t470 = -(t78);
t75 = exp(a74);
t471 = a5 * t75;
t472 = -(t471);
t473 = t75 * t75;
t474 = t472 / t473;
t84 = exp(a83);
t493 = -(t84);
t81 = exp(a80);
t494 = a5 * t81;
t495 = -(t494);
t496 = t81 * t81;
t497 = t495 / t496;
t87 = a77 + a86;
t88 = exp(t87);
t516 = -(t88);
t93 = exp(a92);
t94 = a5 + t93;
t96 = exp(a95);
t97 = t94 / t96;
t98 = exp(a21);
t99 = t97 * t98;
t517 = -(t99);
t518 = t93 / t96;
t519 = t98 * t518;
t520 = -(t519);
t91 = exp(a90);
t521 = t94 * t96;
t522 = -(t521);
t523 = t96 * t96;
t524 = t522 / t523;
t525 = t98 * t524;
t526 = -(t525);
t105 = a83 + a104;
t106 = exp(t105);
t560 = -(t106);
t111 = exp(a110);
t112 = a5 + t111;
t114 = exp(a113);
t115 = t112 / t114;
t116 = exp(a29);
t117 = t115 * t116;
t561 = -(t117);
t562 = t111 / t114;
t563 = t116 * t562;
t564 = -(t563);
t109 = exp(a108);
t565 = t112 * t114;
t566 = -(t565);
t567 = t114 * t114;
t568 = t566 / t567;
t569 = t116 * t568;
t570 = -(t569);
t604 = -(a7);
t605 = -(a131);
t150 = -(a149);
t144 = exp(a143);
t145 = a142 * t144;
t606 = a5 * t145;
t607 = -(t606);
t608 = t145 * t145;
t609 = t607 / t608;
t146 = a5 / t145;
t147 = a5 + t146;
t610 = t609 / t147;
t611 = t150 * t610;
t155 = a149 - a5;
t612 = -(t145);
t613 = t144 * t144;
t614 = t612 / t613;
t152 = a142 / t144;
t153 = a5 + t152;
t615 = t614 / t153;
t616 = t155 * t615;
t617 = t611 + t616;
t618 = -(t617);
t160 = a5 + t145;
t697 = t145 / t160;
t698 = t155 * t697;
t163 = t144 / a142;
t164 = a5 + t163;
t699 = t163 / t164;
t700 = a149 * t699;
t701 = t698 - t700;
t702 = -(t701);
t173 = a5 - a149;
t737 = -(t173);
t739 = a52 - a1;
t740 = a188 ^ t739;
t741 = a52 * t740;
t742 = a37 * t741;
t743 = -(t742);
t184 = a5 - t45;
t185 = a43 * t184;
t186 = exp(t185);
t744 = t184 * t186;
t193 = a64 * t184;
t194 = exp(t193);
t762 = t184 * t194;
t199 = a5 - a46;
t198 = a196 + a197;
t200 = t198 * t199;
t201 = exp(t200);
t765 = t199 * t201;
t766 = -(t765);
t206 = a204 + a205;
t207 = t199 * t206;
t208 = exp(t207);
t771 = t199 * t208;
t772 = -(t771);
t777 = a1 / a188;
t778 = -(t777);
t788 = a1 / a203;
t789 = -(t788);
t223 = a5 + t144;
t799 = t144 * t223;
t800 = t799 - t613;
t801 = t223 * t223;
t802 = t800 / t801;
t803 = -(t802);
% setting the output variable
out = zeros(29, 29);
out(1,26) = out(1,26) + t1; % EC(0)
out(1,12) = out(1,12) + t230; % x(-1)
out(1,24) = out(1,24) + t229; % xf(-1)
out(1,26) = out(1,26) + t231; % EC(-1)
out(2,2) = out(2,2) + t1; % dd(0)
out(2,1) = out(2,1) + t232; % dc(0)
out(3,14) = out(3,14) + t1; % ddf(0)
out(3,13) = out(3,13) + t232; % dcf(0)
out(4,1) = out(4,1) + t241; % dc(0)
out(4,7) = out(4,7) + t36; % m(0)
out(4,11) = out(4,11) + t243; % u(0)
out(4,6) = out(4,6) + t249; % ce(-1)
out(5,13) = out(5,13) + t359; % dcf(0)
out(5,19) = out(5,19) + t59; % mf(0)
out(5,23) = out(5,23) + t361; % uf(0)
out(5,18) = out(5,18) + t367; % cef(-1)
out(6,7) = out(6,7) + t470; % m(1)
out(6,10) = out(6,10) + t474; % rf(0)
out(7,19) = out(7,19) + t493; % mf(1)
out(7,22) = out(7,22) + t497; % rff(0)
out(8,7) = out(8,7) + t516; % m(1)
out(8,9) = out(8,9) + t516; % rd(1)
out(9,2) = out(9,2) + t517; % dd(0)
out(9,8) = out(9,8) + t520; % pd(0)
out(9,9) = out(9,9) + t91; % rd(0)
out(9,8) = out(9,8) + t526; % pd(-1)
out(10,10) = out(10,10) + t230; % rf(0)
out(10,27) = out(10,27) + t1; % rdex(0)
out(10,9) = out(10,9) + t229; % rd(0)
out(11,19) = out(11,19) + t560; % mf(1)
out(11,21) = out(11,21) + t560; % rdf(1)
out(12,14) = out(12,14) + t561; % ddf(0)
out(12,20) = out(12,20) + t564; % pdf(0)
out(12,21) = out(12,21) + t109; % rdf(0)
out(12,20) = out(12,20) + t570; % pdf(-1)
out(13,3) = out(13,3) + t1; % dy(0)
out(13,26) = out(13,26) + t604; % EC(0)
out(13,12) = out(13,12) + t229; % x(-1)
out(14,15) = out(14,15) + t1; % dyf(0)
out(14,26) = out(14,26) + t604; % EC(0)
out(14,24) = out(14,24) + t229; % xf(-1)
out(15,12) = out(15,12) + t1; % x(0)
out(15,12) = out(15,12) + t605; % x(-1)
out(16,24) = out(16,24) + t1; % xf(0)
out(16,24) = out(16,24) + t605; % xf(-1)
out(17,4) = out(17,4) + t1; % f(0)
out(17,28) = out(17,28) + t618; % s(0)
out(18,16) = out(18,16) + t1; % ff(0)
out(18,28) = out(18,28) + t702; % s(0)
out(19,3) = out(19,3) + t150; % dy(0)
out(19,15) = out(19,15) + t737; % dyf(0)
out(19,4) = out(19,4) + t229; % f(0)
out(19,1) = out(19,1) + t1; % dc(0)
out(19,4) = out(19,4) + t230; % f(-1)
out(20,3) = out(20,3) + t737; % dy(0)
out(20,15) = out(20,15) + t150; % dyf(0)
out(20,16) = out(20,16) + t229; % ff(0)
out(20,13) = out(20,13) + t1; % dcf(0)
out(20,16) = out(20,16) + t230; % ff(-1)
out(21,5) = out(21,5) + t743; % CE(0)
out(21,11) = out(21,11) + t744; % u(0)
out(22,5) = out(22,5) + t743; % CE(0)
out(22,23) = out(22,23) + t762; % uf(0)
out(23,1) = out(23,1) + t766; % dc(1)
out(23,11) = out(23,11) + t766; % u(1)
out(23,5) = out(23,5) + t1; % CE(0)
out(24,13) = out(24,13) + t772; % dcf(1)
out(24,23) = out(24,23) + t772; % uf(1)
out(24,17) = out(24,17) + t1; % CEf(0)
out(25,5) = out(25,5) + t778; % CE(0)
out(25,6) = out(25,6) + t1; % ce(0)
out(26,17) = out(26,17) + t789; % CEf(0)
out(26,18) = out(26,18) + t1; % cef(0)
out(27,28) = out(27,28) + t1; % s(0)
out(27,1) = out(27,1) + t229; % dc(0)
out(27,7) = out(27,7) + t229; % m(0)
out(27,13) = out(27,13) + t230; % dcf(0)
out(27,19) = out(27,19) + t230; % mf(0)
out(27,28) = out(27,28) + t229; % s(-1)
out(28,29) = out(28,29) + t1; % swc(0)
out(28,28) = out(28,28) + t803; % s(0)
out(29,25) = out(29,25) + t1; % de(0)
out(29,7) = out(29,7) + t230; % m(0)
out(29,19) = out(29,19) + t229; % mf(0)
