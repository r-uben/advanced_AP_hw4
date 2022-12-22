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
t132 = a130 + a131;
t133 = t126 * t132;
t134 = exp(t133);
t135 = a117 - t134;
t137 = log(a108);
t138 = a136 - t137;
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
t158 = exp(a157);
t160 = exp(a159);
t161 = a33 + t160;
t163 = exp(a162);
t164 = t161 / t163;
t165 = exp(a51);
t166 = t164 * t165;
t167 = t158 - t166;
t168 = exp(a143);
t169 = -(a46);
t170 = t169 / a100;
t171 = exp(t170);
t172 = a106 * t171;
t173 = a46 + a103;
t174 = t101 - a125;
t175 = t173 * t174;
t176 = exp(t175);
t177 = t172 * t176;
t179 = a33 - a109;
t180 = a178 * t179;
t181 = exp(t180);
t182 = t177 / t181;
t183 = t168 - t182;
t184 = exp(a145);
t185 = -(a52);
t186 = t185 / a100;
t187 = exp(t186);
t188 = a106 * t187;
t189 = a52 + a114;
t190 = t174 * t189;
t191 = exp(t190);
t192 = t188 * t191;
t194 = t179 * a193;
t195 = exp(t194);
t196 = t192 / t195;
t197 = t184 - t196;
t199 = exp(a198);
t200 = a33 / t199;
t202 = exp(a201);
t203 = t200 - t202;
t205 = exp(a204);
t206 = a33 / t205;
t208 = exp(a207);
t209 = t206 - t208;
t211 = a201 + a210;
t212 = exp(t211);
t213 = a33 - t212;
t215 = exp(a214);
t217 = exp(a216);
t218 = a33 + t217;
t220 = exp(a219);
t221 = t218 / t220;
t222 = exp(a44);
t223 = t221 * t222;
t224 = t215 - t223;
t226 = a214 - a198;
t227 = a225 - t226;
t229 = a207 + a228;
t230 = exp(t229);
t231 = a33 - t230;
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
out(15) = t135;
out(16) = t138;
out(17) = t141;
out(18) = t149;
out(19) = t153;
out(20) = t156;
out(21) = t167;
out(22) = t183;
out(23) = t197;
out(24) = t203;
out(25) = t209;
out(26) = t213;
out(27) = t224;
out(28) = t227;
out(29) = t231;
