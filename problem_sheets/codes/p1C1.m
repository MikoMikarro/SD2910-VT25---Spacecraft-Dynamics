clear;
clc;
close all;
addpath("../rotLib/");

%% Inputs
initialMRP = [0,0,0]';
angVel = deg2rad([-2, 1, 0.5])';
tspan = [0 60];
q0 = epFromRodrigues(initialMRP); % Quaternion version of the original


%% Computing using the quaternions
options = odeset('RelTol', 1e-8, 'AbsTol', 1e-8);
[t, q] = ode45(@(t, q) quaternion_derivative(q, angVel), tspan, q0, options);

q_mrp = rodriguesFromEp(q(end,:));

%% MRP Integration

different_dt = [0.1, 0.01, 0.001];
final_mrp = zeros([3, 3]);
final_mrp_q = zeros([3, 4]);
final_differences = zeros([3,1]);

% MRP functions
px = @(mrp) [ 0     -mrp(3) mrp(2)
             mrp(3)   0    -mrp(1)
            -mrp(2)  mrp(1)  0    ];
der_mrp = @(mrp, ang) 0.25*((1-norm(mrp)^2)*eye(3)+ 2*px(mrp)+ 2*mrp*mrp') * ang;


for i = 1:3
    current_t = 0;
    current_p = initialMRP;
    while current_t < tspan(2)
        current_p = current_p + der_mrp(current_p, angVel)*different_dt(i);
        if norm(current_p) > 0
            current_p = shadowRodriguesFromRodrigues(current_p)
        end
        current_t = current_t + different_dt(i);
    end
    final_mrp(i,:) = current_p;
    final_mrp_q(i,:) = epFromRodrigues(current_p);
    final_differences(i) = quaternion_angle(q(end,:), epFromRodrigues(current_p));
end


% Event function to detect when |p| exceeds 1
function [value, isterminal, direction] = shadow_set_event(t, p)
    % Value goes negative when |p| exceeds 1
    value = 1 - sum(p.^2);
    
    % Stop the integration when the event occurs
    isterminal = 1;
    
    % Detect only when crossing from positive to negative
    direction = -1;
end

% Quaternion derivative function
function dqdt = quaternion_derivative(q, omega)
    % Reshape q to ensure it's a column vector
    q = q(:);
    
    % Normalize quaternion to combat numerical drift
    % q = q / norm(q);
    
    % Extract scalar and vector parts of quaternion
    q_scalar = q(1);
    q_vector = q(2:4);
    
    % Scalar part computation
    dq_scalar = -0.5 * dot(q_vector, omega);
    
    % Vector part computation
    dq_vector = 0.5 * (q_scalar * omega + cross(q_vector, omega));
    
    % Combine to form complete quaternion derivative
    dqdt = [dq_scalar; dq_vector];
end

function angle = quaternion_angle(q1, q2)
    % Normalize quaternions
    q1 = q1 / norm(q1);
    q2 = q2 / norm(q2);
    
    % The absolute value of the dot product gives the cosine of half the angle
    % between the orientations
    cos_half_angle = abs(dot(q1, q2));
    
    % Clamp to [-1, 1] to avoid numerical issues
    cos_half_angle = min(1, max(-1, cos_half_angle));
    
    % Calculate the angle (in radians)
    angle = 2 * acos(cos_half_angle);
end