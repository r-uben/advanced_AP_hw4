% Usage:
%       out = model1_f(params, y)
%   where
%       out    is a (29,1) column vector of the residuals
%              of the static system
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

function out = model1_f(params, y)
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

t7 = a5 + a6;
t9 = t7 + a8;
t12 = a10 * a11;
t13 = t9 + t12;
t14 = a4 - t13;
t17 = a5 + a16;
t19 = t17 + a18;
t20 = t19 - t12;
t21 = a15 - t20;
t24 = a6 * a23;
t26 = t24 + a25;
t27 = a22 - t26;
t29 = a16 * a23;
t31 = t29 + a30;
t32 = a28 - t31;
t35 = a10 * a34;
t36 = a33 - t35;
t38 = t36 * a37;
t39 = a16 + t38;
t40 = a18 + t39;
t41 = a6 + a8;
t42 = t40 - t41;
t43 = a11 - t42;
t47 = a46 - a5;
t48 = a45 * t47;
t49 = a5 + t48;
t50 = a44 - t49;
t53 = a52 - a5;
t54 = a45 * t53;
t55 = a5 + t54;
t56 = a51 - t55;
t60 = -(a59);
t61 = exp(t60);
t63 = t61 / a62;
t64 = a33 + t63;
t65 = log(t64);
t66 = a58 * t65;
t67 = a33 - a58;
t68 = t61 * a62;
t69 = a33 + t68;
t70 = log(t69);
t71 = t67 * t70;
t72 = t66 + t71;
t73 = -(t72);
t74 = a57 - t73;
t76 = exp(a59);
t77 = t76 / a62;
t78 = a33 + t77;
t79 = log(t78);
t80 = a58 * t79;
t81 = a62 * t76;
t82 = a33 + t81;
t83 = log(t82);
t84 = t67 * t83;
t85 = t80 + t84;
t86 = -(t85);
t87 = a75 - t86;
t89 = a57 - a88;
t90 = a4 * a58;
t91 = t89 + t90;
t92 = a15 * t67;
t93 = t91 + t92;
t94 = a46 - t93;
t96 = a75 - a95;
t97 = a4 * t67;
t98 = t96 + t97;
t99 = a15 * a58;
t100 = t98 + t99;
t101 = a52 - t100;
t103 = a33 / a102;
t104 = a33 - t103;
t106 = t104 * a105;
t107 = exp(t106);
t109 = a33 - a108;
t112 = a110 ^ a111;
t113 = a108 * t112;
t114 = t109 + t113;
t115 = t107 - t114;
t117 = t104 * a116;
t118 = exp(t117);
t120 = a119 ^ a111;
t121 = a108 * t120;
t122 = t109 + t121;
t123 = t118 - t122;
t126 = a124 + a125;
t128 = a33 - a127;
t129 = t126 * t128;
t130 = exp(t129);
t131 = a110 - t130;
t133 = log(a110);
t134 = a132 - t133;
t137 = a135 + a136;
t138 = t128 * t137;
t139 = exp(t138);
t140 = a119 - t139;
t142 = log(a119);
t143 = a141 - t142;
t146 = a144 + a145;
t148 = t146 - a147;
t149 = a46 + t148;
t150 = t149 - a52;
t151 = exp(t150);
t152 = t76 - t151;
t154 = a33 + t76;
t155 = t76 / t154;
t156 = a153 - t155;
t158 = exp(a157);
t159 = a147 - a145;
t160 = exp(t159);
t161 = t158 - t160;
t162 = exp(a145);
t163 = -(a46);
t164 = t163 / a102;
t165 = exp(t164);
t166 = a108 * t165;
t167 = a46 + a105;
t168 = t103 - a127;
t169 = t167 * t168;
t170 = exp(t169);
t171 = t166 * t170;
t173 = a33 - a111;
t174 = a172 * t173;
t175 = exp(t174);
t176 = t171 / t175;
t177 = t162 - t176;
t178 = exp(a147);
t179 = -(a52);
t180 = t179 / a102;
t181 = exp(t180);
t182 = a108 * t181;
t183 = a52 + a116;
t184 = t168 * t183;
t185 = exp(t184);
t186 = t182 * t185;
t188 = t173 * a187;
t189 = exp(t188);
t190 = t186 / t189;
t191 = t178 - t190;
t193 = exp(a192);
t194 = a33 / t193;
t196 = exp(a195);
t197 = t194 - t196;
t199 = exp(a198);
t200 = a33 / t199;
t202 = exp(a201);
t203 = t200 - t202;
t205 = a195 + a204;
t206 = exp(t205);
t207 = a33 - t206;
t209 = exp(a208);
t211 = exp(a210);
t212 = a33 + t211;
t214 = exp(a213);
t215 = t212 / t214;
t216 = exp(a44);
t217 = t215 * t216;
t218 = t209 - t217;
t220 = a208 - a192;
t221 = a219 - t220;
t223 = a201 + a222;
t224 = exp(t223);
t225 = a33 - t224;
t227 = exp(a226);
t229 = exp(a228);
t230 = a33 + t229;
t232 = exp(a231);
t233 = t230 / t232;
t234 = exp(a51);
t235 = t233 * t234;
t236 = t227 - t235;
% setting the output variable
out = zeros(29, 1);
out(1) = t14;
out(2) = t21;
out(3) = t27;
out(4) = t32;
out(5) = t43;
out(6) = t50;
out(7) = t56;
out(8) = t74;
out(9) = t87;
out(10) = t94;
out(11) = t101;
out(12) = t115;
out(13) = t123;
out(14) = t131;
out(15) = t134;
out(16) = t140;
out(17) = t143;
out(18) = t152;
out(19) = t156;
out(20) = t161;
out(21) = t177;
out(22) = t191;
out(23) = t197;
out(24) = t203;
out(25) = t207;
out(26) = t218;
out(27) = t221;
out(28) = t225;
out(29) = t236;
