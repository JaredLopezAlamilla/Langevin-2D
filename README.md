# Langevin Simulations in 2D 
This bundle of scripts and functions calculate single-molecule trajectory  of overdamped Brownian motion over 2D energy landscape.

Functions required: Murayama2D.m, Langevin2D.m

## Use example

`>>Langevin2D;`

Plotting the results:

1. Plotting trajectory over XY plane

`>>figure(); plot(XX(1,:),XX(2,:));title('$\vec{r}(x_t,y_t)$');`

2. Plotting trajectory over XY plane and color gradient indicating time axis

`>>figure(); scatter(XX(1,1:5:end),XX(2,1:5:end),[],TT(1:5:end),'fill');`

3. Plotting only X component of trajectory

`>>figure(); plot(TT,XX(1,:));title('$x(t)$');`

4. Plotying only Y componet of trajectory

`>>figure(); plot(TT,XX(2,:));title('$y(t)$');`



