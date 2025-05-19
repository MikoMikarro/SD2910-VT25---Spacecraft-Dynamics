# E 1
![p3e1_eq](https://github.com/MikoMikarro/SD2910-VT25---Spacecraft-Dynamics/blob/main/problem_sheets/p3e1_equations.png?raw=true)
![p3e1_plots](https://github.com/MikoMikarro/SD2910-VT25---Spacecraft-Dynamics/blob/main/problem_sheets/p3e1_plots.png?raw=true)
# E 2

We start with the code provided in `EulerEqsExample` and `Euler`, and add the control law. To get the gain values, I defined a desired decay rate $T$ and got from gain values for a critically damped system:

$$P_i = \frac{2 I_i}{T}; \qquad K_i = \frac{P^2}{I_i}$$

We can validate the control law by plotting the error $\varepsilon$ in a semi-log plot and comparing it with the expected decay rate given the desired decay rate.

![p3e2_plots](https://github.com/MikoMikarro/SD2910-VT25---Spacecraft-Dynamics/blob/main/problem_sheets/p3e2_plots.png?raw=true)

# C 1

We use the same control law that is provided by the teachers in the `SpacecraftControlMRP` function:

$$ \boldsymbol{u}=-[K]\boldsymbol{\sigma}-[P]\boldsymbol{\omega}-\boldsymbol{L} $$

And after the calculation, I added a filter so that each of the components is not bigger than the specified $u_{\text{limit}}$.

For the values of the $K_i$ and $P_i$, I used the same strategy used in E2. Then, for part b, I used a bigger decay time so any value of $u_i$ has an absolute value greater than $u_{\text{limit}}$.

The following plot shows the difference in response between the two cases.

![p3c1_plots](https://github.com/MikoMikarro/SD2910-VT25---Spacecraft-Dynamics/blob/main/problem_sheets/p3c1_plots.png?raw=true)

## c 

In my case, the difference to get to a steady state was in the order of **350 seconds**.

# C 2

## a

$$ H_0 = I\omega_0\ ;\qquad \tau_{avg} \approx m_{max} B_{avg} \ ;\qquad t \approx \frac{||H_0||}{\tau_{avg}}$$

```matlab
t =
    2.2782 h
```

## b
The limiting is mainly the maximum allowed torque, that allows the satellite to avoid saturation and once the magnetorque is smaller than the one required required, the satellite can reach a steady state faster.

In my case, providing the maximum allowed torque of **4 Am^2**, we can reach a relatively steady state in less than an orbit.

## c

During my exploration, if we created undersired torque that is 10% greater than the $m_{max} B_{avg}$, it would start creating a bigger rotational speed than the desired one. However, in this case, I would say that any percentage over the expected one would make it tumble as the control law doesn't have any integral part to account for the cumulative error.

# A 1

## a

### Position

$$\boldsymbol{\sigma}_{er} = \frac{(1-\boldsymbol{\sigma}_r^T\boldsymbol{\sigma})\boldsymbol{\sigma} - (1-\boldsymbol{\sigma}^T\boldsymbol{\sigma})\boldsymbol{\sigma}_r + 2\boldsymbol{\sigma} \times \boldsymbol{\sigma}_r}{1 + \boldsymbol{\sigma}^T\boldsymbol{\sigma}_r + \boldsymbol{\sigma}^T\boldsymbol{\sigma} \cdot \boldsymbol{\sigma}_r^T\boldsymbol{\sigma}_r}$$


$$\dot{\boldsymbol{\sigma}} = \frac{1}{4}B(\boldsymbol{\sigma})\boldsymbol{\omega}$$


$$B(\boldsymbol{\sigma}) = (1-\boldsymbol{\sigma}^T\boldsymbol{\sigma})I_{3\times3} + 2[\boldsymbol{\sigma}\times] + 2\boldsymbol{\sigma}\boldsymbol{\sigma}^T$$

### Angular velocity

$$\boldsymbol{\omega} = 4B^{-1}(\boldsymbol{\sigma})\dot{\boldsymbol{\sigma}}$$

$$\boldsymbol{\omega}_{er} = \boldsymbol{\omega} - \boldsymbol{\omega}_r$$

### Rigid body equation

$$\mathbf{I}_C\dot{\boldsymbol{\omega}} + \boldsymbol{\omega} \times \mathbf{I}_C\boldsymbol{\omega} = \boldsymbol{u}$$
I'll use a PD-like control structure with feedforward terms:

$$\boldsymbol{u} = \mathbf{I}_C\dot{\boldsymbol{\omega}}_r + \boldsymbol{\omega} \times \mathbf{I}_C\boldsymbol{\omega} - \boldsymbol{\omega}_r \times \mathbf{I}_C\boldsymbol{\omega}_r - P\boldsymbol{\sigma}_{er} - K\boldsymbol{\omega}_{er}$$


where:
- $P = \text{diag}(P_1, P_2, P_3)$ are the position feedback gains
- $K = \text{diag}(K_1, K_2, K_3)$ are the velocity feedback gains

### Gain Selection

We define a single decay time $T$. Assuming a critically damped system:

$$P_i = \frac{2I_i}{T}$$

$$K_i = \frac{4I_i}{T^2}$$

As we can see from the analytical performance, when $T$ is much smaller than the natural period of the reference trajectory, the performance is very good:

![p3a1_plots](https://github.com/MikoMikarro/SD2910-VT25---Spacecraft-Dynamics/blob/main/problem_sheets/p3a1_plots.png?raw=true)

# A 2

Similar to the previous control law, without the feedforward terms, we can provide a simpler PI-D control structure:

$$\boldsymbol{u} = -K_p \beta - K_d \beta - z; \quad z = K_i \int_0^t \beta$$

After modifying the code to provide that control law and using the dynamics learned from the previous problem sheets, the following result shows the system was able to reach the desired steady state.

![p3a2_plots](https://github.com/MikoMikarro/SD2910-VT25---Spacecraft-Dynamics/blob/main/problem_sheets/p3a2_plots.png?raw=true)
