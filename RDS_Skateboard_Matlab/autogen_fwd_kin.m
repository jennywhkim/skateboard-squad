function FK = autogen_fwd_kin(boardX,boardY,boardMass,boardTheta,boardHeight,bottomLinkRCoM,bottomLinkMass,bottomLinkTheta,bottomLinkHeight,topLinkRCoM,topLinkMass,topLinkTheta,topLinkHeight,wheelRadius)
%AUTOGEN_FWD_KIN
%    FK = AUTOGEN_FWD_KIN(BOARDX,BOARDY,BOARDMASS,BOARDTHETA,BOARDHEIGHT,BOTTOMLINKRCOM,BOTTOMLINKMASS,BOTTOMLINKTHETA,BOTTOMLINKHEIGHT,TOPLINKRCOM,TOPLINKMASS,TOPLINKTHETA,TOPLINKHEIGHT,WHEELRADIUS)

%    This function was generated by the Symbolic Math Toolbox version 8.5.
%    18-May-2020 17:14:36

t2 = cos(boardTheta);
t3 = sin(boardTheta);
t4 = boardTheta+bottomLinkTheta;
t7 = boardMass+bottomLinkMass+topLinkMass;
t9 = -boardX;
t11 = boardHeight./2.0;
t5 = cos(t4);
t6 = sin(t4);
t8 = t4+topLinkTheta;
t17 = t2.*t11;
t18 = t3.*t11;
t21 = 1.0./t7;
t23 = boardHeight.*t3.*(-1.0./2.0);
t24 = boardY+t11+wheelRadius;
t10 = sin(t8);
t12 = cos(t8);
t13 = bottomLinkRCoM.*t5;
t14 = bottomLinkHeight.*t5;
t15 = bottomLinkRCoM.*t6;
t16 = bottomLinkHeight.*t6;
t19 = t12.*topLinkRCoM;
t20 = t10.*topLinkRCoM;
t22 = -t16;
t25 = t13+t17+t24;
t26 = t14+t17+t19+t24;
FK = reshape([boardX,t24,boardX-t15+t23,t25,boardX-t20+t22+t23,t26,-t21.*(topLinkMass.*(t9+t16+t18+t20)+boardMass.*t9+bottomLinkMass.*(t9+t15+t18)),t21.*(boardMass.*t24+bottomLinkMass.*t25+t26.*topLinkMass),boardX+t22+t23-t10.*topLinkHeight,t14+t17+t24+t12.*topLinkHeight],[2,5]);
