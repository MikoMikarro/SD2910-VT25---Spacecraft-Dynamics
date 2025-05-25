# E 1

> Use the definitions of the moment of inertia Ixx = y 2 +z 2 dA and the product of inertia Ixy = −xydA and sketch two different bodies for which the inertia products are zero and non-zero, respectively. Explain graphically why the inertia product is zero for one of the rigid bodies, but not for the other.

A symmetric one makes product of inertia zero. An asymmetric one makes product of inertia non-zero.

# E 2

> The nutation angle of a torque-free axisymmetric spinning rigid body is often defined as the angle between the angular momentum vector and the axis of symmetry. The nutation angle is constant for a torque-free rigid body. Show why the nutation angle is larger than the angle between the axis of symmetry and the rotational vector for a prolate body, but smaller for an oblate body.


The nutation angle (θₗ) between the angular momentum **L** and the symmetry axis, and the angle (θ_ω) between the angular velocity **ω** and the symmetry axis, are related by:  
$$\tan\theta_L = \left(\frac{I_1}{I_3}\right)\tan\theta_\omega.$$  
For a **prolate** body (elongated, \(I_3 < I_1\)):  
\(\frac{I_1}{I_3} > 1 \implies \tan\theta_L > \tan\theta_\omega \implies \theta_L > \theta_\omega\).  

For an **oblate** body (flattened, \(I_3 > I_1\)):  
\(\frac{I_1}{I_3} < 1 \implies \tan\theta_L < \tan\theta_\omega \implies \theta_L < \theta_\omega\).  

The ratio of moments of inertia scales the angles, making the nutation angle larger (prolate) or smaller (oblate) than the rotational vector angle.

# E 3

> Explain in words the mechanical meaning of the principal moments of inertia and the corresponding principal axes. Is there any relation between the principal rotation axis (eigenaxis) and the principal inertia axes? In solid mechanics, one important stress type is the principal normal stresses, i.e. maximum, intermediate and minor normal stresses. Are there any similarities between the principal moments of inertia and the principal normal stresses?


**Principal Moments of Inertia & Axes:**  
The **principal moments of inertia** are the eigenvalues of the inertia tensor, representing a rigid body's resistance to rotational acceleration about three mutually perpendicular **principal axes**. These axes are directions where rotational motion is "pure" (no coupled torques or products of inertia). The largest/smallest principal moment corresponds to the axis hardest/easiest to rotate about.  

**Relation to Rotation Axis (Eigenaxis):**  
The **principal axes of inertia** *are* the **principal rotation axes** (eigenaxes). When a body rotates about a principal axis, angular velocity **ω** and angular momentum **L** align, producing stable, torque-free rotation.  

**Similarity to Principal Normal Stresses:**  
Both concepts rely on diagonalizing a tensor (inertia/stress) to find principal values (moments of inertia/normal stresses) and directions (axes/planes) where off-diagonal terms vanish (no shear stress/no coupled inertia).  
- **Principal stresses** are extreme normal stresses on planes with zero shear.  
- **Principal moments of inertia** are extreme rotational inertias about axes with no inertial coupling.  


# E 4

> Referring to Euler’s equations of motion, e.g. Iz ω̇z = −(Iy − Ix )ωx ωy + Lz for axis z, what are the requirements for the conservation of angular momentum and kinetic energy for a rotating rigid body?

**Conservation of Angular Momentum:**  
Angular momentum is conserved *if the net external torque is zero* (\( \tau_x = \tau_y = \tau_z = 0 \)). In Euler’s equations, this simplifies the motion to **torque-free rotation**, where angular momentum remains constant in an inertial frame.  

**Conservation of Kinetic Energy:**  
Kinetic energy is conserved *if no work is done by external torques*. For a rigid body, this requires \( \boldsymbol{\tau} \cdot \boldsymbol{\omega} = 0 \). If external torques are absent (\( \boldsymbol{\tau} = 0 \)), kinetic energy is automatically conserved.  

**Key Requirements:**  
1. **Angular momentum conservation**: \( \boldsymbol{\tau} = 0 \).  
2. **Kinetic energy conservation**: \( \boldsymbol{\tau} \cdot \boldsymbol{\omega} = 0 \).  


# E 5

# E 6

> Describe the parallel axis-theorem and show how it is applied to a general rigid body to compute both the moments of inertia and the products of inertia. When is the parallel axis theorem used in practice? From a rigid body dynamics point of view: what influence have the positive moments of inertias and the positive or negative products of inertias?

**Parallel Axis Theorem and Its Application:**  
The **parallel axis theorem** relates the inertia tensor of a rigid body about any axis to its inertia tensor about a parallel axis passing through the center of mass (COM). It accounts for both **moments of inertia** and **products of inertia**.

1. **Moments of Inertia**:  
   For a moment of inertia \( I_{zz} \) about an axis \( z \), the theorem states:  
   \[
   I_{zz} = I_{zz}^{\text{COM}} + M d^2
   \]  
   where \( M \) is the total mass, and \( d \) is the perpendicular distance between the new axis \( z \) and the COM axis \( z_{\text{COM}} \).

2. **Products of Inertia**:  
   For products of inertia (e.g., \( I_{xy} \)):  
   \[
   I_{xy} = I_{xy}^{\text{COM}} + M a b
   \]  
   where \( a \) and \( b \) are the coordinates of the COM in the new coordinate system. Similar expressions apply for \( I_{xz} \) and \( I_{yz} \).

# E 7

# E 8

# E 9

# E 10

# E 11

# C 1

# E 12

# E 13

# E 14

# E 15

# E 16

# C 2

# C 3

# A 1

> An oblate axisymmetric body subjected to torque-free motion in space has a moment of inertia ratio equal to 2 and an axial-to-transversal angular velocity ratio equal to 2. Estimate the following: (i) the angle between the axis of symmetry and the angular velocity, (ii) the angle between the angular momentum vector and the axis of symmetry, and (iii) the ratio between the precession angular velocity and the total angular velocity.

**(i) Angle between the axis of symmetry and the angular velocity ($\alpha$):**

The relationship between the components of angular velocity and the angle $\alpha$ is given by:
$\tan(\alpha) = \frac{\omega_{transversal}}{\omega_{axial}}$


$\alpha = \arctan\left(\frac{1}{2}\right) \approx 26.57^\circ$

***

**(ii) Angle between the angular momentum vector and the axis of symmetry ($\theta$):**

For an axisymmetric body, the relationship between the angle $\alpha$, the angle $\theta$, and the moments of inertia is:
$\tan(\theta) = \frac{I_{transversal} \omega_{transversal}}{I_{axial} \omega_{axial}}$

Substituting these values:
$\tan(\theta) = \left(\frac{1}{2}\right) \cdot \left(\frac{1}{2}\right) = \frac{1}{4}$
$\theta = \arctan\left(\frac{1}{4}\right) \approx 14.04^\circ$

***

**(iii) Ratio between the precession angular velocity ($\Omega_p$) and the total angular velocity ($\omega$):**

The precession angular velocity for an axisymmetric body is given by:
$\Omega_p = \frac{I_{axial} - I_{transversal}}{I_{transversal}} \omega_{axial}$

We are given $\frac{I_{axial}}{I_{transversal}} = 2$.
So, $\Omega_p = \left(\frac{I_{axial}}{I_{transversal}} - 1\right) \omega_{axial} = (2 - 1) \omega_{axial} = \omega_{axial}$

The total angular velocity $\omega$ can be found using its components:
$\omega = \sqrt{\omega_{axial}^2 + \omega_{transversal}^2}$


$\omega = \sqrt{\omega_{axial}^2 + \left(\frac{\omega_{axial}}{2}\right)^2} = \sqrt{\omega_{axial}^2 + \frac{\omega_{axial}^2}{4}} = \sqrt{\frac{5\omega_{axial}^2}{4}} = \frac{\sqrt{5}}{2} \omega_{axial}$

Now, the ratio $\frac{\Omega_p}{\omega}$ is:
$\frac{\Omega_p}{\omega} = \frac{\omega_{axial}}{\frac{\sqrt{5}}{2} \omega_{axial}} = \frac{1}{\frac{\sqrt{5}}{2}} = \frac{2}{\sqrt{5}}$

$\frac{2}{\sqrt{5}} \approx \frac{2}{2.236} \approx 0.894$

Therefore:
* **(i) The angle between the axis of symmetry and the angular velocity is approximately $26.57^\circ$.**
* **(ii) The angle between the angular momentum vector and the axis of symmetry is approximately $14.04^\circ$.**
* **(iii) The ratio between the precession angular velocity and the total angular velocity is $\frac{2}{\sqrt{5}} \approx 0.894$.**

# A 2

> An oblate axisymmetric body subjected to torque-free motion in space has a moment of inertia ratio equal to 2 and an axial-to-transversal angular velocity ratio equal to 1/2. Estimate the following: (i) the angle between the axis of symmetry and the angular velocity, (ii) the angle between the angular momentum vector and the axis of symmetry, and (iii) the ratio between the precession angular velocity and the total angular velocity.

Given:
* Moment of inertia ratio: $\frac{I_{axial}}{I_{transversal}} = 2$
* Axial-to-transversal angular velocity ratio: $\frac{\omega_{axial}}{\omega_{transversal}} = \frac{1}{2}$

This means that $\frac{\omega_{transversal}}{\omega_{axial}} = 2$.

***

**(i) Angle between the axis of symmetry and the angular velocity ($\alpha$):**

The relationship is:
$\tan(\alpha) = \frac{\omega_{transversal}}{\omega_{axial}}$
$\alpha = \arctan(2) \approx 63.43^\circ$

***

**(ii) Angle between the angular momentum vector and the axis of symmetry ($\theta$):**

The relationship is:
$\tan(\theta) = \frac{I_{transversal} \omega_{transversal}}{I_{axial} \omega_{axial}}$
$\tan(\theta) = \left(\frac{1}{2}\right) \cdot (2) = 1$
$\theta = \arctan(1) = 45^\circ$

***

**(iii) Ratio between the precession angular velocity ($\Omega_p$) and the total angular velocity ($\omega$):**

The precession angular velocity for an axisymmetric body is given by:
$\Omega_p = \frac{I_{axial} - I_{transversal}}{I_{transversal}} \omega_{axial} = \left(\frac{I_{axial}}{I_{transversal}} - 1\right) \omega_{axial}$

Given $\frac{I_{axial}}{I_{transversal}} = 2$:
$\Omega_p = (2 - 1) \omega_{axial} = \omega_{axial}$

The total angular velocity $\omega$ is:
$\omega = \sqrt{\omega_{axial}^2 + \omega_{transversal}^2}$
$\omega = \sqrt{\omega_{axial}^2 + (2\omega_{axial})^2} = \sqrt{\omega_{axial}^2 + 4\omega_{axial}^2} = \sqrt{5\omega_{axial}^2} = \sqrt{5} \omega_{axial}$

Now, the ratio $\frac{\Omega_p}{\omega}$ is:
$\frac{\Omega_p}{\omega} = \frac{\omega_{axial}}{\sqrt{5} \omega_{axial}} = \frac{1}{\sqrt{5}}$

$\frac{1}{\sqrt{5}} \approx \frac{1}{2.236} \approx 0.447$

Therefore, with the new angular velocity ratio:
* **(i) The angle between the axis of symmetry and the angular velocity is approximately $63.43^\circ$.**
* **(ii) The angle between the angular momentum vector and the axis of symmetry is $45^\circ$.**
* **(iii) The ratio between the precession angular velocity and the total angular velocity is $\frac{1}{\sqrt{5}} \approx 0.447$.**

# A 3

> A prolate axisymmetric spacecraft is spinning around its symmetry axis in a torque-free space. A variable control momentum gyro is freely suspended in the spacecraft. The spin axis of the rotor of the gyro is initially coinciding with the axis of symmetry. The gimbal frame of the rotor is the turned with an angular velocity for a very short time. Illustrate the torque that is acting on the spacecraft and the resulting positions of (i) the axis of symmetry, (ii) the angular velocity, and (iii) angular momentum.

When a control momentum gyro (CMG) in a prolate axisymmetric spacecraft is gimbaled, it generates a torque on the spacecraft due to the gyroscopic effect.

### **Torque Acting on the Spacecraft**
- **Cause**: Gimbal rotation at angular velocity **Ω** (about the spacecraft's x-axis) for a short time **Δt**.
- **Resulting Torque**:  
  The torque **τ** is given by **τ = H × Ω**, where **H** is the rotor's angular momentum (initially along the symmetry axis, z). For a gimbal rotation about x, **τ** acts in the y-direction:  
  **τ = HΩΔt ŷ** (impulsive torque).

### **Resulting Positions and Motions**
1. **Axis of Symmetry (z-axis)**:
   - **Precession**: The symmetry axis precesses around the **total angular momentum vector** (fixed in inertial space, aligned with the original z-axis).  
   - **Motion**: Circular precession (body cone) due to the prolate shape (**I_z < I_x = I_y**), with the symmetry axis sweeping out a cone.

2. **Angular Velocity Vector**:
   - **Components**: After the maneuver, the spacecraft's angular velocity has a y-component:  
     **ω = (0, -Hδ/I, ω_z)** (where **δ = ΩΔt**, **I** is transverse moment of inertia).  
   - **Precession**: The angular velocity vector precesses around the total angular momentum vector, tracing a cone (body cone) inside the symmetry axis's precession cone.

3. **Angular Momentum**:
   - **Total Angular Momentum**: Remains fixed along the original z-axis in inertial space.  
   - **Spacecraft Angular Momentum**: Gains a y-component to counterbalance the CMG's tilted momentum:  
     **L_spacecraft = I_zω_zẑ - Hδŷ**.  
   - **CMG Angular Momentum**: Tilts to **H_rotor = Hẑ + Hδŷ**, ensuring total **L_total** remains conserved.

# A 4

> A spacecraft with $I_3 < I_2 < I_1$ is spinning almost purely around its minor inertia axis with $H_3 > 0$. The spacecraft is dissipating energy. Describe the trajectory of H along the angular momentum sphere from almost pure spinning around axis 3 until pure spinning around axis 1. Clearly show the direction of the trajectory of $H$ and explain from Euler’s equations of motion the trajectory direction, specifically when passing through the sepratrix.

Starts tumbling around the axis 3 and then passes through the sepratrix and starts tumbling around the axis 1. During the sepratix the angular momentum vector changes direction.