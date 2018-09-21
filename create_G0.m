function G0 = create_G0(T1, At, Tr, r, Tf, Tg, R, H, Kd)

s = tf('s');
Gt = -At*(1-s*T1)/(1+s*T1/2);
Gc = (1+s*Tr)/(r*(1+s*Tf)*Tr*s+R*(1+s*Tr));
Gs = 1/(1+s*Tg);
Hj = 1/(2*H*s +Kd);
G0 = -Hj/(1-Gt*Gc*Gs*Hj);