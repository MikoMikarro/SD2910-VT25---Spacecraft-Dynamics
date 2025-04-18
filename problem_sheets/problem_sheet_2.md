> All codes are matlab codes

# E 1
The code used to solve the problem is the following
```matlab
%% Inputs
I11 = 20; % kg m²
I22 = 60; % kg m²
I33 = 60; % kg m²

w = deg2rad([15, 5, -10])'; % rad / s

%% Calculations
% (a)
wp = ((I11/I22) - 1) * w(1);
T_p = abs(2*pi/wp)
% (b)
w_23 = sqrt(w(2)^2 + w(3)^2)
```
#### a
```matlab
T_p =
    36 s
```
#### b
```matlab
w_23 =
    0.1951 rad / s
```
# E 2

The code used to solve the problem is the following

```matlab
%% Inputs
I11 = 300; % kg m²
I22 = 200; % kg m²
I33 = 100; % kg m²
inertia = [I11  I22 I33];

% state: q0 q1 q2 q3 w1 w2 w3
state = [1, 0, 0, 0, 0.2, -0.3, 0.1];

%% Calculations

tspan = [0 60];
options = odeset('RelTol', 1e-8, 'AbsTol', 1e-8);
[t, c_state] = ode45(@(t, s) quaternion_derivative(s, inertia), tspan, state, options);

err = abs(c_state(:, 1).^2 + c_state(:, 2).^2 + c_state(:, 3).^2 + c_state(:, 4).^2 - 1);

%% Functions

function dqdt = quaternion_derivative(state, inertia)
    % Split state on its components
    q = state(1:4);
    omega = state(5:7);
    q1 = quaternion(q(1), q(2), q(3), q(4));
    o = quaternion(0, omega(1), omega(2), omega(3));

    % Quaternion derivative
    dq = 0.5*q1*o;
    [a0, a1, a2, a3] = dq.parts;

    % Omega derivative
    I11 = inertia(1);
    I22 = inertia(2);
    I33 = inertia(3);

    w1 = -(I33-I22)*omega(2)*omega(3)/I11;
    w2 = -(I11-I33)*omega(3)*omega(1)/I22;
    w3 = -(I22-I11)*omega(1)*omega(2)/I33;

    dqdt = [a0, a1, a2, a3, w1, w2, w3]';

end
```

Error remained under 2e-8 and the conversion from Euler Parameters to Euler Angles can be done with the codes from problem sheet 1

# E 3

The code used to solve the problem is the following

```matlab
%% Inputs
IS = 1500; % kg m²
IR = 500; % kg m²

w_0 = 1; % rad / s
wr_0 = -10; % rad / s
wr_1 = -9; % rad / s

%% Calculations

% Angular moment
H = IS*w_0 + IR*(wr_0+w_0);

% (a) New station rotation speed
w_1 = (H-IR*wr_1)/(IS+IR);

% Old kinetic energy
T_0 = 0.5*IS*w_0^2+0.5*IR*wr_0^2;

% (b) New kinetic energy
T_1 = 0.5*IS*w_1^2+0.5*IR*wr_1^2;
loss = T_0-T_1; % J
```

#### a
```matlab
w_1 =
    0.7500 rad/s
```
#### b
```matlab
loss =
    5.0781 kJ
```
#### c
For this transfer of energy to occur, some active system must actively create the internal torque, therefore consuming energy. As can be seen from the equations, the lack of external torque only implies a conservation of the angular moment, not kinetic energy. Other kind of **internal** energy must be used for the operation.

# E 4
The code used to solve the problem is the following

```matlab
%% Inputs
IS = [60 60 80]; % kg m²
wz_0 = 2; % rad s⁻¹

a = deg2rad(15); % rad

%% Calculations

% Angular moment (remains constant cause no external torque)
Hz = IS(3) * wz_0;
H = Hz / cos(a);
Ht = H * sin(a);
wt_0 = Ht / IS(1); % both x,y rotation

% (a) Final spin rate
wz_1 = H / IS(3); % rad/s

% Old kinetic energy
T_0 = 0.5*(IS(1)*wt_0^2 + IS(2)*wt_0^2 + IS(3)*wz_0^2);

% (b) New kinetic energy and loss
T_1 = 0.5*IS(3)*wz_1^2; % J
loss = T_0-T_1; % J
```

#### a
```matlab
wz_1 =
    2.0706 rad /s
```
#### b
```matlab
loss =
   19.1458 J
```

# E 5
Using the graphical solution ($\mathbf{H}$ pointing outwards) we end up with the following equations:

$$\mathbf{L} = \frac{\Delta \mathbf{H}}{\Delta t}; \qquad \Delta \mathbf{H} = \mathbf{H}_1 - \mathbf{H}_0$$

$$\mathbf{H}_0 = H\hat{\mathbf{z}}; \qquad \mathbf{H}_1 = H\cos \theta \hat{\mathbf{z}} + H \sin \theta \hat{\mathbf{x}}$$

$$\theta = \dot{\theta} \Delta t; \quad \dot{\theta} = \frac{2\pi}{T}$$

Being a stationary orbit, T = 24h, therefore $\dot{\theta}$ becomes a very small value. If we also end with a very small value of $\Delta t$, the moment equation can be approximated to:

$$\mathbf{L} = \frac{\Delta \mathbf{H}}{\Delta t} = \frac{ H\cos \theta \hat{\mathbf{z}} + H \sin \theta \hat{\mathbf{x}} - H\hat{\mathbf{z}}}{\Delta t} \approx \frac{ H\hat{\mathbf{z}} + H \dot{\theta}\Delta t \hat{\mathbf{x}} - H\hat{\mathbf{z}}}{\Delta t}= H\dot{\theta} \hat{\mathbf{x}}$$

$$L  = H \dot{\theta} = I_s\omega_s \cdot \frac{2 \pi}{24 \cdot 60 \cdot 60} = 13.708\quad \text{N m}$$

Expressed from the orbital frame.

**Using the transport theorem**:

$$\left( \frac{d \mathbf{H}}{dt} \right)\_{\text{inertial}} = \left(\frac{d\mathbf{H}}{dt} \right)\_{\text{orbital}} + \boldsymbol{\omega}\_{\text{orb}} \times \mathbf{H}$$

Since we want the spin axis to stay fixed in the orbital frame $\left( \frac{d\mathbf{H}}{dt} \right)\_{\text{orbital}} = 0$ so:

$$\mathbf{L} =\boldsymbol{\omega}_{\text{orb}} \times \mathbf{H}$$

Which is the same result we got before as $\boldsymbol{\omega}_{\text{orb}}$ has the value $\dot{\theta}\hat{\mathbf{y}}$ , still expressed on the orbital frame.

# E 6
The code used to solve this problem is the following:
```matlab
%% Inputs
IS = 1000; % kg m²
IG = 6000; % kg m²

ws_0 = 0.4; % rad/s
a = deg2rad(20); % rad

%% Calculations
H0 = IS * ws_0;
H1 = H0 / cos(a);
precession_rate = -H1/IG; % (4-77a, page 170)
t = abs(pi / precession_rate); % 180º in rad
```
Solution:
```matlab
t =
    44.2820 s
```

# C 1
The code used to solve problem **d** and **e** is the following:
```matlab
clear all; clc; close all;
addpath('./rotLib/')
%% Inputs
I1 = 2000; % kg m²
I2 = 1500; % kg m²
I3 = 1000; % kg m²
Is = 18;   % kg m²
vd = 30;   % N m s

statics = [I1 I2 I3 Is vd];

% initial_state: w1, w2, w3, sig1, sig2, sig3 rad/s
initial_state_d = [0.1224, 0, 2.99, 0, 0, 0];
initial_state_e = [0.125, 0, 2.99, 0, 0, 0];

%% Calculations

% (d) 
tspan = [0 2000];
options = odeset('RelTol', 1e-8, 'AbsTol', 1e-8);
[t, c_state] = ode45(@(t, s) state_derivative(s, statics), tspan, initial_state_d, options);
% [t, c_state] = ode45(@(t, s) state_derivative(s, statics), tspan, initial_state);
a_m = @(s) angular_moment(s, statics);
result = cellfun(a_m, num2cell(c_state, 2));
figure();
plot(t, result);
end_d = c_state(end, :)

% (e) 
tspan = [0 2000];
options = odeset('RelTol', 1e-8, 'AbsTol', 1e-8);
[t, c_state] = ode45(@(t, s) state_derivative(s, statics), tspan, initial_state_e, options);
% [t, c_state] = ode45(@(t, s) state_derivative(s, statics), tspan, initial_state);
a_m = @(s) angular_moment(s, statics);
result = cellfun(a_m, num2cell(c_state, 2));
figure();
plot(t, result);

end_e = c_state(end, :)
%% Function

function dsdt = state_derivative(state, statics)
    I1 = statics(1);
    I2 = statics(2);
    I3 = statics(3);
    Is = statics(4);
    vd = statics(5);

    w = state(1:3);
    sig = state(4:6);

    wd1 = ((I2-I3)*w(2)*w(3)+vd*sig(1))/(I1-Is);
    wd2 = ((I3-I1)*w(3)*w(1)+vd*sig(2))/(I2-Is);
    wd3 = ((I1-I2)*w(1)*w(2)+vd*sig(3))/(I3-Is);
    
    sigd1 = -wd1 - (vd/Is)*sig(1) - w(2)*sig(3) + w(3)*sig(2);
    sigd2 = -wd2 - (vd/Is)*sig(2) - w(3)*sig(1) + w(1)*sig(3);
    sigd3 = -wd3 - (vd/Is)*sig(3) - w(1)*sig(2) + w(2)*sig(1);

    dsdt = [wd1, wd2, wd3, sigd1, sigd2, sigd3]';

end

function H = angular_moment(state, statics)
    I1 = statics(1);
    I2 = statics(2);
    I3 = statics(3);
    Is = statics(4);

    w = state(1:3);
    sig = state(4:6);
    
    H2 = (I1*w(1) + Is*sig(1))^2 + (I2*w(2) + Is*sig(2))^2 + (I3*w(3) + Is*sig(3))^2;
    H = sqrt(H2);
end
```
