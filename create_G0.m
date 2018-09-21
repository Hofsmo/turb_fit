function G0 = create_G0(T1, T2, At, Tr, r, Tf, Tg, R, H, Kd,Dg)

s = tf('s');
Gt = At*(1-s*T1)/(1+s*T2)-Dg;
Gc = -(1+s*Tr)/(r*(1+s*Tf)*Tr*s+R*(1+s*Tr));
Gs = 1/(1+s*Tg);
Hj = 1/(2*H*s +Kd);
G0 = -Hj/(1-Gt*Gc*Gs*Hj);