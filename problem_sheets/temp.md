Yes, I can provide the MATLAB code to calculate both the angular velocity ($\boldsymbol{\omega}$) and the angular acceleration ($\dot{\boldsymbol{\omega}}$) from the given MRP trajectory.

We'll use the following relationships:

1.  **Angular Velocity ($\boldsymbol{\omega}$):**
    As discussed before, the relationship between $\dot{\boldsymbol{\sigma}}$ and $\boldsymbol{\omega}$ is:
    $$\boldsymbol{\omega} = 4 B(\boldsymbol{\sigma}) \dot{\boldsymbol{\sigma}}$$
    where $B(\boldsymbol{\sigma}) = \frac{1}{1 + \boldsymbol{\sigma}^T \boldsymbol{\sigma}} \left( I - [\tilde{\boldsymbol{\sigma}}] + \boldsymbol{\sigma} \boldsymbol{\sigma}^T \right)$.

2.  **Angular Acceleration ($\dot{\boldsymbol{\omega}}$):**
    To find $\dot{\boldsymbol{\omega}}$, we need to differentiate the $\boldsymbol{\omega}$ equation with respect to time using the product rule:
    $$\dot{\boldsymbol{\omega}} = 4 \left( \dot{B}(\boldsymbol{\sigma}) \dot{\boldsymbol{\sigma}} + B(\boldsymbol{\sigma}) \ddot{\boldsymbol{\sigma}} \right)$$

    Let's find $\dot{B}(\boldsymbol{\sigma})$. This is a bit more involved.
    $B(\boldsymbol{\sigma}) = \frac{1}{1 + \boldsymbol{\sigma}^T \boldsymbol{\sigma}} \left( I - [\tilde{\boldsymbol{\sigma}}] + \boldsymbol{\sigma} \boldsymbol{\sigma}^T \right)$

    Let $k = \frac{1}{1 + \boldsymbol{\sigma}^T \boldsymbol{\sigma}}$ and $M = I - [\tilde{\boldsymbol{\sigma}}] + \boldsymbol{\sigma} \boldsymbol{\sigma}^T$.
    Then $B(\boldsymbol{\sigma}) = k M$.

    $\dot{B}(\boldsymbol{\sigma}) = \dot{k} M + k \dot{M}$

    First, $\dot{k}$:
    $\dot{k} = \frac{d}{dt} (1 + \boldsymbol{\sigma}^T \boldsymbol{\sigma})^{-1} = -1 (1 + \boldsymbol{\sigma}^T \boldsymbol{\sigma})^{-2} \frac{d}{dt} (\boldsymbol{\sigma}^T \boldsymbol{\sigma})$
    $\frac{d}{dt} (\boldsymbol{\sigma}^T \boldsymbol{\sigma}) = \dot{\boldsymbol{\sigma}}^T \boldsymbol{\sigma} + \boldsymbol{\sigma}^T \dot{\boldsymbol{\sigma}} = 2 \boldsymbol{\sigma}^T \dot{\boldsymbol{\sigma}}$
    So, $\dot{k} = - \frac{2 \boldsymbol{\sigma}^T \dot{\boldsymbol{\sigma}}}{(1 + \boldsymbol{\sigma}^T \boldsymbol{\sigma})^2}$

    Next, $\dot{M}$:
    $\dot{M} = \frac{d}{dt} (I - [\tilde{\boldsymbol{\sigma}}] + \boldsymbol{\sigma} \boldsymbol{\sigma}^T)$
    $\dot{I} = 0$
    $\frac{d}{dt} ([\tilde{\boldsymbol{\sigma}}]) = [\tilde{\dot{\boldsymbol{\sigma}}}]$
    $\frac{d}{dt} (\boldsymbol{\sigma} \boldsymbol{\sigma}^T) = \dot{\boldsymbol{\sigma}} \boldsymbol{\sigma}^T + \boldsymbol{\sigma} \dot{\boldsymbol{\sigma}}^T$

    So, $\dot{M} = -[\tilde{\dot{\boldsymbol{\sigma}}}] + \dot{\boldsymbol{\sigma}} \boldsymbol{\sigma}^T + \boldsymbol{\sigma} \dot{\boldsymbol{\sigma}}^T$

    Combining these, we get:
    $$\dot{B}(\boldsymbol{\sigma}) = - \frac{2 \boldsymbol{\sigma}^T \dot{\boldsymbol{\sigma}}}{(1 + \boldsymbol{\sigma}^T \boldsymbol{\sigma})^2} \left( I - [\tilde{\boldsymbol{\sigma}}] + \boldsymbol{\sigma} \boldsymbol{\sigma}^T \right) + \frac{1}{1 + \boldsymbol{\sigma}^T \boldsymbol{\sigma}} \left( -[\tilde{\dot{\boldsymbol{\sigma}}}] + \dot{\boldsymbol{\sigma}} \boldsymbol{\sigma}^T + \boldsymbol{\sigma} \dot{\boldsymbol{\sigma}}^T \right)$$

This is quite complex to implement manually, but necessary for accuracy.

Let's define a MATLAB function that computes $\boldsymbol{\sigma}$, $\dot{\boldsymbol{\sigma}}$, and $\ddot{\boldsymbol{\sigma}}$ first.

```matlab
function [sigma_r, dot_sigma_r, ddot_sigma_r] = getMRP_trajectory_components(t)
% getMRP_trajectory_components Calculates the MRP, its first, and second derivatives.
%
%   [sigma_r, dot_sigma_r, ddot_sigma_r] = getMRP_trajectory_components(t)
%
%   Inputs:
%       t - Time in seconds (scalar)
%
%   Outputs:
%       sigma_r      - 3x1 vector, MRP trajectory at time t.
%       dot_sigma_r  - 3x1 vector, First derivative of MRP at time t.
%       ddot_sigma_r - 3x1 vector, Second derivative of MRP at time t.

    % Given MRP trajectory: sigma_r = 0.1 * [sin(0.05*t); sin(0.10*t); sin(0.15*t)];
    sigma_r = 0.1 * [sin(0.05 * t);
                     sin(0.10 * t);
                     sin(0.15 * t)];

    % First derivative: dot_sigma_r
    dot_sigma_r = 0.1 * [0.05 * cos(0.05 * t);
                         0.10 * cos(0.10 * t);
                         0.15 * cos(0.15 * t)];

    % Second derivative: ddot_sigma_r
    ddot_sigma_r = 0.1 * [-0.05^2 * sin(0.05 * t);
                          -0.10^2 * sin(0.10 * t);
                          -0.15^2 * sin(0.15 * t)];

end
```

Now, the main function to calculate $\boldsymbol{\omega}$ and $\dot{\boldsymbol{\omega}}$:

```matlab
function [omega, dot_omega] = calculateOmegaAndDotOmegaFromMRP(t)
% calculateOmegaAndDotOmegaFromMRP Calculates the angular velocity (omega)
%   and angular acceleration (dot_omega) from a given MRP trajectory.
%
%   [omega, dot_omega] = calculateOmegaAndDotOmegaFromMRP(t)
%
%   Inputs:
%       t - Time in seconds (scalar or vector)
%
%   Outputs:
%       omega     - Angular velocity vector [omega_x; omega_y; omega_z] in rad/s.
%                   If t is a scalar, omega is a 3x1 vector.
%                   If t is a vector, omega is a 3xN matrix.
%       dot_omega - Angular acceleration vector [dot_omega_x; dot_omega_y; dot_omega_z] in rad/s^2.
%                   If t is a scalar, dot_omega is a 3x1 vector.
%                   If t is a vector, dot_omega is a 3xN matrix.

    if isscalar(t)
        omega = zeros(3, 1);
        dot_omega = zeros(3, 1);
    else
        omega = zeros(3, length(t));
        dot_omega = zeros(3, length(t));
    end

    for i = 1:length(t)
        current_t = t(i);

        % Get MRP and its derivatives at current_t
        [sigma_r, dot_sigma_r, ddot_sigma_r] = getMRP_trajectory_components(current_t);

        % --- Common calculations for Omega and Dot_Omega ---
        sigma_T_sigma = dot(sigma_r, sigma_r);
        tilde_sigma = [0, -sigma_r(3), sigma_r(2);
                       sigma_r(3), 0, -sigma_r(1);
                       -sigma_r(2), sigma_r(1), 0];
        sigma_sigma_T = sigma_r * sigma_r';
        I = eye(3);

        % Calculate B(sigma)
        denominator_B = 1 + sigma_T_sigma;
        B_sigma = (1 / denominator_B) * (I - tilde_sigma + sigma_sigma_T);

        % --- Calculate Omega ---
        omega_current = 4 * B_sigma * dot_sigma_r;

        % --- Calculate Dot_Omega ---

        % Calculate dot_sigma_T_sigma
        dot_sigma_T_sigma = dot(dot_sigma_r, sigma_r); % or sigma_r' * dot_sigma_r

        % Calculate derivative of tilde_sigma (tilde_dot_sigma)
        tilde_dot_sigma = [0, -dot_sigma_r(3), dot_sigma_r(2);
                           dot_sigma_r(3), 0, -dot_sigma_r(1);
                           -dot_sigma_r(2), dot_sigma_r(1), 0];

        % Calculate derivative of sigma_sigma_T (dot_sigma_sigma_T)
        dot_sigma_sigma_T = dot_sigma_r * sigma_r' + sigma_r * dot_sigma_r';

        % Calculate M = (I - tilde_sigma + sigma_sigma_T)
        M_matrix = (I - tilde_sigma + sigma_sigma_T);

        % Calculate dot_k = -2 * (sigma_T_dot_sigma) / (1 + sigma_T_sigma)^2
        dot_k = -2 * dot_sigma_T_sigma / (denominator_B^2);

        % Calculate dot_M = -tilde_dot_sigma + dot_sigma_sigma_T
        dot_M = -tilde_dot_sigma + dot_sigma_sigma_T;

        % Calculate dot_B_sigma = dot_k * M + (1/denominator_B) * dot_M
        dot_B_sigma = dot_k * M_matrix + (1 / denominator_B) * dot_M;

        % Calculate dot_omega = 4 * (dot_B_sigma * dot_sigma_r + B_sigma * ddot_sigma_r)
        dot_omega_current = 4 * (dot_B_sigma * dot_sigma_r + B_sigma * ddot_sigma_r);

        % Store results
        omega(:, i) = omega_current;
        dot_omega(:, i) = dot_omega_current;
    end
end
```

### How to use this MATLAB code:

1.  **Save the functions:**
    Save the first code block as `getMRP_trajectory_components.m`.
    Save the second code block as `calculateOmegaAndDotOmegaFromMRP.m`.
    Make sure both files are in your MATLAB working directory.

2.  **Call the main function:**
    You can call `calculateOmegaAndDotOmegaFromMRP` from the MATLAB command window or another script.

    * **To find $\boldsymbol{\omega}$ and $\dot{\boldsymbol{\omega}}$ at a specific time (e.g., $t=0$):**
        ```matlab
        t0 = 0;
        [omega_at_t0, dot_omega_at_t0] = calculateOmegaAndDotOmegaFromMRP(t0);
        disp(['Omega at t = ', num2str(t0), ' seconds:']);
        disp(omega_at_t0);
        disp(['Dot_Omega at t = ', num2str(t0), ' seconds:']);
        disp(dot_omega_at_t0);
        ```
        Output for $t=0$:
        ```
        Omega at t = 0 seconds:
            0.0200
            0.0400
            0.0600
        Dot_Omega at t = 0 seconds:
            0.0000
            0.0000
            0.0000
        ```
        The $\dot{\boldsymbol{\omega}}$ at $t=0$ is zero because the MRP components are sines and their second derivatives are sines, which are zero at $t=0$. Also, the first derivatives are cosines, which are constant-like around $t=0$ in terms of contribution to the cross product.

    * **To find $\boldsymbol{\omega}$ and $\dot{\boldsymbol{\omega}}$ over a range of time values (e.g., from 0 to 20 seconds with 0.1 second increments) and plot them:**
        ```matlab
        time_values = 0:0.1:20; % Define your time vector
        [omega_trajectory, dot_omega_trajectory] = calculateOmegaAndDotOmegaFromMRP(time_values);

        % Plot Omega components
        figure;
        subplot(2,1,1);
        plot(time_values, omega_trajectory(1,:), 'r', 'LineWidth', 1.5);
        hold on;
        plot(time_values, omega_trajectory(2,:), 'g', 'LineWidth', 1.5);
        plot(time_values, omega_trajectory(3,:), 'b', 'LineWidth', 1.5);
        xlabel('Time (s)');
        ylabel('Angular Velocity (rad/s)');
        title('Angular Velocity Components over Time');
        legend('\omega_x', '\omega_y', '\omega_z');
        grid on;

        % Plot Dot_Omega components
        subplot(2,1,2);
        plot(time_values, dot_omega_trajectory(1,:), 'r--', 'LineWidth', 1.5);
        hold on;
        plot(time_values, dot_omega_trajectory(2,:), 'g--', 'LineWidth', 1.5);
        plot(time_values, dot_omega_trajectory(3,:), 'b--', 'LineWidth', 1.5);
        xlabel('Time (s)');
        ylabel('Angular Acceleration (rad/s^2)');
        title('Angular Acceleration Components over Time');
        legend('\dot{\omega}_x', '\dot{\omega}_y', '\dot{\omega}_z');
        grid on;
        ```

This set of functions provides a robust way to calculate both angular velocity and angular acceleration from your given MRP trajectory.