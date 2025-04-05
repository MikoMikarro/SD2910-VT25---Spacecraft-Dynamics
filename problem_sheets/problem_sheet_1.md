# E 1
#### a
The code used to solve the problem is the following
```matlab
%% Inputs
V = [80, 60, 40]'; % mm
de1 = deg2rad(+42);
de2 = deg2rad(-49);

DCM_a = eul2rotm([0, de1, de2], 'ZYX');
V_a = DCM_a * V;
VA = V_a - V;
```
Which provides the following value for `VA`, in mm.
```matlab
VA =
  -33.2888
    9.5519
 -107.6801

```
#### b
The code used to solve the problem is the following
```matlab
%% Inputs
V = [80, 60, 40]';

dx1 = deg2rad(-27);
dy1 = deg2rad(+65);

DCM_b = eul2rotm([0, dy1, dx1], 'ZYX');
V_b = DCM_b * V;
VB = V_b - V;
```
Which provides the following value for `VB`, in mm.
```matlab
VB =
  -38.5768
   11.6200
 -108.9543
```
#### c
The code used to solve the problem is the following
```matlab
%% Inputs

dx1 = deg2rad(-27);
dy1 = deg2rad(+65);

DCM_b = eul2rotm([0, dy1, dx1], 'ZYX');

[Ang_c, PRV_c] = epvFromDCM2(DCM_b);

```
Which provides the following values for `Ang_c`, in rad, and `PRV_c`.
```matlab
Ang_c =
    1.2185

PRV_c =
   -0.3441
    0.9130
    0.2192
```
#### d
> Using blender, you design the shape with the sizes on the drawing.

> **For a**, you use the shortcut R, y, 42, <\CR>. This rotates around the  global y axis. Then, R, x, x, -49, <\CR>. This rotates around the local x axis. Finally, enter on edit mode, select the desired vertex of the box and check the position. Remember to select global mode.

> **For b**, similar procedure but without doing double y for using always global.

> **For c**, we get the rotation vector from our code and on the rotation side bar we select rotation by axis angle. There, we use the x,y,z coordinates and angle of the matlab code. We observe the same result.


![image](https://github.com/user-attachments/assets/18c96dab-7b87-40d8-9057-0e16e22ec330)


> **These procedures validated all the results**.

#### Note
`eul2rotm` is a function provided by matlab but `epvFromDCM2` not. This is its implementation:
```matlab
function [angle, PRV] = epvFromDCM2(DCM)
%EPVFROMDCM2 Summary of this function goes here
%   Detailed explanation goes here
[V, D] = eig(DCM); % V are eigenvectors, D is the diagonal matrix of eigenvalues

% Find the eigenvector corresponding to the eigenvalue 1 (principal axis)
[~, idx] = min(abs(diag(D) - 1)); % Find the index where eigenvalue is 1
PRV = V(:, idx); % Extract the corresponding eigenvector

% 2. Compute the rotation angle
trace_DCM = trace(DCM); % Trace of the DCM matrix
angle = acos((trace_DCM - 1) / 2); % Rotation angle in radians
end
```
# E 2
```matlab
[2.722002257670760 0.557236265353963	0.806880451497850	0.215675406315517]
```

# E 3
> Used $\Delta t$ of 0.01 s
#### a
```matlab
quaternion(0.92707, 0.32132, 0.19191, 0.02149)
```
#### b
```matlab
quaternion(-0.79584, -0.44441, -0.26931, -0.33574)
```
#### c
```matlab
0.008028251575302
```
#### d
```matlab
0.227172861394461
```
# C 1
#### a
```matlab
[-0.596981307322530	0.298490653661265	0.149245326830633]
```
#### b
```matlab
% 10⁻¹
[-0.596735933523862	0.298367966761931	0.149183983380965]
% 10⁻²
[-0.597084818747906	0.298542409373953	0.149271204686977]
% 10⁻³
[-0.596991658916229	0.298495829458115	0.149247914729057]
```
#### c
```matlab
% 10⁻¹
0.000766199120501840
% 10⁻²
0.000323159314320670
% 10⁻³
0.000032316960115536
```
# A 1
![ai_problem](https://github.com/user-attachments/assets/9df51242-a0f0-4788-8062-439cee51a638)

# A 2

