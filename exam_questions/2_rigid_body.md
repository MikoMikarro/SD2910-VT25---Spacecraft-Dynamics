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

- principal moments of inertia are the eigenvalues of the inertia tensor
- if the coordinate frame is aligned with the principal axes, there are no products of inertia
- principal rotation axis aligned with principal inertia axis -> stable rotation (no wobble due to products of inertia)
- normal stresses -> eigenvalues of stress tensor, corresponding principal directions are directions with no sheer stress

# E 4

> Referring to Euler’s equations of motion, e.g. Iz ω̇z = −(Iy − Ix )ωx ωy + Lz for axis z, what are the requirements for the conservation of angular momentum and kinetic energy for a rotating rigid body?

**Conservation of Angular Momentum:**  
Angular momentum is conserved *if the net external torque is zero* (\( \tau_x = \tau_y = \tau_z = 0 \)). In Euler’s equations, this simplifies the motion to **torque-free rotation**, where angular momentum remains constant in an inertial frame.  

**Conservation of Kinetic Energy:**  
Kinetic energy is conserved *if no work is done by external torques*. For a rigid body, this requires \( \boldsymbol{\tau} \cdot \boldsymbol{\omega} = 0 \). If external torques are absent (\( \boldsymbol{\tau} = 0 \)), kinetic energy is automatically conserved.  

**Key Requirements:**  
1. **Angular momentum conservation**: \( \boldsymbol{\tau} = 0 \).  
2. **Kinetic energy conservation**: \( \boldsymbol{\tau} \cdot \boldsymbol{\omega} = 0 \).  

#### Also

- Conservation of angular momentum: no external torque
   - in body frame: magnitude conserved, direction not necessarily
   - in inertial frame: both magnitude and direction conserved
- Conservation of kinetic energy: no internal/external torque (i.e. no transfer of energy from potential to kinetic), no dissipative energy (sloshing of tanks, etc.)

# E 5

> For torque-free rigid body rotations with no external forces, the magnitude of angular momentum and kinetic energy are conserved. The angular momentum can be written in the body-fixed frame as a sphere. While the kinetic energy can be written as an ellipse. Explain why the angular momentum sphere and the energy ellipsoid must intersect for torque-free motions. What does the intersection curve contain? Draw the angular momentum sphere for the cases where I1 > I2 > I3 and I2 > I1 > I3 .

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

> Explain by simple sketches why the linearized gravity gradient torque expression does not depend on the
yaw angle. You must first define the orientation of the yaw axis with respect to the orbital frame.

- yaw angle is the rotation around the earth-center-pointing vector, i.e. the z-axis in the orbital frame (VVLH, Vehicle Velocity, Local Horizontal)
   -> the yaw angle therefore does not influence the "slope" of the spacecraft to the local horizontal axis
- Since the gravity gradient depends on the _distance_ of a respective mass in the spacecraft to the Earth's center of mass, and the local changes in the gravity field can be ignored for such a small object, there is no resulting change in the gravity gradient/its resulting torque.
- a change in the gravity gradient torque is therefore only induced by a rotation around the pitch or roll axis, as these move parts of the spacecraft along the VVLH z-axis

# E 8

> The gravity gradient torque on a spacecraft expressed in the body-fixed frame is: Using the equation above, describe three cases for which one or several of the gravity gradient torque components are zero. Explain what each of these cases means for the possible to use gravity gradient torques as a realistic means for gravity gradient stabilization of a spacecraft.

- Case 1: symmetric ($I_{3}=I_{2}=I_{1}$) -> zero-torque $L_{G}$ vector, no possibility of using gravity torque for stabilization
- Case 2: axisymmetric around the $i$th body axis -> will not experience any gravity gradient torque about its symmetry axis ($i$th axis), only stabilizable about the other two axes (e.g. alignment of the symmetry axis but not the yaw angle) 
- Case 3: center of mass vector $R_{c}$ parallel with any of the principal body axes -> two of the three $R_{c_{i}}$ vector components $=0$ -> $L_G=0$ -> torque zero, this equates to a stable position with $R_c$ lined up with one of the principal body axes

# E 9

> A satellite in a circular orbit has its body-fixed axis 3 oriented in the radial direction of the orbit. Axis 1 of the orbital frame is oriented along the orbit, i.e. aligned with the velocity vector, and axis 2 is normal to the orbital plane. The body-fixed axes 1 and 2 are aligned with axes 1 and 2 of the orbital frame.
The conditions for gravity gradient stability in a linear sense are:
I2 > I1 > I3
I1 < I2 + I3
I2 < I1 + I3
I3 < I1 + I2

Basically two of the axis are going to end up havving the same inertia

# E 10

> Describe the stability of a rigid body spinning around the minor, intermediate and major principal inertia axes. Consider a case of spinning purely around the minor principal inertia axis. What will happen with the angular momentum sphere and kinetic energy ellipsoid if we have energy dissipation in the system? Explain using the angular momentum sphere and the kinetic energy ellipsoid. Will the angular momentum stay constant in the presence of energy dissipation—why or why not? In which ways can energy be dissipated from a spinning body?

Similar to A 5

#### Also 

- Stability around
   - Minor axis -> maximum energy case, stable
   - Major axis -> minor energy case, stable
   - Intermediate axis -> tennis racket theorem, unstable
- Case: pure spin around minor axis = maximum energy case
   - Energy dissipation -> loss of energy, moving away from equilibrium point
   - start to "wobble", i.e. rotation of axis of angular velocity vector around axis of inertia
   - as more and more energy is dissipated, intermediate axis (separatix) is crossed and rotation around major axis starts
   - system will eventually settle in minimum energy case around major axis
- angular momentum will stay constant **if** there is no external torque (conservation of angular momentum)
   - internal dissipation -> friction, sloshing
   - external dissipation -> magnetic damping, drag, thrusters (active dissipation)

# E 11

> Euler’s equation of motion around the z axis in two dimensions is Iz ω̇z = Lz , whereas it in three dimensions is Iz ω̇z = −(Iy − Ix )ωx ωy + Lz , assuming that the xyz coordinate systems is aligned with the principal axis. Why does Euler’s equations of motion for axis z contain the rotational velocities for axes x and y and for which cases are the Euler’s equations of motion completely decoupled?

Euler’s equations couple rotational velocities across axes due to **unequal moments of inertia** (e.g., \(I_x \neq I_y\)), which introduce **gyroscopic cross-terms** like \(-(I_y - I_x)\omega_x\omega_y\) in the \(z\)-axis equation. These terms arise from the **Coriolis effect** in the rotating body-fixed frame. 

The equations are **completely decoupled** only when **all principal moments of inertia are equal** (\(I_x = I_y = I_z\)), as in a **spherical top** (e.g., a uniform sphere). For symmetric tops (\(I_x = I_y \neq I_z\)), only the symmetry-axis equation decouples (e.g., \(z\)-axis if \(I_x = I_y\)), while the others retain cross-terms.

# C 1

> The space cone is fixed in space and has its cone axis aligned with the angular momentum vector. The space cone angle is defined as the angle between the angular momentum vector and the rotational velocity vector. The body cone axis is aligned with the axis of axisymmetry (which we want the spacecraft to spin about). The body cone angle is the angle between the axis of axisymmetry and the rotational vector. Illustrate why the body cone will roll on the space cone for prolate bodies, while the space cone will lie inside the body cone for oblate bodies. Illustrate/animate with two objects — one soft drink can and one disk — how the objects rotate in their coning motions (spin axis precession).

The motion of a spinning axisymmetric body (like a soft drink can or a disk) can be visualized using **space cones** and **body cones**:

### **1. Prolate Bodies (e.g., Soft Drink Can):**
- **Shape**: Elongated along the symmetry axis (body cone axis).
- **Moments of Inertia**: \(I_z < I_x = I_y\) (smaller along the symmetry axis).
- **Behavior**:
  - The **angular momentum \(\mathbf{H}\)** (fixed in space) is tilted *farther* from the symmetry axis compared to the **angular velocity \(\boldsymbol{\omega}\)**.
  - The **body cone** (fixed to the object) rolls *without slipping* around the **space cone** (fixed in space).  
  - **Why?** For prolate bodies, \(\boldsymbol{\omega}\) precesses *around \(\mathbf{H}\)* in a wider path, causing the body cone to externally trace the space cone.

### **2. Oblate Bodies (e.g., Disk):**
- **Shape**: Flattened perpendicular to the symmetry axis.
- **Moments of Inertia**: \(I_z > I_x = I_y\) (larger along the symmetry axis).
- **Behavior**:
  - The **angular momentum \(\mathbf{H}\)** is tilted *closer* to the symmetry axis than \(\boldsymbol{\omega}\).
  - The **space cone** lies *inside* the **body cone**.
  - **Why?** For oblate bodies, \(\boldsymbol{\omega}\) precesses *around \(\mathbf{H}\)* in a tighter path, causing the space cone to nest within the body cone.

---


This behavior arises from how \(\boldsymbol{\omega}\) and \(\mathbf{H}\) align based on \(I_z\), governed by Euler’s equations.
# E 12

> Describe the stability of the spinning around the minor, intermediate and major principal axes — is the equilibrium points defined as unstable, neutrally stable or a stable node (may be different definitions for each axis)? What are the conditions for stable equilibrium points in a mathematical sense? Draw some sketches of different equilibrium points for a 2 × 2 system. How do we determine the stability of equilibrium points for a 3 × 3 system? Describe the two stability analysis procedures: (i) linearization of equation system by Jacobian matrix and (ii) small perturbation analysis.

**Stability of Spinning Around Principal Axes:**
- **Minor Axis (Smallest Moment of Inertia):** Neutrally stable (center in phase space).
- **Intermediate Axis:** Unstable (saddle point).
- **Major Axis (Largest Moment of Inertia):** Neutrally stable (center).

**Conditions for Stable Equilibrium:**
- In a mathematical sense, an equilibrium is **asymptotically stable** if all eigenvalues of the Jacobian matrix have negative real parts. However, for conservative systems (no dissipation), asymptotic stability is impossible. Instead, **neutral stability** (purely imaginary eigenvalues) occurs for the minor and major axes, indicating bounded oscillations around the equilibrium.

**Stability Analysis for 3×3 Systems:**
- Compute eigenvalues of the Jacobian matrix at the equilibrium:
  - **Asymptotically stable:** All eigenvalues have negative real parts.
  - **Unstable:** At least one eigenvalue has a positive real part.
  - **Neutrally stable:** Eigenvalues have zero real parts (e.g., centers), but stability may depend on nonlinear terms.

**Stability Analysis Procedures:**
1. **Jacobian Linearization:**
   - Linearize the system near the equilibrium by computing the Jacobian matrix.
   - Determine eigenvalues: Stability is classified based on their signs (as above).

2. **Small Perturbation Analysis:**
   - Introduce small perturbations to the equilibrium state.
   - Linearize the governing equations by neglecting higher-order terms.
   - Solve the resulting linear system to determine exponential growth/decay of perturbations (equivalent to Jacobian method).

# E 13

> why did we lose energy?

- dissipation of energy due to
   - friction in joints
   - ...



# E 14


1. zero spin rate excluded since intermediate axis is not inherently stable -> no spin of reaction wheel would lead to unstable behavior
2. minor inertia axis is (linearly) stable, therefore the zero spin case is admissable
3. for certain (negative) speeds beyond the critical speed, the system becomes unstable 
# E 15

# E 16


# A 1

- preface: prolate body -> rate of precession < axial rotation ! THIS IS NOT REALLY TRUE I THINK !
	1. angle $\theta_\omega = \tan^{-1}(\frac{\omega_T}{\omega_a}) = \tan^{-1}(2)\approx 63.4°$ 
	2. angle $\theta_{H} = \tan ^{-1}\left( \frac{I_{T}\omega_{T}}{I_{a}\omega_{a}} \right) = \tan ^{-1}(4) \approx 76°$
	3. $\Omega = \frac{H}{I_{t}}=\frac{\sqrt{ (I_{t}\omega_{t})^{2}+(I_{a}\omega_{a})^{2} }}{I_{t}}=\dots=\frac{\sqrt{ 17 }}{2}\omega_{a}$ => $\frac{\Omega}{\omega}=\frac{\Omega}{\sqrt{ 5\omega_{a}^{2} }}=\frac{\sqrt{ 17 }}{\sqrt{ 20 }}<1$ (correct, see prefaces)

# C 2

> A prolate axisymmetric spacecraft is suddenly subjected to an angular impulse perpendicular to its angular momentum vector so that it is performing a coning motion. Assume that the inertia ratio is 3 and that the spacecraft is spinning only around the axis of symmetry prior to the angular impulse. Sketch the new position of (i) the axis of symmetry, (ii) the angular velocity, and (iii) angular momentum.

# C 3

> An oblate axisymmetric spacecraft is subjected to an angular impulse perpendicular to its angular momentum vector so that it is performing a coning motion. Assume that the inertia ratio is 2 and that the spacecraft is spinning only around the axis of symmetry prior to the angular impulse. Illustrate the new position of (i) the axis of symmetry, (ii) the angular velocity, and (iii) angular momentum.

# A 2

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

#### Also

See 1.17, oblate, moment of inertia ratio 2, velicity ratio 2
	- angle $\theta_{\omega}=\tan ^{-1}\left( \frac{\omega_{T}}{\omega_{a}} \right) = \tan ^{-1}\left( \frac{1}{2} \right) \approx 27°$
	- angle $\theta_{H} = \tan ^{-1}\left( \frac{I_{t}\omega_{t}}{I_{a}\omega_{a}}  \right) = \tan ^{-1}\left( \frac{1}{4} \right)=14°$
	- same relations as 1.17 lead to $\frac{\Omega}{\omega}=\frac{\sqrt{ 17 }}{\sqrt{ 5 }}$

# A 3

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

#### Also: 

See 1.17, oblate, moment of inertia ratio 2, velocity ratio 1/2
	- angle $\theta_{\omega}=\tan ^{-1}\left( \frac{\omega_{T}}{\omega_{a}} \right) = \tan ^{-1}(2) \approx 63.4°$
	- angle $\theta_{H} = \tan ^{-1}\left( \frac{I_{t}\omega_{t}}{I_{a}\omega_{a}}  \right) = \tan ^{-1}(1)=45°$
	- same relations as 1.17 lead to $\frac{\Omega}{\omega}=\frac{\sqrt{ 2 }}{\sqrt{ 5 }}<1$

# A 4

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
     **H_spacecraft = I_zω_zẑ - Hδŷ**.  
   - **CMG Angular Momentum**: Tilts to **H_rotor = Hẑ + Hδŷ**, ensuring total **H_total** remains conserved.

#### Also:
- right hand law for acting torque on _S/C_ (first axis spin axis, second axis gimbal axis, third axis gyro moment direction)

# A 5

> A spacecraft with $I_3 < I_2 < I_1$ is spinning almost purely around its minor inertia axis with $H_3 > 0$. The spacecraft is dissipating energy. Describe the trajectory of H along the angular momentum sphere from almost pure spinning around axis 3 until pure spinning around axis 1. Clearly show the direction of the trajectory of $H$ and explain from Euler’s equations of motion the trajectory direction, specifically when passing through the sepratrix.

Starts tumbling around the axis 3 and then passes through the sepratrix and starts tumbling around the axis 1. During the sepratix the angular momentum vector changes direction.