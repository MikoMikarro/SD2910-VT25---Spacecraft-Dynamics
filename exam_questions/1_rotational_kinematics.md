# E 1

> *Describe through a simple sketch the meaning of the components in the direction cosine matrix (DCM) in the way we have defined them in this course. Can the DCM be defined in another way? How many parameters are involved in the definition of the DCM and why does the DCM not contain any geometric singular configurations? Explain this graphically and not with equations.*

The DCM is a 3x3 matrix where each element represents the cosine of the angle between an axis of the original coordinate frame (e.g., body frame) and an axis of the target frame (e.g., inertial frame). Unlike Euler angles, the DCM does not suffer from singularities (e.g., gimbal lock) because it directly encodes the orientation without sequential rotations. Graphically, the DCM’s columns are three orthogonal unit vectors that can rotate freely without alignment issues, avoiding the "overlapping axes" problem inherent to Euler angles.

# E 2

> *List five fundamental properties/requirements for the direction cosine matrix (DCM) to be a real proper orthogonal matrix. What is the meaning of these properties, or in other words: if the properties are not fulfilled, what would happen if an improper DCM is used to transform a vector from one system to another system. Show an example in two dimensions.*

Five Fundamental Properties/Requirements for a DCM to be a Real Proper Orthogonal Matrix:
1. **Columns are unit vectors:** Each column of the DCM has a magnitude of 1.
If violated: Vectors transformed by the DCM will be scaled (stretched or compressed).
2. **Columns are mutually orthogonal:** The dot product of any two distinct columns is zero.
If violated: The coordinate axes become skewed, distorting angles between vectors.
3. **Rows are unit vectors:** Each row of the DCM has a magnitude of 1.
If violated: Inverse transformations (e.g., back to the original frame) will scale vectors.
4. **Rows are mutually orthogonal:** The dot product of any two distinct rows is zero.
If violated: The inverse transformation will distort angles between vectors.
5. **Determinant is +1:** Ensures the matrix represents a pure rotation (no reflection).
If violated: The transformation includes a reflection (improper rotation), flipping handedness (e.g., left-handed to right-handed systems).

**Consequences of Using an Improper DCM:**
An improper DCM (non-orthogonal or determinant ≠ +1) distorts vectors by introducing scaling, shearing, or reflection, violating the core purpose of a DCM: to preserve vector lengths and angles during rotation.



# E 3

> *What does the direction cosine matrix (DCM) do to a vector? Describe how to transform a system and rotate a vector from coordinate systems A and B and vice versa. What is the difference between transforming a fixed vector from one system to the other and rotating a vector from one position to another position in a fixed system?*

**Direction Cosine Matrix (DCM): What It Does to a Vector**  
The DCM is a mathematical tool that **re-expresses a vector's components** from one coordinate system to another. It does not physically move or rotate the vector in space; instead, it changes the *description* of the vector’s orientation based on a new reference frame. For example, a vector pointing "north" in system A might be described as pointing "east" in system B if B is rotated 90° relative to A.  

---

### **Transforming Between Coordinate Systems A and B**  
1. **A to B Transformation**:  
   - Multiply the vector’s coordinates in system A by the DCM (denoted \( C_{A \to B} \)) to obtain its coordinates in system B.  
   - **Example**: If system B is rotated 90° about the z-axis relative to A, a vector \((1, 0, 0)\) in A becomes \((0, 1, 0)\) in B.  

2. **B to A Transformation**:  
   - Use the **transpose** of \( C_{A \to B} \) (since DCM is orthogonal, \( C_{B \to A} = C_{A \to B}^T \)) to revert the vector’s coordinates back to system A.  

---

### **Rotating a Vector vs. Transforming Its Coordinate System**  
1. **Transforming a Fixed Vector (Passive Transformation)**:  
   - The vector remains fixed in space; only its *description* changes based on the coordinate system.  
   - **Example**: A stationary airplane’s velocity vector is described differently in a ground-based system (A) vs. a pilot’s cockpit system (B).  

2. **Rotating a Vector (Active Transformation)**:  
   - The vector itself is rotated in space within a **fixed coordinate system**, changing its physical direction.  
   - **Example**: Turning a steering wheel changes the wheel’s orientation in the car’s fixed coordinate system.  

---

### **Key Difference**  
| **Aspect**                | **Transforming Systems (Passive)**       | **Rotating a Vector (Active)**           |  
|---------------------------|------------------------------------------|-------------------------------------------|  
| **Vector’s Physical State** | Unchanged                                | Physically rotated                        |  
| **Coordinate System**      | Changed (A ↔ B)                          | Fixed (only the vector moves)             |  
| **Purpose**                | Describe the same vector in a new frame  | Change the vector’s direction in one frame|  

---

### **Graphical Example**  
- **Passive Transformation (Coordinate Change)**:  
  - A book on a table (fixed in space) is described as "lying flat" in a table-fixed system (A) but "upright" in a system (B) rotated 90°.  
- **Active Transformation (Rotation)**:  
  - The book itself is physically rotated 90° on the table, changing its orientation in the original system (A).  

---

### **Summary**  
- The DCM **translates a vector’s coordinates** between reference frames (passive).  
- Rotating a vector **alters its physical direction** within a fixed frame (active).  
- Both use the same DCM mathematically, but their interpretations differ: one changes perspective, the other changes reality.

# E 4

> Describe how the direction cosine matrix (DCM) is formed for an arbitrary Euler angle sequence. If the DCM is given and we want to find the Euler angles, for a given Euler angle sequence, that produced the DCM, how do we do that? How do we check if there are any Euler angles which we cannot find for a given orientation in the Euler angle sequence (geometric singular orientations)?

### Formation of Direction Cosine Matrix (DCM)

A Direction Cosine Matrix (DCM) represents the orientation of one coordinate frame relative to another. For an arbitrary Euler angle sequence, the DCM is formed by multiplying individual rotation matrices in the sequence order.

For any Euler angle sequence, we follow these steps:

1. Identify the sequence of rotations (e.g., 3-2-1, 3-1-3, 1-2-3, etc.)
2. Form the elementary rotation matrices for each axis
3. Multiply these matrices in the specified order

The elementary rotation matrices for rotations about the principal axes are:

**Rotation about x-axis (1-axis) by angle φ:**
```
R₁(φ) = [1    0      0   ]
        [0  cos(φ) sin(φ)]
        [0 -sin(φ) cos(φ)]
```

**Rotation about y-axis (2-axis) by angle θ:**
```
R₂(θ) = [cos(θ) 0 -sin(θ)]
        [  0    1    0   ]
        [sin(θ) 0  cos(θ)]
```

**Rotation about z-axis (3-axis) by angle ψ:**
```
R₃(ψ) = [ cos(ψ) sin(ψ) 0]
        [-sin(ψ) cos(ψ) 0]
        [   0      0    1]
```

For example, the DCM for a 3-2-1 (z-y-x) Euler angle sequence would be:
```
DCM = R₁(φ) × R₂(θ) × R₃(ψ)
```

### Extracting Euler Angles from a DCM

To extract Euler angles from a given DCM, we need to identify the specific elements of the DCM that are functions of the Euler angles. This process is different for each Euler angle sequence.

For example, for a 3-2-1 (z-y-x) sequence, if we have a DCM denoted as R with elements Rᵢⱼ:

```
R = [R₁₁ R₁₂ R₁₃]
    [R₂₁ R₂₂ R₂₃]
    [R₃₁ R₃₂ R₃₃]
```

The Euler angles can be extracted as:
- φ (roll) = atan2(R₃₂, R₃₃)
- θ (pitch) = -asin(R₃₁)
- ψ (yaw) = atan2(R₂₁, R₁₁)

Where atan2 is the four-quadrant inverse tangent function.

### Geometric Singularities

Singularities occur when one degree of rotational freedom is lost due to the alignment of two rotation axes. These singularities are also called "gimbal lock."

To check for singularities in a given Euler angle sequence:

1. Identify if the sequence is a "proper" Euler angle sequence (same first and third axis, e.g., 3-1-3) or a "Tait-Bryan" sequence (all three axes different, e.g., 3-2-1)

2. For proper Euler sequences (like 3-1-3, 1-2-1):
   - Singularities occur when the middle rotation angle is 0° or 180°
   - At these values, the first and third rotation axes become parallel
   - This makes it impossible to uniquely determine the individual first and third angles

3. For Tait-Bryan sequences (like 3-2-1, 1-2-3):
   - Singularities occur when the middle rotation angle is ±90°
   - This causes the first and third rotation axes to become parallel

Let's take the 3-2-1 example again:
- The singularity occurs when θ = ±90°
- At these values, R₃₁ = ±1, which makes R₁₁ = R₂₁ = 0
- This makes it impossible to uniquely determine φ and ψ individually (though their sum or difference can still be determined)

To verify if we're at a singular orientation, we can check the specific DCM elements that would indicate the middle angle is at its singular value. For the 3-2-1 sequence, we would check if R₃₁ = ±1 (which corresponds to θ = ±90°).

In general, all 3D rotation representations have some form of singularity or discontinuity, which is why quaternions or other representations are often preferred for certain applications.

# E 5

> *Show by a simple example and sketches that rotations in three dimensions around the coordinate axes are non-commutative, whereas rotations in two dimensions are commutative. Not not use equations for your example. Provide an explanation why Euler angles still are popular despite the fact that they are dependent on the rotation sequence around each axis.*

Ez


# E 6

> *The Modified Rodrigues parameters (MRP) is a non-redundant three-parameter attitude description (Euler parameters are redundant with four parameters). Like the Euler angles — also a three-parameter attitude description — the MRP contains a geometric singularity. For which value of the principal axis (eigenaxis) rotation angle does this singularity occur? How do we avoid this singularity? What is the geometric meaning of the method used to avoid the singularity?*

The singularity for Modified Rodrigues Parameters (MRPs) occurs when the principal axis (eigenaxis) rotation angle, $\phi$, is equal to $\pm 360^\circ$ (or $\pm 2\pi$ radians).

To avoid this singularity, a **shadow set** of MRPs is used.

Geometrically, the shadow set corresponds to representing the same attitude by a rotation of $\phi - 360^\circ$ (or $\phi - 2\pi$ radians) about the *same* principal axis, effectively rotating "the other way around" the circle.

# E 7

> Euler angles have the advantage over the direction cosine matrices in that three Euler angles determine a unique orientation in space, although there is no unique set of Euler angles for a given orientation. Show by a simple example that this actually is the case. Do not use the direction cosine matrix for a given Euler angle sequence to show that some angles are undefined. Instead, sketch a simple example which clearly shows that this is the case

While three Euler angles uniquely determine an orientation, the reverse isn't always true - a given orientation can be represented by multiple sets of Euler angles. I'll demonstrate this with a simple example without relying on direction cosine matrices.

## A Simple Physical Example

Imagine a book on a table. We'll define our reference frame with:
- x-axis pointing to the right along the table
- y-axis pointing forward along the table
- z-axis pointing up from the table

### Example: Z-Y-Z Euler Angle Sequence

Let's consider the Z-Y-Z sequence (3-2-3) with angles (α, β, γ).

**Scenario 1**: Starting with the book flat on the table, perform these rotations:
1. Rotate α = 30° about z-axis (spinning the book on the table)
2. Rotate β = 0° about y-axis (no tilting)
3. Rotate γ = 40° about z-axis (spinning again)

The final orientation has the book still flat on the table, but rotated by a total of 70° (30° + 40°) from its original position.

**Scenario 2**: For the same final orientation, we could have:
1. Rotate α = 50° about z-axis
2. Rotate β = 0° about y-axis
3. Rotate γ = 20° about z-axis

The book is again flat on the table and rotated by a total of 70° (50° + 20°).

**Scenario 3**: We could even use:
1. Rotate α = 70° about z-axis
2. Rotate β = 0° about y-axis
3. Rotate γ = 0° about z-axis

The final orientation is identical in all cases, but we've used three different sets of Euler angles to achieve it.

### Generalizing

This example demonstrates a general principle: When the middle rotation angle (β) is 0°, the first and third rotation axes become parallel (both are the z-axis in this case). This creates an infinite number of possible combinations of α and γ whose sum equals the total rotation.

Mathematically:
- For any total rotation angle Φ
- If β = 0°, then any combination where α + γ = Φ produces the identical orientation

## Another Physical Example: Gimbal System

Imagine a physical gimbal system with three rings:
- Outer ring rotates about z-axis (first angle α)
- Middle ring rotates about y'-axis (second angle β)
- Inner ring rotates about z''-axis (third angle γ)

If we set β = 0°, the z-axis and z''-axis become aligned. Now we can distribute the total rotation between α and γ in infinitely many ways.

Even more dramatically, if we set β = 180°, we again have z and z'' axes parallel (but pointing in opposite directions). In this case, any combination where α - γ = constant will produce the same orientation.

This physical example clearly demonstrates that while three Euler angles uniquely define an orientation, a given orientation can be represented by multiple sets of Euler angles - showing the non-uniqueness property without needing to analyze direction cosine matrices.

# E 8

> *Both the (3-2-1) Aerospace (asymmetric) Euler angle sequence and the (3-1-3) Orbital (symmetric) Euler angle sequence contain geometric singularities. It is found that the singularity for all Euler sequences are for specific values of the second rotation angle. Show for the two Euler sequences mentioned above why the first and third rotation angles cannot be uniquely determined for the rotation angles that give the singularity configurations. You shall show that for the “singular second angle”, the first and third angles are being measure in the same plane and can therefore not be separated from one another*

Let's analyze the singularities for the (3-2-1) Aerospace and (3-1-3) Orbital Euler angle sequences.

### (3-2-1) Aerospace Euler Angles (Yaw-Pitch-Roll)

This sequence consists of rotations about the body's Z-axis (yaw, $\psi$), then the *new* Y-axis (pitch, $\theta$), and finally the *newest* X-axis (roll, $\phi$). The rotation matrix for this sequence is typically:

$R_{321}(\psi, \theta, \phi) = R_x(\phi) R_y(\theta) R_z(\psi)$

Where:
$R_z(\psi) = \begin{pmatrix} \cos\psi & -\sin\psi & 0 \\ \sin\psi & \cos\psi & 0 \\ 0 & 0 & 1 \end{pmatrix}$

$R_y(\theta) = \begin{pmatrix} \cos\theta & 0 & \sin\theta \\ 0 & 1 & 0 \\ -\sin\theta & 0 & \cos\theta \end{pmatrix}$

$R_x(\phi) = \begin{pmatrix} 1 & 0 & 0 \\ 0 & \cos\phi & -\sin\phi \\ 0 & \sin\phi & \cos\phi \end{pmatrix}$

The product, $R_{321}(\psi, \theta, \phi)$, can be expanded. The singularity occurs when the second rotation angle, $\theta$, is $\pm 90^\circ$ ($\pm \pi/2$ radians).

**Why singularity at $\theta = \pm 90^\circ$:**

When $\theta = 90^\circ$:
$R_y(90^\circ) = \begin{pmatrix} 0 & 0 & 1 \\ 0 & 1 & 0 \\ -1 & 0 & 0 \end{pmatrix}$

The combined rotation matrix, when $\theta = 90^\circ$, leads to:
$R_{321}(\psi, 90^\circ, \phi) = R_x(\phi) R_y(90^\circ) R_z(\psi)$
$= \begin{pmatrix} 1 & 0 & 0 \\ 0 & \cos\phi & -\sin\phi \\ 0 & \sin\phi & \cos\phi \end{pmatrix} \begin{pmatrix} 0 & 0 & 1 \\ 0 & 1 & 0 \\ -1 & 0 & 0 \end{pmatrix} \begin{pmatrix} \cos\psi & -\sin\psi & 0 \\ \sin\psi & \cos\psi & 0 \\ 0 & 0 & 1 \end{pmatrix}$
$= \begin{pmatrix} 0 & 0 & 1 \\ \sin\phi & \cos\phi & 0 \\ \cos\phi & -\sin\phi & 0 \end{pmatrix} \begin{pmatrix} \cos\psi & -\sin\psi & 0 \\ \sin\psi & \cos\psi & 0 \\ 0 & 0 & 1 \end{pmatrix}$
$= \begin{pmatrix} 0 & 0 & 1 \\ \sin\phi\cos\psi + \cos\phi\sin\psi & -\sin\phi\sin\psi + \cos\phi\cos\psi & 0 \\ \cos\phi\cos\psi - \sin\phi\sin\psi & -\cos\phi\sin\psi - \sin\phi\cos\psi & 0 \end{pmatrix}$
$= \begin{pmatrix} 0 & 0 & 1 \\ \sin(\phi+\psi) & \cos(\phi+\psi) & 0 \\ \cos(\phi+\psi) & -\sin(\phi+\psi) & 0 \end{pmatrix}$

Notice that the elements of the matrix depend only on the sum $(\phi+\psi)$. This means that infinite combinations of $\phi$ and $\psi$ can produce the same rotation. The first rotation (yaw, $\psi$) is about the Z-axis, and the third rotation (roll, $\phi$) is about the X-axis of the *doubly rotated* frame. When the pitch angle $\theta$ is $90^\circ$, the initial Z-axis becomes aligned with the final X-axis. Consequently, rotations about the initial Z-axis ($\psi$) and the final X-axis ($\phi$) are effectively rotations in the same plane (the new XY-plane), and their effects become indistinguishable. We lose one degree of freedom because the first and third rotations now act about the same axis, or parallel axes. They cannot be uniquely determined from the resulting attitude matrix.

The same applies for $\theta = -90^\circ$.

### (3-1-3) Orbital Euler Angles

This sequence consists of rotations about the body's Z-axis (longitude of ascending node, $\Omega$), then the *new* X-axis (inclination, $i$), and finally the *newest* Z-axis (argument of periapsis, $\omega$). The rotation matrix for this sequence is:

$R_{313}(\Omega, i, \omega) = R_z(\omega) R_x(i) R_z(\Omega)$

Where:
$R_z(\alpha) = \begin{pmatrix} \cos\alpha & -\sin\alpha & 0 \\ \sin\alpha & \cos\alpha & 0 \\ 0 & 0 & 1 \end{pmatrix}$

$R_x(i) = \begin{pmatrix} 1 & 0 & 0 \\ 0 & \cos i & -\sin i \\ 0 & \sin i & \cos i \end{pmatrix}$

The singularity occurs when the second rotation angle, $i$, is $0^\circ$ or $180^\circ$ ($0$ or $\pi$ radians).

**Why singularity at $i = 0^\circ$ or $i = 180^\circ$:**

When $i = 0^\circ$:
$R_x(0^\circ) = \begin{pmatrix} 1 & 0 & 0 \\ 0 & 1 & 0 \\ 0 & 0 & 1 \end{pmatrix} = I$ (Identity matrix)

The combined rotation matrix, when $i = 0^\circ$, leads to:
$R_{313}(\Omega, 0^\circ, \omega) = R_z(\omega) I R_z(\Omega) = R_z(\omega) R_z(\Omega) = R_z(\omega + \Omega)$

Here, the rotation matrix depends only on the sum $(\omega + \Omega)$. The first rotation ($\Omega$) is about the Z-axis, and the third rotation ($\omega$) is about the *newest* Z-axis. When the second rotation ($i$) is $0^\circ$, the X-axis rotation effectively does nothing, leaving the initial and final Z-axes aligned. Therefore, rotations about the initial Z-axis and the final Z-axis are compounded into a single rotation about that axis. We cannot distinguish between the contribution of $\Omega$ and $\omega$. They are measured in the same plane (the XY-plane) and cannot be separated.

When $i = 180^\circ$:
$R_x(180^\circ) = \begin{pmatrix} 1 & 0 & 0 \\ 0 & -1 & 0 \\ 0 & 0 & -1 \end{pmatrix}$

The combined rotation matrix, when $i = 180^\circ$, leads to:
$R_{313}(\Omega, 180^\circ, \omega) = R_z(\omega) R_x(180^\circ) R_z(\Omega)$
$= \begin{pmatrix} \cos\omega & -\sin\omega & 0 \\ \sin\omega & \cos\omega & 0 \\ 0 & 0 & 1 \end{pmatrix} \begin{pmatrix} 1 & 0 & 0 \\ 0 & -1 & 0 \\ 0 & 0 & -1 \end{pmatrix} \begin{pmatrix} \cos\Omega & -\sin\Omega & 0 \\ \sin\Omega & \cos\Omega & 0 \\ 0 & 0 & 1 \end{pmatrix}$
$= \begin{pmatrix} \cos\omega & \sin\omega & 0 \\ \sin\omega & -\cos\omega & 0 \\ 0 & 0 & -1 \end{pmatrix} \begin{pmatrix} \cos\Omega & -\sin\Omega & 0 \\ \sin\Omega & \cos\Omega & 0 \\ 0 & 0 & 1 \end{pmatrix}$
$= \begin{pmatrix} \cos\omega\cos\Omega + \sin\omega\sin\Omega & -\cos\omega\sin\Omega + \sin\omega\cos\Omega & 0 \\ \sin\omega\cos\Omega - \cos\omega\sin\Omega & -\sin\omega\sin\Omega - \cos\omega\cos\Omega & 0 \\ 0 & 0 & -1 \end{pmatrix}$
$= \begin{pmatrix} \cos(\omega-\Omega) & \sin(\omega-\Omega) & 0 \\ \sin(\omega-\Omega) & -\cos(\omega-\Omega) & 0 \\ 0 & 0 & -1 \end{pmatrix}$

In this case, the matrix elements depend only on the difference $(\omega-\Omega)$. Again, the first and third rotations become coupled, as the second rotation of $180^\circ$ about the X-axis effectively flips the Z-axis, but the overall effect is still a rotation about the (newly oriented) Z-axis. This results in the loss of a degree of freedom, and the first and third angles cannot be uniquely determined.

# E 9

> *The Euler parameters (quaternions) can be derived in the same way as for the Euler angles and the Euler principal axis (eigenaxis) rotation components: relations derived from parameter identification in the direction cosine matrix. For both the Euler angles and the Euler eigenaxis rotation, we got geometric singular configurations. Will we get singular configurations also for the Euler parameters? If yes, why and how do avoid it? If no, why do we not get it.*

No, Euler parameters (quaternions) **do not have geometric singularities**.

### Why they don't have singularities:

Euler angles are a minimal representation with three parameters, which leads to issues like "gimbal lock" where two axes align, causing a loss of a degree of freedom and making it impossible to uniquely determine the individual angles. This is an inherent topological limitation of any three-parameter representation of 3D rotations.

Euler parameters, on the other hand, use **four parameters** $(q_0, q_1, q_2, q_3)$ to represent a 3D rotation. These four parameters are constrained by the unit norm condition: $q_0^2 + q_1^2 + q_2^2 + q_3^2 = 1$. This means they lie on a 3-sphere in 4D space.

The "redundancy" of having four parameters (instead of the minimum three) with a constraint is precisely what allows quaternions to avoid geometric singularities. Every unique 3D rotation corresponds to two distinct unit quaternions ($q$ and $-q$), but this duality does not introduce singularities in the same way Euler angles do. It simply means that each physical orientation has two quaternion representations.

### How this avoids singularity:

Unlike Euler angles where specific orientations cause the rotational axes to align and equations to become undefined (e.g., division by zero or infinite solutions), the continuous and smooth nature of the quaternion space means that all rotations, including "straight up" or "straight down" orientations, can be represented without any mathematical ill-behavior. The transformation from quaternions to a rotation matrix (direction cosine matrix) is always well-defined and invertible (up to the $q$ and $-q$ duality).

# C 1

> *The Euler parameters can be computed from a direction cosine matrix (DCM) by Shepperd’s algorithm? Describe the fundamental steps in Shepperd’s algorithm and the decision steps that need to be taken along the way. What is the background behind the these steps?*

**Shepperd’s Algorithm for Euler Parameters (Quaternions) from DCM**  

**Fundamental Steps:**  
1. **Compute Squared Quaternion Components**:  
   Calculate four terms using the DCM’s trace and diagonals:  
   \[
   q_0^2 = \frac{1 + C_{11} + C_{22} + C_{33}}{4}, \quad
   q_1^2 = \frac{1 + C_{11} - C_{22} - C_{33}}{4}
   \]
   \[
   q_2^2 = \frac{1 - C_{11} + C_{22} - C_{33}}{4}, \quad
   q_3^2 = \frac{1 - C_{11} - C_{22} + C_{33}}{4}.
   \]  

2. **Decision Step: Select the Largest Component**  
   Identify the largest of \( q_0^2, q_1^2, q_2^2, q_3^2 \). This avoids numerical instability (e.g., division by near-zero values).  

3. **Compute the Chosen Component**:  
   Take the square root of the largest term (e.g., \( q_0 = \sqrt{q_0^2} \)).  

4. **Solve for Remaining Components**:  
   Use off-diagonal DCM elements to derive the other parameters:  
   - If \( q_0 \) is largest:  
     \[
     q_1 = \frac{C_{23} - C_{32}}{4q_0}, \quad
     q_2 = \frac{C_{31} - C_{13}}{4q_0}, \quad
     q_3 = \frac{C_{12} - C_{21}}{4q_0}.
     \]  
   - If \( q_1 \) is largest:  
     \[
     q_0 = \frac{C_{23} - C_{32}}{4q_1}, \quad
     q_2 = \frac{C_{12} + C_{21}}{4q_1}, \quad
     q_3 = \frac{C_{13} + C_{31}}{4q_1}.
     \]  
   (Analogous formulas apply for \( q_2 \), \( q_3 \)-dominant cases.)  

5. **Normalize**:  
   Ensure \( q_0^2 + q_1^2 + q_2^2 + q_3^2 = 1 \).  

**Background & Rationale**:  
- **Numerical Stability**: Selecting the largest component minimizes rounding errors by avoiding division by small values.  
- **Singularity Avoidance**: Prevents issues when rotation angles approach \( 0^\circ \) or \( 180^\circ \), where some quaternion components vanish.  
- **Efficiency**: Avoids redundant calculations and ensures a unique quaternion solution.  

**Key Insight**:  
Shepperd’s algorithm prioritizes robustness over arbitrary parameter choices, ensuring reliable DCM-to-quaternion conversion even in edge cases.

# C 2

> *Markley improved the algorithm by Shepperd to improve the accuracy of the solution. Describe how the steps of the Markley algorithm are different from the Shepperd algorithm to indicate the improvements gained by Markley’s algorithm. Do you always need to work with the Shepperd or Markley algorithms when using Euler parameters — why or why not?*

Markley's algorithm is an improvement upon Shepperd's, primarily focusing on enhancing robustness and accuracy, especially when the input Direction Cosine Matrix (DCM) is **not perfectly orthogonal** (e.g., due to numerical errors from propagation or measurement noise).

### How Markley's Algorithm is Different and Improved:

Shepperd's algorithm assumes the input DCM is perfectly orthogonal. While it's numerically stable for such matrices, if the DCM deviates slightly from orthogonality, the direct square root calculations for the quaternion components can become problematic or less accurate.

Markley's improvement lies in a more generalized approach that implicitly or explicitly handles the non-orthogonality. Instead of directly taking square roots of terms like $(1 \pm C_{11} \pm C_{22} \pm C_{33})$, Markley's method often involves:

1.  **Formulating an Eigenvalue Problem:** Markley's method can be seen as solving an eigenvalue problem for a specific symmetric matrix (sometimes called the K-matrix or attitude profile matrix) derived from the DCM. The quaternion components are then the elements of the eigenvector corresponding to the largest eigenvalue of this matrix.
2.  **Robustness to Non-Orthogonality:** This eigenvalue approach inherently provides a more robust solution even when the input DCM is slightly ill-conditioned or not perfectly orthogonal. It effectively finds the "closest" orthogonal matrix and then derives the quaternion from it. This is a significant practical advantage in real-world applications where DCMs are often subject to numerical errors.

The improvement gained is **higher accuracy and robustness** when dealing with numerically imperfect DCMs, which is a common scenario in navigation and attitude determination systems.

### Do you always need to work with Shepperd or Markley algorithms when using Euler parameters?

**Yes, generally you should use algorithms like Shepperd's or Markley's when converting a DCM to Euler parameters (quaternions).**

**Why?**

* **Numerical Stability:** As discussed, direct algebraic solutions for converting DCM to quaternions can lead to numerical instabilities (e.g., division by very small numbers or square roots of negative numbers due to floating-point errors) when certain components of the quaternion are near zero or when the rotation is close to $0^\circ$ or $180^\circ$. Algorithms like Shepperd's and Markley's are specifically designed to circumvent these issues by selecting the most numerically stable calculation path.
* **Robustness to Imperfect DCMs:** Especially with Markley's algorithm, they provide robust solutions even if the input DCM is not perfectly orthogonal, which often happens in real-time systems due to sensor noise or integration errors.
* **Standard Practice:** These algorithms (or similar numerically robust approaches like those based on singular value decomposition) are standard practice in aerospace engineering, robotics, and computer graphics for their reliability and accuracy in attitude representation.

While other direct algebraic formulas exist, they are generally less robust and more prone to numerical issues, making Shepperd's or Markley's methods the preferred choice for practical applications.

# C 3

> *If we compute the squares of each of the Euler parameters by Shepperd's algorithm, then we shall find the quaternion with the largest magnitude and then take the square root of that value, i.e. $\beta_i = +- \sqrt{\beta_i^2}$. If we select the "+" solution, then we get one set of Euler parameters and if we choose the “−” solution, then we get another set of Euler parameters. Illustrate the two different Euler parameter solutions - "+" or "-"____ to show if they are similar or different.*

# Shepperd's Algorithm: Two Quaternion Solutions

## Understanding the Two Solutions

When using Shepperd's algorithm to extract Euler parameters (quaternions), we compute the squares of quaternion components (β₁², β₂², β₃², β₄²) and then take the square root to find the components themselves.

For the component with the largest magnitude (let's call it βᵢ), we compute:
- βᵢ = ±√βᵢ²

This gives us two mathematically valid solutions: "+βᵢ" or "-βᵢ"

## Relationship Between the Two Solutions

The two solutions produce quaternions that are negatives of each other:
- Solution 1: q = [β₁, β₂, β₃, β₄]
- Solution 2: q = [-β₁, -β₂, -β₃, -β₄]

## Illustrating the Similarity

These solutions represent **identical rotations** because:
- A quaternion q and its negative -q represent the same physical orientation
- The rotation matrix R(q) = R(-q)

For example, if we have:
- Solution 1: q = [0.5, 0.5, 0.5, 0.5]
- Solution 2: q = [-0.5, -0.5, -0.5, -0.5]

Both represent a rotation of 120° about the axis [1,1,1]. When converted to rotation matrices or applied to vectors, they produce identical results.

## Why This Matters

This property is fundamental to quaternion mathematics - they provide a double cover of the rotation group SO(3), meaning each physical rotation has exactly two quaternion representations.

In practice, most implementations simply choose the positive solution by convention, but either solution works equally well for representing the orientation.

# C 4

> *Euler eigenaxis (or principal axis) is fixed in both the initial and final orientation. The eigenaxis is found as one of the eigenvectors to the direction cosine matrix (DCM). Which of the three eigenvalues of the DCM has the principal axis as its eigenvector. Motivate why this eigenvalue must be the one with the principal axis as its eigenvector. Is this eigenvalue unique? What would be the Euler eigenaxis solution for a direction cosine matrix equal to the identity matrix?*

The principal axis of the Direction Cosine Matrix (DCM) is the eigenvector corresponding to the eigenvalue $\lambda = 1$.

**Motivation:**
A rotation about the principal axis leaves vectors lying along that axis unchanged. If $\mathbf{v}$ is a vector along the principal axis, then applying the DCM (which represents the rotation) to $\mathbf{v}$ should result in $\mathbf{v}$ itself:
$DCM \cdot \mathbf{v} = \mathbf{v}$
This is precisely the definition of an eigenvector with an eigenvalue of 1. For any other vector not aligned with the principal axis, the DCM will rotate it to a different direction.

**Uniqueness:**
For a general rotation, the eigenvalue $\lambda=1$ is unique. The other two eigenvalues of a proper rotation matrix are complex conjugates of each other, given by $e^{\pm i\theta}$, where $\theta$ is the angle of rotation. If the rotation angle $\theta$ is non-zero, then only the eigenvalue 1 will correspond to a real eigenvector (the principal axis).

**Euler eigenaxis solution for the identity matrix:**
If the DCM is the identity matrix, $DCM = I$:
$I \cdot \mathbf{v} = \mathbf{v}$
In this case, *all* vectors are unchanged by the "rotation" (which is actually no rotation at all). This means that *every* vector is an eigenvector with an eigenvalue of 1. Therefore, the concept of a unique "principal axis" becomes undefined. Any axis can be considered the Euler eigenaxis, and the angle of rotation is 0.

# E 10

> *The principal Euler eigenaxis rotation angle is not unique and there exists another angle which will give exactly the same orientation in space. Describe both eigenaxis solutions in terms of Euler parameters and Modified Rodrigues parameters. In other words, how are the Euler parameters for the shortest and longest eigenaxis rotation angle related (and similar for the MRP)?*

While a physical orientation in space is unique, there are always **two ways to describe the rotation** that achieves that orientation using both Euler parameters (quaternions) and Modified Rodrigues Parameters (MRPs). This duality arises because a rotation by an angle $\phi$ about an axis $\hat{\mathbf{e}}$ results in the same final state as a rotation by $2\pi - \phi$ about the *opposite* axis $-\hat{\mathbf{e}}$.

Here's how these "shortest" and "longest" eigenaxis rotations are related in each representation:

---

### Euler Parameters (Quaternions)

For Euler parameters, the two solutions representing the exact same orientation are **negations of each other**.
* If $\mathbf{q} = \begin{bmatrix} \cos(\phi/2) \\ \hat{\mathbf{e}} \sin(\phi/2) \end{bmatrix}$ describes the "shortest" rotation (angle $\phi$),
* Then $-\mathbf{q} = \begin{bmatrix} -\cos(\phi/2) \\ -\hat{\mathbf{e}} \sin(\phi/2) \end{bmatrix}$ describes the "longest" rotation (angle $2\pi - \phi$ about $-\hat{\mathbf{e}}$).

This means if you have one set of Euler parameters, simply flipping the sign of all four components gives you the other set that produces the identical orientation.

---

### Modified Rodrigues Parameters (MRPs)

For Modified Rodrigues Parameters, the two solutions are related through a **"shadow" set**.
* If $\mathbf{p} = \hat{\mathbf{e}} \tan(\phi/4)$ describes the "shortest" rotation (angle $\phi$),
* Then its "shadow" equivalent, $\mathbf{p}^* = -\frac{1}{|\mathbf{p}|^2} \mathbf{p}$, describes the "longest" rotation (angle $2\pi - \phi$ about $-\hat{\mathbf{e}}$).

The shadow relationship means that the direction of the MRP vector is flipped, and its magnitude becomes the reciprocal of the original magnitude (scaled by the squared magnitude). This property is particularly useful in aerospace applications for avoiding numerical singularities when the rotation approaches $360^\circ$.

# E 11

> *A frame $B$ is rotating with respect to a frame $N$ . At time $t_0$, frame $B$ coincides with frame $N$ . What is the attitude of frame $B$ in Euler parameters at time $t_0$. At a certain time $t_1$, frame $B$ has rotated 180 degrees around axis $b_3 = n_3$. What is the attitude of frame $B$ in Euler parameters at time $t_1$?*

Sure, here's a summary of the attitude of frame B in Euler parameters at the given times:

---

## Attitude at $t_0$ (Coincident Frames)

At time $t_0$, **frame B coincides with frame N**, meaning there's no rotation between them. This is represented by a **zero rotation angle** ($\phi = 0^\circ$).

The Euler parameters for this state are the **identity quaternion**:
$\mathbf{q}(t_0) = \begin{bmatrix} 1 \\ 0 \\ 0 \\ 0 \end{bmatrix}$

---

## Attitude at $t_1$ (180-degree Rotation)

At time $t_1$, **frame B has rotated 180 degrees** ($\phi = 180^\circ$ or $\pi$ radians) **around the $b_3 = n_3$ axis** (the Z-axis).

The Euler parameters for this state are:
$\mathbf{q}(t_1) = \begin{bmatrix} 0 \\ 0 \\ 0 \\ 1 \end{bmatrix}$


# E 12

> A frame $B$ is rotating with respect to an inertial frame $N$. At time $t_0$, frame $B$ coincides with frame $N$. What is the attitude of frame $B$ in Modified Rodrigues parameters at time t0. At a certain time $t_1$, frame $B$ has rotated 180 degrees around axis $b_3 = n_3$. What is the attitude of frame $B$ in Modified Rodrigues parameters at time $t_1$.

**Answer:**  

1. **At time \( t_0 \):**  
   - Frame B coincides with frame N (no rotation).  
   - **Modified Rodrigues Parameters (MRPs):** \( \sigma = [0, 0, 0] \).  

2. **At time \( t_1 \):**  
   - Frame B has rotated \( 180^\circ \) about \( \mathbf{b}_3 = \mathbf{n}_3 \).  
   - **MRPs:** \( \sigma = [0, 0, 1] \).  

**Reasoning:**  
- MRPs are defined as \( \sigma = \tan\left(\frac{\theta}{4}\right) \mathbf{e} \), where \( \theta \) is the rotation angle and \( \mathbf{e} \) is the eigenaxis.  
  - For \( \theta = 0^\circ \) (no rotation): \( \sigma = [0, 0, 0] \).  
  - For \( \theta = 180^\circ \): \( \tan(45^\circ) = 1 \), so \( \sigma = \mathbf{e} = [0, 0, 1] \).  

**Key Insight:**  
MRPs avoid singularities for \( \theta = 360^\circ \) but work cleanly for \( \theta = 180^\circ \). The eigenaxis \( \mathbf{b}_3 \) directly maps to the MRP components.

# C 5

> 

# A 1

> 

# A 2

> 

# A 3

> 
