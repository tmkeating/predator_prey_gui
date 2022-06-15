function seasonality 

k = 1; c = 0.5; mu = 0.9; rho0 = 2; r0 = 0.1; gam0 = 1; delta0 = 0.1; beta0 = 0.1; 
gam1 = 1; T0 = 258; tau = 500; phi = 5; psi = 5; theta = 5; h = 1; gam = 1; g = 1;
zeta = 0.1; epsi = 0.1; eta = 0.1; delta = 0.1; rho = 1;
initialc = [0.19 0.18 0.02 0.22 0.02];
beta1 = [0.0 0.2 0.4 0.6 0.8 1.0 0.33 0.66];
tvec =  linspace(0,2500,2500);

seasonality1 = {@(t) delta0; @(t) rho0; @(t) beta0*(1 + beta1(1)*sin(2*pi*t/tau)); @(t) r0; @(t) gam0/(exp(1)^(gam1*T0)-1)*(exp(1)^(gam1*T0)-1)}
seasonality2 = {@(t) delta0; @(t) rho0; @(t) beta0*(1 + beta1(2)*sin(2*pi*t/tau)); @(t) r0; @(t) gam0/(exp(1)^(gam1*T0)-1)*(exp(1)^(gam1*T0)-1)}
seasonality3 = {@(t) delta0; @(t) rho0; @(t) beta0*(1 + beta1(3)*sin(2*pi*t/tau)); @(t) r0; @(t) gam0/(exp(1)^(gam1*T0)-1)*(exp(1)^(gam1*T0)-1)}
seasonality4 = {@(t) delta0; @(t) rho0; @(t) beta0*(1 + beta1(4)*sin(2*pi*t/tau)); @(t) r0; @(t) gam0/(exp(1)^(gam1*T0)-1)*(exp(1)^(gam1*T0)-1)}
seasonality5 = {@(t) delta0; @(t) rho0; @(t) beta0*(1 + beta1(5)*sin(2*pi*t/tau)); @(t) r0; @(t) gam0/(exp(1)^(gam1*T0)-1)*(exp(1)^(gam1*T0)-1)}
seasonality6 = {@(t) delta0; @(t) rho0; @(t) beta0*(1 + beta1(6)*sin(2*pi*t/tau)); @(t) r0; @(t) gam0/(exp(1)^(gam1*T0)-1)*(exp(1)^(gam1*T0)-1)}
seasonality7 = {@(t) delta0; @(t) rho0; @(t) beta0*(1 + beta1(7)*sin(2*pi*t/tau)); @(t) r0; @(t) gam0/(exp(1)^(gam1*T0)-1)*(exp(1)^(gam1*T0)-1)}
seasonality8 = {@(t) delta0; @(t) rho0; @(t) beta0*(1 + beta1(8)*sin(2*pi*t/tau)); @(t) r0; @(t) gam0/(exp(1)^(gam1*T0)-1)*(exp(1)^(gam1*T0)-1)}

predatorprey1 = @(t,ic) [ ... 
            rho*ic(1)*(1-ic(1)/c) - phi*((ic(1)*ic(2))/(ic(1)+g))
            zeta*phi*ic(1)/(ic(1)+g)*ic(2) - seasonality1{3}(t)*ic(2)
            mu*phi*ic(1)*ic(2)/(ic(1)+g) - seasonality1{5}(t)*ic(3) - psi*ic(3)*ic(5)/(ic(4)+ic(3)+h)
            seasonality1{4}(t)*ic(4)*(1-ic(4)/k) - theta*ic(4)*ic(5)/(ic(4)+ic(3)+h)
            (epsi*theta*ic(4)+eta*psi*ic(3))/(ic(4)+ic(3)+h)*ic(5) - seasonality1{1}(t)*ic(5)];

predatorprey2 = @(t,ic) [ ... 
            rho*ic(1)*(1-ic(1)/c) - phi*((ic(1)*ic(2))/(ic(1)+g))
            zeta*phi*ic(1)/(ic(1)+g)*ic(2) - seasonality2{3}(t)*ic(2)
            mu*phi*ic(1)*ic(2)/(ic(1)+g) - seasonality2{5}(t)*ic(3) - psi*ic(3)*ic(5)/(ic(4)+ic(3)+h)
            seasonality2{4}(t)*ic(4)*(1-ic(4)/k) - theta*ic(4)*ic(5)/(ic(4)+ic(3)+h)
            (epsi*theta*ic(4)+eta*psi*ic(3))/(ic(4)+ic(3)+h)*ic(5) - seasonality2{1}(t)*ic(5)];	

predatorprey3 = @(t,ic) [ ... 
            rho*ic(1)*(1-ic(1)/c) - phi*((ic(1)*ic(2))/(ic(1)+g))
            zeta*phi*ic(1)/(ic(1)+g)*ic(2) - seasonality3{3}(t)*ic(2)
            mu*phi*ic(1)*ic(2)/(ic(1)+g) - seasonality3{5}(t)*ic(3) - psi*ic(3)*ic(5)/(ic(4)+ic(3)+h)
            seasonality3{4}(t)*ic(4)*(1-ic(4)/k) - theta*ic(4)*ic(5)/(ic(4)+ic(3)+h)
            (epsi*theta*ic(4)+eta*psi*ic(3))/(ic(4)+ic(3)+h)*ic(5) - seasonality3{1}(t)*ic(5)];	

predatorprey4 = @(t,ic) [ ... 
            rho*ic(1)*(1-ic(1)/c) - phi*((ic(1)*ic(2))/(ic(1)+g))
            zeta*phi*ic(1)/(ic(1)+g)*ic(2) - seasonality4{3}(t)*ic(2)
            mu*phi*ic(1)*ic(2)/(ic(1)+g) - seasonality4{5}(t)*ic(3) - psi*ic(3)*ic(5)/(ic(4)+ic(3)+h)
            seasonality4{4}(t)*ic(4)*(1-ic(4)/k) - theta*ic(4)*ic(5)/(ic(4)+ic(3)+h)
            (epsi*theta*ic(4)+eta*psi*ic(3))/(ic(4)+ic(3)+h)*ic(5) - seasonality4{1}(t)*ic(5)];	

predatorprey5 = @(t,ic) [ ... 
            rho*ic(1)*(1-ic(1)/c) - phi*((ic(1)*ic(2))/(ic(1)+g))
            zeta*phi*ic(1)/(ic(1)+g)*ic(2) - seasonality5{3}(t)*ic(2)
            mu*phi*ic(1)*ic(2)/(ic(1)+g) - seasonality5{5}(t)*ic(3) - psi*ic(3)*ic(5)/(ic(4)+ic(3)+h)
            seasonality5{4}(t)*ic(4)*(1-ic(4)/k) - theta*ic(4)*ic(5)/(ic(4)+ic(3)+h)
            (epsi*theta*ic(4)+eta*psi*ic(3))/(ic(4)+ic(3)+h)*ic(5) - seasonality5{1}(t)*ic(5)];	

predatorprey6 = @(t,ic) [ ... 
            rho*ic(1)*(1-ic(1)/c) - phi*((ic(1)*ic(2))/(ic(1)+g))
            zeta*phi*ic(1)/(ic(1)+g)*ic(2) - seasonality6{3}(t)*ic(2)
            mu*phi*ic(1)*ic(2)/(ic(1)+g) - seasonality6{5}(t)*ic(3) - psi*ic(3)*ic(5)/(ic(4)+ic(3)+h)
            seasonality6{4}(t)*ic(4)*(1-ic(4)/k) - theta*ic(4)*ic(5)/(ic(4)+ic(3)+h)
            (epsi*theta*ic(4)+eta*psi*ic(3))/(ic(4)+ic(3)+h)*ic(5) - seasonality6{1}(t)*ic(5)];

predatorprey7 = @(t,ic) [ ... 
            rho*ic(1)*(1-ic(1)/c) - phi*((ic(1)*ic(2))/(ic(1)+g))
            zeta*phi*ic(1)/(ic(1)+g)*ic(2) - seasonality7{3}(t)*ic(2)
            mu*phi*ic(1)*ic(2)/(ic(1)+g) - seasonality7{5}(t)*ic(3) - psi*ic(3)*ic(5)/(ic(4)+ic(3)+h)
            seasonality7{4}(t)*ic(4)*(1-ic(4)/k) - theta*ic(4)*ic(5)/(ic(4)+ic(3)+h)
            (epsi*theta*ic(4)+eta*psi*ic(3))/(ic(4)+ic(3)+h)*ic(5) - seasonality7{1}(t)*ic(5)];
			
predatorprey8 = @(t,ic) [ ... 
            rho*ic(1)*(1-ic(1)/c) - phi*((ic(1)*ic(2))/(ic(1)+g))
            zeta*phi*ic(1)/(ic(1)+g)*ic(2) - seasonality8{3}(t)*ic(2)
            mu*phi*ic(1)*ic(2)/(ic(1)+g) - seasonality8{5}(t)*ic(3) - psi*ic(3)*ic(5)/(ic(4)+ic(3)+h)
            seasonality8{4}(t)*ic(4)*(1-ic(4)/k) - theta*ic(4)*ic(5)/(ic(4)+ic(3)+h)
            (epsi*theta*ic(4)+eta*psi*ic(3))/(ic(4)+ic(3)+h)*ic(5) - seasonality8{1}(t)*ic(5)];			
			
[t1 uvsxy1] = ode45(predatorprey1,tvec,initialc);
[t2 uvsxy2] = ode45(predatorprey2,tvec,initialc);
[t3 uvsxy3] = ode45(predatorprey3,tvec,initialc);
[t4 uvsxy4] = ode45(predatorprey4,tvec,initialc);
[t5 uvsxy5] = ode45(predatorprey5,tvec,initialc);
[t6 uvsxy6] = ode45(predatorprey6,tvec,initialc);
[t7 uvsxy7] = ode45(predatorprey7,tvec,initialc);
[t8 uvsxy8] = ode45(predatorprey8,tvec,initialc);

figure(1)
subplot(2,2,1)
plot(t1, uvsxy1(:,4))
hold on
plot(t2, uvsxy2(:,4))
plot(t3, uvsxy3(:,4))
plot(t4, uvsxy4(:,4))
plot(t5, uvsxy5(:,4))
plot(t6, uvsxy6(:,4))
hold off
xlabel('t'); ylabel('x(t)')
% legend({'\beta_1 = 0.0','\beta_1 = 0.2','\beta_1 = 0.4','\beta_1 = 0.6','\beta_1 = 0.8','\beta_1 = 1.0'},'units','pixels','Position',[800 500 100 150])
legend('\beta_1 = 0.0','\beta_1 = 0.2','\beta_1 = 0.4','\beta_1 = 0.6','\beta_1 = 0.8','\beta_1 = 1.0')
axis tight
subplot(2,2,2)
plot(t1, uvsxy1(:,5))
hold on
plot(t2, uvsxy2(:,5))
plot(t3, uvsxy3(:,5))
plot(t4, uvsxy4(:,5))
plot(t5, uvsxy5(:,5))
plot(t6, uvsxy6(:,5))
hold off
xlabel('t'); ylabel('y(t)');
legend('\beta_1 = 0.0','\beta_1 = 0.2','\beta_1 = 0.4','\beta_1 = 0.6','\beta_1 = 0.8','\beta_1 = 1.0')
axis tight
subplot(2,2,3)
plot(t1, uvsxy1(:,4))
hold on
plot(t7, uvsxy7(:,4))
plot(t8, uvsxy8(:,4))
plot(t6, uvsxy6(:,4))
hold off
xlabel('t'); ylabel('x(t)')
legend('\beta_1 = 0.0','\beta_1 = 0.33','\beta_1 = 0.66', '\beta_1 = 1.0')
axis tight