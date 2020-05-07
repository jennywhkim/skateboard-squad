%% inv_mass_matrix.m
%
% Description:
%   Wrapper function for autogen_inverse_mass_matrix.m
%   Computes the mass matrix of the jumping robot.
%
% Inputs:
%   x: the state vector, x = [q; q_dot];
%   params: a struct with many elements, generated by calling init_params.m
%
% Outputs:
%   Minv: a 5x5 inverse mass matrix for the robot.

function Minv = inv_mass_matrix(x,params)

%boardI,boardMass,boardTheta,bottomLinkI,
%bottomLinkRCoM,bottomLinkMass,
%bottomLinkTheta,bottomLinkHeight,topLinkI,
%topLinkRCoM,topLinkMass,topLinkTheta

Minv = autogen_inverse_mass_matrix(params.boardI,...
                                   params.boardMass,...
                                   x(3),...
                                   params.bottomLinkI,...
                                   params.bottomLinkYCoM,...
                                   params.bottomLinkMass,...
                                   x(4),...
                                   params.bottomLinkHeight,...
                                   params.topLinkI,...
                                   params.topLinkYCoM,...
                                   params.topLinkMass,...
                                   x(5));

end

