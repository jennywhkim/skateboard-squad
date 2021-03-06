%% derive_equations.m
%
% Description:
%   Symbolically derive equations related to the skateboarding robot, including
%   the full nonlinear state-space dynamics and the state-space dynamics of
%   the system linearized about the unstable upright equilibrium.
%
% Inputs:
%   none
%
% Outputs:
%   none

function derive_equations
clear;
close all;
clc;

fprintf('Deriving skateboarding robot equations...\n');

%% Define generalized variables
fprintf('\tInitializing generalized coordinates, velocities, accelerations, and forces...\n');

% Generalized coordinates:
% boardX: position of the skateboard CoM along the x-axis
% boardY: position of the skateboard CoM along the y-axis
% boardTheta: angle of the skateboard CoM wrt the x-axis
% bottomLinkTheta: angle of the bottom link, ccw+ w.r.t. skateboard
% topLinkTheta: angle of the top link, ccw+ w.r.t. bottom link

syms boardX boardY boardTheta bottomLinkTheta topLinkTheta real
q = [boardX; boardY; boardTheta; bottomLinkTheta; topLinkTheta];

% Generalized velocities:
% boardDX: velocity of the skateboard CoM along the x-axis
% boardDY: velocity of the skateboard CoM along the y-axis
% boardDTheta: rate of change of angle of the skateboard CoM wrt the x-axis
% bottomLinkDTheta: angular velocity of angle of the bottom link, ccw+ w.r.t. skateboard
% topLinkDTheta: angular velocity of angle of the top link, ccw+ w.r.t. bottom link
syms boardDX boardDY boardDTheta bottomLinkDTheta topLinkDTheta real
dq = [boardDX; boardDY; boardDTheta; bottomLinkDTheta; topLinkDTheta];

% Generalized accelerations:
syms boardDDX boardDDY boardDDTheta bottomLinkDDTheta topLinkDDTheta real
% boardDX: acceleration of the skateboard CoM along the x-axis
% boardDY: acceleration of the skateboard CoM along the y-axis
% boardDTheta: angular acceleration of angle of the skateboard CoM wrt the x-axis
% bottomLinkDTheta: angular acceleration of angle of the bottom link, ccw+ w.r.t. skateboard
% topLinkDTheta: angular acceleration of angle of the top link, ccw+ w.r.t. bottom link
ddq = [boardDDX; boardDDY; boardDDTheta; bottomLinkDDTheta; topLinkDDTheta];

% Generalized forces:
syms  frictForce bottomMotorTorque topMotorTorque  real % force on the cart, in the x-direction
% Note: we are not defining a torque at the cart-pendulum joint, so the
% system is underactuated. This will make things interesting!

Q = [frictForce; bottomMotorTorque; topMotorTorque];

fprintf('\t...done.\n');


%% Define kinematics variables
fprintf('\tInitializing kinematics variables...\n');

% coordinates of the board CoM
syms boardXCoM boardYCoM real

% coordinate of the bottom link CoM:
syms bottomLinkXCoM bottomLinkYCoM  real
% Note: we already defined x_cart as the x-coordinate of the cart CoM.

% coordinates of the top link CoM:
syms topLinkXCoM topLinkYCoM  real

% Dimensions: distance from bottom, top edge to CoM bottom link:
syms bottomLinkRCoM topLinkRCoM real

% Dimensions: length of the bottom, top link:
syms bottomLinkHeight topLinkHeight real

% x- and y-coordinates of the pendulum tip:
syms x_tip_pend y_tip_pend real
% Note: the dynamics don't care where the pendulum tip is (only the 
% pendulum CoM), but keeping track of the tip will be helpful for 
% visualizing the robot (could also be helpful for some control tasks).
fprintf('\t...done.\n');

%% Define inertial (and other) parameters
fprintf('\tInitializing inertial (and other) parameters...\n');

% Mass of each body:
syms boardMass bottomLinkMass topLinkMass real

% Rotational inertia of the pendulum:
syms boardI bottomLinkI topLinkI real
% Note: the cart cannot rotate so we don't care about its rotational
% inertia

% Viscous damping at each joint:
b = sym('b',[numel(q),1],'real');
% Note: we'll account for damping at each joint (ground-cart and 
% cart-pendulum) but we can set each damping constant to 0 later if we
% want.

% Other variables
g = sym('g','real'); % gravity
t = sym('t','real'); % time

fprintf('\t...done.\n');

%% Forward kinematics
fprintf('\tGenerating forward kinematics equations...\n');

% compute the (x,y) location of the pendulum's center of mass:
bottomLinkXCoM = boardX + bottomLinkRCoM * sin(bottomLinkTheta); 
bottomLinkYCoM = boardY + bottomLinkRCoM * cos(bottomLinkTheta); 

topLinkXCoM = boardX + bottomLinkHeight * sin(bottomLinkTheta) + topLinkRCoM * sin(topLinkTheta); 
topLinkYCoM = boardY + bottomLinkHeight * cos(bottomLinkTheta) + topLinkRCoM * cos(topLinkTheta);

% compute the (x,y) location of the robot's tip:
robotTipX = boardX + bottomLinkHeight * sin(bottomLinkTheta) + topLinkHeight * sin(topLinkTheta); 
robotTipY = boardY + bottomLinkHeight * cos(bottomLinkTheta) + topLinkHeight * cos(topLinkTheta); 

% create a 2x3 array to hold all forward kinematics (FK) outputs:
FK = [boardX, bottomLinkXCoM, topLinkXCoM, robotTipX;
      boardY, bottomLinkYCoM, topLinkYCoM, robotTipY];

% generate a MATLAB function to compute all the FK outputs:
matlabFunction(FK,'File','autogen_fwd_kin');
% Note: this autogenerated function will make plotting/animation easier
% later. Could also help with some control tasks.
fprintf('\t...done.\n');

%% Derivatives
fprintf('\tGenerating time derivatives of the kinematics equations...\n');
% Neat trick to compute derivatives using the chain rule
% from https://github.com/MatthewPeterKelly/OptimTraj/blob/master/demo/fiveLinkBiped/Derive_Equations.m
derivative = @(in)( jacobian(in,[q;dq])*[dq;ddq] );

% CoM velocities:
syms boardDX boardDY bottomLinkDXCoM bottomLinkDYCoM topLinkDXCoM topLinkDYCoM  real

boardDX = derivative(boardX);
boardDY = derivative(boardY);

bottomLinkDXCoM = derivative(bottomLinkXCoM);
bottomLinkDYCoM = derivative(bottomLinkDYCoM);


topLinkDXCoM = derivative(topLinkXCoM);
topLinkDYCoM = derivative(topLinkDYCoM);


fprintf('\t...done.\n');

%% Kinetic energy
fprintf('\tGenerating kinetic energy equation...\n');

syms boardKE bottomLinkKE topLinkKE KE real

% kinetic energy of each body ONLY TRANSLATION:
boardKE = 1/2* boardMass * (boardDX)^2; % TODO: kinetic energy of the cart (translational)
bottomLinkKE = 1/2* bottomLinkMass * (bottomLinkDXCoM)^2;
topLinkKE = 1/2* topLinkMass * (topLinkDXCoM)^2;

% total kinetic energy:
KE = boardKE + bottomLinkKE + topLinkKE;

fprintf('\t...done.\n');

%% Potential energy
fprintf('\tGenerating potential energy equation...\n');

syms boardPE bottomLinkPE topLinkPE PE real

% potential energy of the pendulum:
boardPE = boardMass * g * boardY;
bottomLinkPE = bottomLinkMass * g * bottomLinkYCoM;
topLinkPE = bottomLinkMass * g * topLinkYCoM;

PE = boardPE + bottomLinkPE + topLinkPE; % TODO
% Note: the cart moves horizontally so its gravitational PE never changes.

fprintf('\t...done.\n');

%% Lagrangian
fprintf('\tGenerating Lagrangian...\n');

syms L real
L = KE - PE;

fprintf('\t...done.\n');

%% Euler-Lagrange equations
fprintf('\tGenerating Euler-Lagrange equations of motion...\n')

% Note: the Euler-Lagrange equations of motion are
%   d(del L/del dq)/dt - (del L/del qa) = generalized forces;
% I did not include damping in my Lagrangian (although it can be done, at
% least for viscous damping) so I have to lump it in with the other
% generalized forces (in this case, the only other generalized force is the
% control input u, i.e. the force applied horizontally to the cart).

% Variable initializations:
ELeq_term1  = sym('ELeq_term1',[numel(q),1],'real'); % d(del L/del dq)/dt
ELeq_term2  = sym('ELeq_term2',[numel(q),1],'real'); % del L/del qa
ELeq_damping= sym('ELeq_damping',[numel(q),1],'real'); % joint damping
ELeq_LHS    = sym('ELeq_LHS',[numel(q),1],'real');

for i = 1:numel(q)
    ELeq_term1(i) = simplify(derivative(diff(L,dq(i))));
    ELeq_term2(i) = simplify(diff(L,q(i)));
    ELeq_damping(i) = -b(i)*dq(i);
    ELeq_LHS(i) = ELeq_term1(i) - ELeq_term2(i) - ELeq_damping(i);
    ELeq_LHS(i) = simplify(ELeq_LHS(i));
end
fprintf('\t...done.\n')

%% Put E-L eq in manipulator form
fprintf('\tPutting Euler-Lagrange equations into manipulator form...\n');
fprintf('\t\tBuilding M, C, and G...\n');

% Note: the manipulator equation
%       M*ddq + C*dq + G = U
% is a generalization of F=ma. It represents the *inverse* dynamics, 
% mapping positions, velocities, and accelerations of the joints to forces
% or torques (depending on the nature of each joint).

% The mass matrix M is a matrix of partial derivatives of ELeq_LHS with
% respect to ddq. In MATLAB you can get this matrix by using diff:
%   M(i,j) = diff(thing1(i), thing2(j));
% It doesn't hurt to simplify the result: M = simplify(M)
% You could try using jacobian(thing1, thing2) instead of diff(); I use
% diff() because then I can intersperse fprintf statements to provide
% more granular info on how the computation of M is going.

% The gravity vector G is a column vector of the generalized forces due to
% gravity. Consequently, G is linear in "g" (the scalar acceleration due to
% gravity). You can compute G using diff(), as you did with M.

% The coriolis term C*dq is everything else in ELeq_LHS that is not already
% included in M or G.

% Note on notation: "M" and "C" are appropriate notations because they 
% denote the mass *matrix* and the coriolis *matrix*, respectively.
% However, "G" is technically inappropriate notation; "G" denotes the 
% configuration-dependent *vector* of generalized forces due to gravity.

M = sym('M',[numel(q),numel(q)],'real');
C = sym('C',[numel(q),numel(q)],'real');
G = sym('G',[numel(q),1],'real');

for i = 1:numel(q)
    fprintf('\t\ti = %d\n',i);
    fprintf('\t\t\tM(%d,:)...\n',i)
    for j = 1:numel(q)
        fprintf('\t\t\t\tj = %d\n',j);
        M(i,j) = diff(ELeq_LHS(i),ddq(j)); % TODO
        M(i,j) = simplify(M(i,j));
    end
    
    fprintf('\t\t\tG(%d)...\n',i)
    G(i) = diff(ELeq_LHS(i), g)*g; % G is linear in g
    
    fprintf('\t\t\tC(%d)...\n',i);
    % C*dq is everything else:
    for j = 1:numel(q)
        fprintf('\t\t\t\tj = %d\n',j);
        C(i,j) = diff((ELeq_LHS(i) - (M(i,:)*ddq + G(i))),dq(j));
    end
    C(i) = simplify(C(i)); % takes some time to execute
end
fprintf('\t\t...done building M, C, and G.\n');

% Note: we need inv(M) to compute the fwd. dynamics and therefore the 
% state-space dynamics (see below), so to ease computation cost we derive 
% inv(M) symbolically here:

% compute and store inv(M):
fprintf('\t\tComputing inv(M)...\n')
Minv = sym('Minv',[numel(q),numel(q)],'real');
Minv = simplify(inv(M));
fprintf('\t\t...done.\n')

fprintf('\t\tGenerating MATLAB functions...\n');
matlabFunction(M,'File','autogen_mass_matrix');
matlabFunction(C,'File','autogen_coriolis_matrix');
matlabFunction(G,'File','autogen_grav_vector');
fprintf('\t\t...done.\n');

fprintf('\t...done putting Euler-Lagrange equations into manipulator form.\n');

%% Generate (nonlinear) state-space model from manipulator equation
fprintf('\tConverting manipulator equation to state-space form...\n');

f_ss = sym('f_ss',[2*numel(q),1],'real'); % drift vector field
g_ss = sym('g_ss',[2*numel(q),1],'real'); % control vector field

% Note: building the state-space dynamics from the manipulator equation has
% two steps:
%
%   1) the manipulator equation gives the *inverse* dynamics (mapping from
%   state and accelerations to forces/torques). We need
%   the *forward* dynamics (mapping from state and forces/torques to
%   accelerations), so we must solve the manipulator equation for ddq:
%
%       ddq = -Minv*(C*dq + G) + Minv*[u; 0];
%
%   We could write a generalization of this equation as follows:
%
%       ddq = temp_drift + temp_ctrl*u
%
%   where
%       temp_drift = -Minv*(C*dq + G) and
%       temp_ctrl  = Minv*[1;0] (i.e., the first column of Minv).
%   The motivation for these variable names (temp_drift & temp_ctrl) is
%   explained below.
%
%   2) Solving the manipular equation for ddq gives us the forward
%   dynamics, represented as a system of 2nd-order ODEs. The state-space
%   dynamics are represented as a system of 1st-order ODEs, so we must
%   convert the 2nd-order system to a 1st-order system:
%
%       x   = [q;  dq]; % state vector
%       dx  = [dq; ddq]; % derivative of the state vector w.r.t. time
%
%       % Substitute the forward dynamics for ddq in the equation for dx,
%       resulting in a system of 4 1st-order ODEs:
%
%       dx = [dq; temp_drift + temp_ctrl*u];
%
%   There is more structure to this system of ODEs than may be
%   apparent at first glance. In particular, the control input u appears
%   linearly in the state-space dynamics, so we can (abstractly) write
%   the state-space dynamics as
%
%       dx = f_ss(x) + g_ss(x)*u,
%
%   where
%       f_ss(x) = [0; 0; temp_drift(1); temp_drift(2)] and
%       g_ss(x) = [0; 0; temp_ctrl(1);  temp_ctrl(2)].
%
%   This is called a "control-affine" system because the dynamics are
%   "affine" (linear) in the control input u; g_ss(x) (the coefficient of
%   u) is called the "control vector field", and f_ss(x) (everything else
%   that is not a coefficient of u) is called the "drift vector field"
%   (because it describes how the state "drifts" in the absence of control
%   input).
%
%   Note: the "_ss" suffix stands for "state-space" (not "steady-state").

temp_drift = simplify(-Minv*(C*dq + G)); % TODO, also use simplify(...)
temp_ctrl = simplify(Minv*[1;0]); % TODO, also use simplify(...)

% Build state-space representation:
for i = 1:numel(q)
    f_ss(i)   = dq(i);
    g_ss(i,:)   = 0;
    f_ss(i+2) = temp_drift(i);
    g_ss(i+2,:) = temp_ctrl(i,:);
end

matlabFunction(f_ss,'File','autogen_drift_vector_field');
matlabFunction(g_ss,'File','autogen_control_vector_field');

fprintf('\t...done converting manipulator equation to state-space form.\n');

%% Linearize the state-space model around the upright equilibrium
fprintf('\tLinearizing the dynamics about the upright equilibrium...\n')

% Note: we linearize the state-space dynamics by performing a 1st-order
% Taylor series approximation, evaluated at the upright equilibrium:
boardXEq = 0; % TODO
boardDXEq = 0;
boardYEq = 0;
boardDYEq = 0;
boardThetaEq = 0;
boardDThetaEq = 0;

bottomLinkThetaEq = 0;
bottomLinkDThetaEq = 0;

topLinkThetaEq = 0;
topLinkDThetaEq = 0;


% Note: we have been talking about x for a while above but haven't needed
% to define it as a symbolic variable until now:
x = [q; dq]; % just makes the code below easier to read)

% define the equilibrium state:
x_eq = [boardXEq; boardDXEq; boardYEq; boardDYEq; boardThetaEq; boardDThetaEq...
        bottomLinkThetaEq; bottomLinkDThetaEq; topLinkThetaEq; topLinkDThetaEq]; % TODO

% Step 1 of Taylor series approximation is to compute Jacobians:
f_ss_jac = jacobian(f_ss, x); % TODO: Jacobian of f_ss
g_ss_jac = jacobian(g_ss*u, u); % TODO: Jacobian of g_ss*u
% Note: g_ss_jac = g_ss because the nonlinear state-space dynamics are
% control-affine, but you should verify this!

% Evaluate Jacobians at the upright equilibrium:
A = simplify(subs(f_ss_jac, x, x_eq));
B = simplify(subs(g_ss_jac, x, x_eq));

fprintf('\t...done linearizing the dynamics about the upright equilibrium.\n')

matlabFunction(A,'File','autogen_upright_state_matrix');
matlabFunction(B,'File','autogen_upright_input_matrix');

%% Compute the controllability matrix and its rank
fprintf('\tComputing the controllability matrix of the linearized model...\n')

% Note: the linearized dynamics "near" the upright equilibrium are 
% controllable if rank(Co) = dim(x) (4 in our cart-pendulum example). This
% is called the Kalman controllability rank condition and is an
% easy-to-compute metric of controllability for a linear system, i.e., a 
% useful sanity check.

% Note: our cart-pendulum is underactuated (1 control input, 2 degees of
% freedom). Does that mean it is not controllable?

Co = [];
for i = 1:((2*numel(q)))
    Co = horzcat(Co,simplify((A^(i-1))*B));
end
fprintf('\t...done. The controllability matrix of the linearized model has rank %d.\n',...
    rank(Co));

%% Done!
fprintf('...done deriving cart-pendulum equations.\n');
end