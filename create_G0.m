function [G0, Gp, Hj, S, Gt, Gc, Gs] = create_G0(T1, T2, At, Tr, r, Tf, Tg, R, H, Kd,Dg,Tdel)

s = tf('s');
Gt = At*(1-s*T1)/(1+s*T2);
Gc = (1+s*Tr)/(r*(1+s*Tf)*Tr*s+R*(1+s*Tr));
Gs = exp(-s*Tdel)/(1+s*Tg);
Hj = 1/(2*H*s +Kd);
Gp = Gt*Gc*Gs+Dg;
S = 1/(1+Hj*Gp);
G0 = -Hj*S;

