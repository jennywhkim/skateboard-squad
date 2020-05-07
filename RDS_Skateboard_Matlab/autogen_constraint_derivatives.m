function [A_all,H_constL,H_constR] = autogen_constraint_derivatives(boardTheta,boardHeight,boardLength)
%AUTOGEN_CONSTRAINT_DERIVATIVES
%    [A_ALL,H_CONSTL,H_CONSTR] = AUTOGEN_CONSTRAINT_DERIVATIVES(BOARDTHETA,BOARDHEIGHT,BOARDLENGTH)

%    This function was generated by the Symbolic Math Toolbox version 8.5.
%    06-May-2020 23:17:51

t2 = cos(boardTheta);
t3 = sin(boardTheta);
t4 = (boardHeight.*t2)./2.0;
t5 = (boardLength.*t2)./2.0;
t6 = (boardHeight.*t3)./2.0;
t7 = (boardLength.*t3)./2.0;
t8 = -t4;
t9 = -t6;
A_all = reshape([0.0,0.0,-1.0,-1.0,t5+t9,-t5+t9,0.0,0.0,0.0,0.0],[2,5]);
if nargout > 1
    H_constL = reshape([0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,-t7+t8,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],[5,5]);
end
if nargout > 2
    H_constR = reshape([0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,t7+t8,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0],[5,5]);
end
