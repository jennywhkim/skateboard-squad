function g_ss = autogen_control_vector_field(boardI,boardMass,boardTheta,bottomLinkI,bottomLinkRCoM,bottomLinkMass,bottomLinkTheta,bottomLinkHeight,topLinkI,topLinkRCoM,topLinkMass,topLinkTheta)
%AUTOGEN_CONTROL_VECTOR_FIELD
%    G_SS = AUTOGEN_CONTROL_VECTOR_FIELD(BOARDI,BOARDMASS,BOARDTHETA,BOTTOMLINKI,BOTTOMLINKRCOM,BOTTOMLINKMASS,BOTTOMLINKTHETA,BOTTOMLINKHEIGHT,TOPLINKI,TOPLINKRCOM,TOPLINKMASS,TOPLINKTHETA)

%    This function was generated by the Symbolic Math Toolbox version 8.5.
%    02-May-2020 17:03:37

t2 = cos(topLinkTheta);
t3 = boardTheta+bottomLinkTheta;
t4 = boardMass.*topLinkRCoM;
t5 = bottomLinkMass.*topLinkRCoM;
t6 = boardTheta.*2.0;
t7 = boardTheta.*3.0;
t8 = boardTheta.*4.0;
t9 = bottomLinkTheta.*2.0;
t10 = bottomLinkTheta.*3.0;
t11 = bottomLinkTheta.*4.0;
t12 = bottomLinkRCoM.^2;
t13 = bottomLinkHeight.^2;
t14 = topLinkTheta.*2.0;
t15 = topLinkRCoM.^2;
t19 = -topLinkTheta;
t24 = boardI.*bottomLinkI.*topLinkI.*topLinkMass.*4.0;
t26 = boardI.*boardMass.*bottomLinkI.*topLinkI.*4.0;
t27 = boardI.*bottomLinkI.*bottomLinkMass.*topLinkI.*4.0;
t28 = boardI.*bottomLinkI.*topLinkI.*topLinkMass.*8.0;
t30 = bottomLinkRCoM.*bottomLinkMass.*bottomLinkHeight.*topLinkI.*topLinkMass.*4.0;
t33 = boardI.*boardMass.*bottomLinkI.*topLinkI.*8.0;
t34 = boardI.*bottomLinkI.*bottomLinkMass.*topLinkI.*8.0;
t74 = boardI.*bottomLinkRCoM.*bottomLinkMass.*bottomLinkHeight.*topLinkI.*topLinkMass.*-4.0;
t75 = boardI.*bottomLinkRCoM.*bottomLinkMass.*bottomLinkHeight.*topLinkI.*topLinkMass.*8.0;
t76 = bottomLinkI.*bottomLinkRCoM.*bottomLinkMass.*bottomLinkHeight.*topLinkI.*topLinkMass.*-4.0;
t77 = bottomLinkI.*bottomLinkRCoM.*bottomLinkMass.*bottomLinkHeight.*topLinkI.*topLinkMass.*8.0;
t16 = cos(t14);
t17 = cos(t3);
t18 = t3+topLinkTheta;
t20 = boardMass.*bottomLinkHeight.*t2;
t21 = bottomLinkRCoM.*bottomLinkMass.*t2;
t22 = bottomLinkMass.*bottomLinkHeight.*t2;
t25 = t3+t14;
t31 = t3.*2.0;
t32 = t3+t19;
t39 = boardMass.*bottomLinkMass.*t12.*topLinkI.*2.0;
t41 = boardMass.*t13.*topLinkI.*topLinkMass.*2.0;
t42 = bottomLinkMass.*t12.*topLinkI.*topLinkMass.*2.0;
t43 = bottomLinkMass.*t13.*topLinkI.*topLinkMass.*2.0;
t44 = -t30;
t45 = t4.*topLinkI.*topLinkRCoM.*topLinkMass.*2.0;
t46 = t5.*topLinkI.*topLinkRCoM.*topLinkMass.*2.0;
t47 = boardI.*t30;
t48 = bottomLinkI.*t30;
t49 = bottomLinkHeight.*t2.*t4.*topLinkI.*topLinkMass.*4.0;
t50 = bottomLinkRCoM.*t2.*t5.*topLinkI.*topLinkMass.*4.0;
t51 = bottomLinkHeight.*t2.*t5.*topLinkI.*topLinkMass.*4.0;
t55 = boardI.*boardMass.*bottomLinkMass.*t12.*topLinkI.*4.0;
t57 = boardMass.*bottomLinkI.*bottomLinkMass.*t12.*topLinkI.*4.0;
t58 = boardI.*bottomLinkI.*t4.*topLinkRCoM.*topLinkMass.*2.0;
t59 = boardI.*bottomLinkI.*t4.*topLinkRCoM.*topLinkMass.*4.0;
t61 = boardI.*boardMass.*t13.*topLinkI.*topLinkMass.*4.0;
t62 = boardI.*bottomLinkI.*t5.*topLinkRCoM.*topLinkMass.*2.0;
t64 = boardI.*bottomLinkI.*t5.*topLinkRCoM.*topLinkMass.*4.0;
t65 = boardI.*bottomLinkMass.*t12.*topLinkI.*topLinkMass.*4.0;
t68 = boardI.*bottomLinkMass.*t13.*topLinkI.*topLinkMass.*4.0;
t69 = boardMass.*bottomLinkI.*t13.*topLinkI.*topLinkMass.*4.0;
t71 = bottomLinkI.*bottomLinkMass.*t12.*topLinkI.*topLinkMass.*4.0;
t73 = bottomLinkI.*bottomLinkMass.*t13.*topLinkI.*topLinkMass.*4.0;
t79 = boardI.*t4.*topLinkI.*topLinkRCoM.*topLinkMass.*4.0;
t82 = boardI.*t5.*topLinkI.*topLinkRCoM.*topLinkMass.*4.0;
t83 = bottomLinkI.*t4.*topLinkI.*topLinkRCoM.*topLinkMass.*4.0;
t85 = bottomLinkI.*t5.*topLinkI.*topLinkRCoM.*topLinkMass.*4.0;
t86 = t4.*t5.*t12.*topLinkMass;
t97 = -t75;
t98 = -t77;
t104 = boardI.*bottomLinkHeight.*t2.*t4.*topLinkI.*topLinkMass.*8.0;
t105 = boardI.*bottomLinkRCoM.*t2.*t5.*topLinkI.*topLinkMass.*-4.0;
t106 = boardI.*bottomLinkRCoM.*t2.*t5.*topLinkI.*topLinkMass.*8.0;
t107 = boardI.*bottomLinkHeight.*t2.*t5.*topLinkI.*topLinkMass.*8.0;
t108 = bottomLinkI.*bottomLinkHeight.*t2.*t4.*topLinkI.*topLinkMass.*8.0;
t109 = bottomLinkI.*bottomLinkRCoM.*t2.*t5.*topLinkI.*topLinkMass.*-4.0;
t110 = bottomLinkI.*bottomLinkRCoM.*t2.*t5.*topLinkI.*topLinkMass.*8.0;
t111 = bottomLinkI.*bottomLinkHeight.*t2.*t5.*topLinkI.*topLinkMass.*8.0;
t23 = cos(t18);
t29 = cos(t25);
t35 = -t21;
t36 = cos(t31);
t37 = t3+t18;
t38 = t18+t31;
t40 = cos(t32);
t54 = boardI.*t39;
t56 = bottomLinkI.*t39;
t60 = boardI.*t41;
t63 = boardI.*t42;
t66 = boardI.*t43;
t67 = bottomLinkI.*t41;
t70 = bottomLinkI.*t42;
t72 = bottomLinkI.*t43;
t78 = boardI.*t45;
t80 = boardI.*t46;
t81 = bottomLinkI.*t45;
t84 = bottomLinkI.*t46;
t87 = -t50;
t88 = t3+t25;
t89 = t25+t31;
t91 = boardI.*t49;
t92 = boardI.*t50;
t93 = boardI.*t51;
t94 = bottomLinkI.*t49;
t95 = bottomLinkI.*t50;
t96 = bottomLinkI.*t51;
t102 = boardI.*t86;
t103 = bottomLinkI.*t86;
t114 = -t106;
t115 = -t110;
t156 = (t16.*t86)./2.0;
t52 = cos(t37);
t53 = cos(t38);
t90 = t3.*2.0+t88;
t99 = cos(t88);
t100 = cos(t89);
t112 = t102.*2.0;
t113 = t103.*2.0;
t122 = t30.*t36;
t123 = t16.*t102;
t124 = t16.*t103;
t125 = t36.*t47;
t126 = t36.*t48;
t130 = t36.*t39;
t131 = t36.*t41;
t132 = t36.*t42;
t133 = t36.*t43;
t134 = bottomLinkRCoM.*bottomLinkMass.*bottomLinkHeight.*t36.*topLinkI.*topLinkMass.*-4.0;
t135 = t36.*t54;
t136 = t36.*t55;
t137 = t36.*t56;
t138 = t36.*t57;
t139 = t36.*t60;
t140 = t36.*t61;
t141 = t36.*t63;
t142 = t36.*t65;
t143 = t36.*t66;
t144 = t36.*t67;
t145 = t36.*t68;
t146 = t36.*t69;
t147 = t36.*t70;
t148 = t36.*t71;
t149 = t36.*t72;
t150 = t36.*t73;
t151 = t36.*t74;
t152 = t36.*t75;
t153 = t36.*t76;
t154 = t36.*t77;
t163 = boardI.*bottomLinkRCoM.*bottomLinkMass.*bottomLinkHeight.*t36.*topLinkI.*topLinkMass.*-8.0;
t164 = bottomLinkI.*bottomLinkRCoM.*bottomLinkMass.*bottomLinkHeight.*t36.*topLinkI.*topLinkMass.*-8.0;
t165 = t36.*t86;
t180 = t36.*t102;
t181 = t36.*t103;
t101 = cos(t90);
t116 = boardMass.*bottomLinkHeight.*t52;
t117 = bottomLinkRCoM.*bottomLinkMass.*t52;
t118 = bottomLinkMass.*bottomLinkHeight.*t52;
t119 = t4.*t99;
t120 = t5.*t99;
t127 = bottomLinkHeight.*t4.*t52.*topLinkI.*topLinkMass.*4.0;
t128 = bottomLinkRCoM.*t5.*t52.*topLinkI.*topLinkMass.*4.0;
t129 = bottomLinkHeight.*t5.*t52.*topLinkI.*topLinkMass.*4.0;
t166 = boardI.*bottomLinkHeight.*t4.*t52.*topLinkI.*topLinkMass.*8.0;
t167 = boardI.*bottomLinkRCoM.*t5.*t52.*topLinkI.*topLinkMass.*-4.0;
t168 = boardI.*bottomLinkRCoM.*t5.*t52.*topLinkI.*topLinkMass.*8.0;
t169 = boardI.*bottomLinkHeight.*t5.*t52.*topLinkI.*topLinkMass.*8.0;
t170 = bottomLinkI.*bottomLinkHeight.*t4.*t52.*topLinkI.*topLinkMass.*8.0;
t171 = bottomLinkI.*bottomLinkRCoM.*t5.*t52.*topLinkI.*topLinkMass.*-4.0;
t172 = bottomLinkI.*bottomLinkRCoM.*t5.*t52.*topLinkI.*topLinkMass.*8.0;
t173 = bottomLinkI.*bottomLinkHeight.*t5.*t52.*topLinkI.*topLinkMass.*8.0;
t174 = t123./2.0;
t175 = t124./2.0;
t176 = t45.*t99;
t177 = t46.*t99;
t182 = t36.*t112;
t183 = t36.*t113;
t184 = t58.*t99;
t185 = t59.*t99;
t186 = t62.*t99;
t187 = t64.*t99;
t188 = t78.*t99;
t189 = t79.*t99;
t190 = t80.*t99;
t191 = t81.*t99;
t192 = t82.*t99;
t193 = t83.*t99;
t194 = t84.*t99;
t195 = t85.*t99;
t196 = t86.*t99;
t197 = t99.*t102;
t199 = t99.*t103;
t201 = t99.*t112;
t202 = t99.*t113;
t121 = -t117;
t155 = -t128;
t157 = boardI.*t127;
t158 = boardI.*t128;
t159 = boardI.*t129;
t160 = bottomLinkI.*t127;
t161 = bottomLinkI.*t128;
t162 = bottomLinkI.*t129;
t178 = -t168;
t179 = -t172;
t198 = t101.*t102;
t200 = t101.*t103;
t203 = (t86.*t101)./2.0;
t204 = t198./2.0;
t205 = t200./2.0;
t206 = t4+t5+t20+t22+t35+t116+t118+t119+t120+t121;
t209 = t28+t33+t34+t55+t57+t59+t61+t64+t65+t68+t69+t71+t73+t79+t82+t83+t85+t97+t98+t104+t107+t108+t111+t112+t113+t114+t115+t123+t124+t136+t138+t140+t142+t145+t146+t148+t150+t163+t164+t166+t169+t170+t173+t178+t179+t182+t183+t185+t187+t189+t192+t193+t195+t198+t200+t201+t202;
t207 = t24+t26+t27+t54+t56+t58+t60+t62+t63+t66+t67+t70+t72+t74+t76+t78+t80+t81+t84+t91+t93+t94+t96+t102+t103+t105+t109+t135+t137+t139+t141+t143+t144+t147+t149+t151+t153+t157+t159+t160+t162+t167+t171+t174+t175+t180+t181+t184+t186+t188+t190+t191+t194+t197+t199+t204+t205;
t210 = 1.0./t209;
t208 = 1.0./t207;
t211 = boardI.*t206.*t210.*topLinkRCoM.*topLinkMass.*4.0;
t212 = -t211;
g_ss = reshape([0.0,0.0,0.0,0.0,0.0,boardI.*t210.*(bottomLinkRCoM.*bottomLinkMass.*t17.*topLinkI.*4.0+bottomLinkHeight.*t17.*topLinkI.*topLinkMass.*4.0+t23.*topLinkI.*topLinkRCoM.*topLinkMass.*4.0+bottomLinkRCoM.*t5.*t17.*topLinkRCoM.*topLinkMass.*2.0+bottomLinkRCoM.*t5.*t29.*topLinkRCoM.*topLinkMass+bottomLinkRCoM.*t5.*t100.*topLinkRCoM.*topLinkMass).*2.0,0.0,-t208.*(t39+t41+t42+t43+t44+t45+t46+t49+t51+t86+t87+t127+t129+t130+t131+t132+t133+t134+t155+t156+t165+t176+t177+t196+t203),t208.*(t39+t41+t42+t43+t44+t45+t46+t49+t51+t86+t87+t127+t129+t130+t131+t132+t133+t134+t155+t156+t165+t176+t177+t196+t203+boardI.*boardMass.*topLinkI.*4.0+boardI.*bottomLinkMass.*topLinkI.*4.0+boardI.*topLinkI.*topLinkMass.*4.0+boardI.*t4.*topLinkRCoM.*topLinkMass.*2.0+boardI.*t5.*topLinkRCoM.*topLinkMass.*2.0+boardI.*t119.*topLinkRCoM.*topLinkMass.*2.0+boardI.*t120.*topLinkRCoM.*topLinkMass.*2.0),t212,0.0,0.0,0.0,0.0,0.0,t210.*topLinkRCoM.*topLinkMass.*(boardI.*bottomLinkI.*t23.*-4.0+boardI.*bottomLinkRCoM.*t5.*t17.*2.0+boardI.*bottomLinkRCoM.*t5.*t29-boardI.*bottomLinkMass.*t12.*t23.*2.0+boardI.*bottomLinkRCoM.*t5.*t100-boardI.*bottomLinkMass.*t12.*t40-boardI.*bottomLinkMass.*t12.*t53+bottomLinkI.*bottomLinkRCoM.*t5.*t17.*2.0+bottomLinkI.*bottomLinkRCoM.*t5.*t29-bottomLinkI.*bottomLinkMass.*t12.*t23.*2.0+bottomLinkI.*bottomLinkRCoM.*t5.*t100-bottomLinkI.*bottomLinkMass.*t12.*t40-bottomLinkI.*bottomLinkMass.*t12.*t53+boardI.*bottomLinkRCoM.*bottomLinkMass.*bottomLinkHeight.*t23.*2.0+boardI.*bottomLinkRCoM.*bottomLinkMass.*bottomLinkHeight.*t40+boardI.*bottomLinkRCoM.*bottomLinkMass.*bottomLinkHeight.*t53+bottomLinkI.*bottomLinkRCoM.*bottomLinkMass.*bottomLinkHeight.*t23.*2.0+bottomLinkI.*bottomLinkRCoM.*bottomLinkMass.*bottomLinkHeight.*t40+bottomLinkI.*bottomLinkRCoM.*bottomLinkMass.*bottomLinkHeight.*t53).*-2.0,0.0,bottomLinkI.*t206.*t210.*topLinkRCoM.*topLinkMass.*-4.0,t212,t208.*(boardI.*boardMass.*bottomLinkI.*2.0+boardI.*bottomLinkI.*bottomLinkMass.*2.0+boardI.*bottomLinkI.*topLinkMass.*2.0+boardI.*boardMass.*t13.*topLinkMass+boardI.*bottomLinkMass.*t12.*topLinkMass+boardI.*bottomLinkMass.*t13.*topLinkMass+boardMass.*bottomLinkI.*t13.*topLinkMass+bottomLinkI.*bottomLinkMass.*t12.*topLinkMass+bottomLinkI.*bottomLinkMass.*t13.*topLinkMass+boardI.*t4.*topLinkRCoM.*topLinkMass+boardI.*t5.*topLinkRCoM.*topLinkMass+boardI.*t119.*topLinkRCoM.*topLinkMass+boardI.*t120.*topLinkRCoM.*topLinkMass+bottomLinkI.*t4.*topLinkRCoM.*topLinkMass+bottomLinkI.*t5.*topLinkRCoM.*topLinkMass+bottomLinkI.*t119.*topLinkRCoM.*topLinkMass+bottomLinkI.*t120.*topLinkRCoM.*topLinkMass+boardI.*boardMass.*bottomLinkMass.*t12+boardMass.*bottomLinkI.*bottomLinkMass.*t12-boardI.*bottomLinkRCoM.*bottomLinkMass.*bottomLinkHeight.*topLinkMass.*2.0-bottomLinkI.*bottomLinkRCoM.*bottomLinkMass.*bottomLinkHeight.*topLinkMass.*2.0+boardI.*boardMass.*bottomLinkMass.*t12.*t36+boardMass.*bottomLinkI.*bottomLinkMass.*t12.*t36+boardI.*boardMass.*t13.*t36.*topLinkMass-boardI.*bottomLinkRCoM.*t2.*t5.*topLinkMass.*2.0-boardI.*bottomLinkRCoM.*t5.*t52.*topLinkMass.*2.0+boardI.*bottomLinkMass.*t12.*t36.*topLinkMass+boardI.*bottomLinkMass.*t13.*t36.*topLinkMass+boardMass.*bottomLinkI.*t13.*t36.*topLinkMass+boardI.*bottomLinkHeight.*t2.*t4.*topLinkMass.*2.0+boardI.*bottomLinkHeight.*t2.*t5.*topLinkMass.*2.0+boardI.*bottomLinkHeight.*t4.*t52.*topLinkMass.*2.0+boardI.*bottomLinkHeight.*t5.*t52.*topLinkMass.*2.0-bottomLinkI.*bottomLinkRCoM.*t2.*t5.*topLinkMass.*2.0-bottomLinkI.*bottomLinkRCoM.*t5.*t52.*topLinkMass.*2.0+bottomLinkI.*bottomLinkMass.*t12.*t36.*topLinkMass+bottomLinkI.*bottomLinkMass.*t13.*t36.*topLinkMass+bottomLinkI.*bottomLinkHeight.*t2.*t4.*topLinkMass.*2.0+bottomLinkI.*bottomLinkHeight.*t2.*t5.*topLinkMass.*2.0+bottomLinkI.*bottomLinkHeight.*t4.*t52.*topLinkMass.*2.0+bottomLinkI.*bottomLinkHeight.*t5.*t52.*topLinkMass.*2.0-boardI.*bottomLinkRCoM.*bottomLinkMass.*bottomLinkHeight.*t36.*topLinkMass.*2.0-bottomLinkI.*bottomLinkRCoM.*bottomLinkMass.*bottomLinkHeight.*t36.*topLinkMass.*2.0).*2.0],[10,2]);
