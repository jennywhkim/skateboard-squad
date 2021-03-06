function constraints_flat = autogen_constraints_flat(boardY,boardTheta,boardHeight,boardLength,wheelRadius)
%AUTOGEN_CONSTRAINTS_FLAT
%    CONSTRAINTS_FLAT = AUTOGEN_CONSTRAINTS_FLAT(BOARDY,BOARDTHETA,BOARDHEIGHT,BOARDLENGTH,WHEELRADIUS)

%    This function was generated by the Symbolic Math Toolbox version 8.5.
%    18-May-2020 17:14:37

t2 = cos(boardTheta);
t3 = sin(boardTheta);
t5 = -boardY;
t6 = -wheelRadius;
t7 = boardHeight./2.0;
t4 = t2.*wheelRadius;
t8 = -t7;
t9 = t2.*t7;
t10 = (boardLength.*t3)./2.0;
constraints_flat = [t4+t5+t6+t8+t9+t10;t4+t5+t6+t8+t9-t10];
