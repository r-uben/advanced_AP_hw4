% Usage:
%       out = Model1_f(params, y)
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

function out = Model1_f(params, y)
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

t8 = a6 * a7;
t9 = a5 - t8;
t11 = t9 * a10;
t13 = t11 + a12;
t15 = t13 + a14;
t18 = a16 + a17;
t19 = t15 - t18;
t20 = a4 - t19;
t25 = a24 - a22;
t26 = a23 * t25;
t27 = a22 + t26;
t28 = a21 - t27;
t31 = a30 - a22;
t32 = a23 * t31;
t33 = a22 + t32;
t34 = a29 - t33;
t36 = exp(a35);
t38 = -(a24);
t40 = t38 / a39;
t41 = exp(t40);
t42 = a37 * t41;
t44 = a24 + a43;
t45 = a5 / a39;
t47 = t45 - a46;
t48 = t44 * t47;
t49 = exp(t48);
t50 = t42 * t49;
t53 = a5 - a52;
t54 = a51 * t53;
t55 = exp(t54);
t56 = t50 / t55;
t57 = t36 - t56;
t59 = exp(a58);
t60 = -(a30);
t61 = t60 / a39;
t62 = exp(t61);
t63 = a37 * t62;
t65 = a30 + a64;
t66 = t47 * t65;
t67 = exp(t66);
t68 = t63 * t67;
t70 = t53 * a69;
t71 = exp(t70);
t72 = t68 / t71;
t73 = t59 - t72;
t75 = exp(a74);
t76 = a5 / t75;
t78 = exp(a77);
t79 = t76 - t78;
t81 = exp(a80);
t82 = a5 / t81;
t84 = exp(a83);
t85 = t82 - t84;
t87 = a77 + a86;
t88 = exp(t87);
t89 = a5 - t88;
t91 = exp(a90);
t93 = exp(a92);
t94 = a5 + t93;
t96 = exp(a95);
t97 = t94 / t96;
t98 = exp(a21);
t99 = t97 * t98;
t100 = t91 - t99;
t102 = a90 - a74;
t103 = a101 - t102;
t105 = a83 + a104;
t106 = exp(t105);
t107 = a5 - t106;
t109 = exp(a108);
t111 = exp(a110);
t112 = a5 + t111;
t114 = exp(a113);
t115 = t112 / t114;
t116 = exp(a29);
t117 = t115 * t116;
t118 = t109 - t117;
t120 = a16 + a22;
t121 = a4 * a7;
t122 = t120 + t121;
t123 = a17 + t122;
t124 = a119 - t123;
t126 = a12 + a22;
t127 = t121 + t126;
t128 = a14 + t127;
t129 = a125 - t128;
t132 = a16 * a131;
t134 = t132 + a133;
t135 = a130 - t134;
t137 = a12 * a131;
t139 = t137 + a138;
t140 = a136 - t139;
t144 = exp(a143);
t145 = a142 * t144;
t146 = a5 / t145;
t147 = a5 + t146;
t148 = log(t147);
t150 = -(a149);
t151 = t148 * t150;
t152 = a142 / t144;
t153 = a5 + t152;
t154 = log(t153);
t155 = a149 - a5;
t156 = t154 * t155;
t157 = t151 + t156;
t158 = a141 - t157;
t160 = a5 + t145;
t161 = log(t160);
t162 = t155 * t161;
t163 = t144 / a142;
t164 = a5 + t163;
t165 = log(t164);
t166 = a149 * t165;
t167 = t162 - t166;
t168 = a159 - t167;
t170 = a141 - a169;
t171 = a119 * a149;
t172 = t170 + t171;
t173 = a5 - a149;
t174 = a125 * t173;
t175 = t172 + t174;
t176 = a24 - t175;
t178 = a159 - a177;
t179 = a119 * t173;
t180 = t178 + t179;
t181 = a125 * a149;
t182 = t180 + t181;
t183 = a30 - t182;
t184 = a5 - t45;
t185 = a43 * t184;
t186 = exp(t185);
t187 = a5 - a37;
t189 = a188 ^ a52;
t190 = a37 * t189;
t191 = t187 + t190;
t192 = t186 - t191;
t193 = a64 * t184;
t194 = exp(t193);
t195 = t194 - t191;
t198 = a196 + a197;
t199 = a5 - a46;
t200 = t198 * t199;
t201 = exp(t200);
t202 = a188 - t201;
t206 = a204 + a205;
t207 = t199 * t206;
t208 = exp(t207);
t209 = a203 - t208;
t211 = log(a188);
t212 = a210 - t211;
t214 = log(a203);
t215 = a213 - t214;
t217 = a35 + a216;
t218 = t217 - a58;
t219 = a24 + t218;
t220 = t219 - a30;
t221 = a143 - t220;
t223 = a5 + t144;
t224 = t144 / t223;
t225 = a222 - t224;
t227 = a58 - a35;
t228 = a226 - t227;
% setting the output variable
out = zeros(29, 1);
out(1) = t20;
out(2) = t28;
out(3) = t34;
out(4) = t57;
out(5) = t73;
out(6) = t79;
out(7) = t85;
out(8) = t89;
out(9) = t100;
out(10) = t103;
out(11) = t107;
out(12) = t118;
out(13) = t124;
out(14) = t129;
out(15) = t135;
out(16) = t140;
out(17) = t158;
out(18) = t168;
out(19) = t176;
out(20) = t183;
out(21) = t192;
out(22) = t195;
out(23) = t202;
out(24) = t209;
out(25) = t212;
out(26) = t215;
out(27) = t221;
out(28) = t225;
out(29) = t228;
