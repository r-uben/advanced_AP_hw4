% Usage:
%       out = Model1001_f(params, y)
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

function out = Model1001_f(params, y)
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
t60 = exp(a59);
t61 = a58 * t60;
t62 = a33 / t61;
t63 = a33 + t62;
t64 = log(t63);
t66 = -(a65);
t67 = t64 * t66;
t68 = a58 / t60;
t69 = a33 + t68;
t70 = log(t69);
t71 = a65 - a33;
t72 = t70 * t71;
t73 = t67 + t72;
t74 = a57 - t73;
t76 = a33 + t61;
t77 = log(t76);
t78 = t71 * t77;
t79 = t60 / a58;
t80 = a33 + t79;
t81 = log(t80);
t82 = a65 * t81;
t83 = t78 - t82;
t84 = a75 - t83;
t86 = a57 - a85;
t87 = a4 * a65;
t88 = t86 + t87;
t89 = a33 - a65;
t90 = a15 * t89;
t91 = t88 + t90;
t92 = a46 - t91;
t94 = a75 - a93;
t95 = a4 * t89;
t96 = t94 + t95;
t97 = a15 * a65;
t98 = t96 + t97;
t99 = a52 - t98;
t101 = a33 / a100;
t102 = a33 - t101;
t104 = t102 * a103;
t105 = exp(t104);
t107 = a33 - a106;
t110 = a108 ^ a109;
t111 = a106 * t110;
t112 = t107 + t111;
t113 = t105 - t112;
t115 = t102 * a114;
t116 = exp(t115);
t118 = a117 ^ a109;
t119 = a106 * t118;
t120 = t107 + t119;
t121 = t116 - t120;
t124 = a122 + a123;
t126 = a33 - a125;
t127 = t124 * t126;
t128 = exp(t127);
t129 = a108 - t128;
t131 = log(a108);
t132 = a130 - t131;
t135 = a133 + a134;
t136 = t126 * t135;
t137 = exp(t136);
t138 = a117 - t137;
t140 = log(a117);
t141 = a139 - t140;
t144 = a142 + a143;
t146 = t144 - a145;
t147 = a46 + t146;
t148 = t147 - a52;
t149 = a59 - t148;
t151 = a33 + t60;
t152 = t60 / t151;
t153 = a150 - t152;
t155 = a145 - a143;
t156 = a154 - t155;
t157 = exp(a143);
t158 = -(a46);
t159 = t158 / a100;
t160 = exp(t159);
t161 = a106 * t160;
t162 = a46 + a103;
t163 = t101 - a125;
t164 = t162 * t163;
t165 = exp(t164);
t166 = t161 * t165;
t168 = a33 - a109;
t169 = a167 * t168;
t170 = exp(t169);
t171 = t166 / t170;
t172 = t157 - t171;
t173 = exp(a145);
t174 = -(a52);
t175 = t174 / a100;
t176 = exp(t175);
t177 = a106 * t176;
t178 = a52 + a114;
t179 = t163 * t178;
t180 = exp(t179);
t181 = t177 * t180;
t183 = t168 * a182;
t184 = exp(t183);
t185 = t181 / t184;
t186 = t173 - t185;
t188 = exp(a187);
t189 = a33 / t188;
t191 = exp(a190);
t192 = t189 - t191;
t194 = exp(a193);
t195 = a33 / t194;
t197 = exp(a196);
t198 = t195 - t197;
t200 = a190 + a199;
t201 = exp(t200);
t202 = a33 - t201;
t204 = exp(a203);
t206 = exp(a205);
t207 = a33 + t206;
t209 = exp(a208);
t210 = t207 / t209;
t211 = exp(a44);
t212 = t210 * t211;
t213 = t204 - t212;
t215 = a203 - a187;
t216 = a214 - t215;
t218 = a196 + a217;
t219 = exp(t218);
t220 = a33 - t219;
t222 = exp(a221);
t224 = exp(a223);
t225 = a33 + t224;
t227 = exp(a226);
t228 = t225 / t227;
t229 = exp(a51);
t230 = t228 * t229;
t231 = t222 - t230;
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
out(9) = t84;
out(10) = t92;
out(11) = t99;
out(12) = t113;
out(13) = t121;
out(14) = t129;
out(15) = t132;
out(16) = t138;
out(17) = t141;
out(18) = t149;
out(19) = t153;
out(20) = t156;
out(21) = t172;
out(22) = t186;
out(23) = t192;
out(24) = t198;
out(25) = t202;
out(26) = t213;
out(27) = t216;
out(28) = t220;
out(29) = t231;
