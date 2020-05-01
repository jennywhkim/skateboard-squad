%% control_vector_field.m
%
% Description:
%   Wrapper function for autogen_control_vector_field.m
%   Computes the control vector field for the nonlinear state-space
%   dynamics of the cart-pendulum robot.
%
% Inputs:
%   x: the state vector, x = [x_cart; theta_pend; dx_cart; dtheta_pend];
%   params: a struct with many elements, generated by calling init_params.m
%
% Outputs:
%   g_ss: a 4x1 vector that maps control input u to dx (time derivative of
%       the state x).

% boardI,boardMass,boardTheta,bottomLinkI,
% bottomLinkRCoM,bottomLinkMass,
% bottomLinkTheta,bottomLinkHeight,topLinkI,
% topLinkRCoM,topLinkMass,topLinkTheta

function g_ss = control_vector_field(x,params)

g_ss = autogen_control_vector_field(params.boardI,...
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