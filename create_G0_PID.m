function [G0, Gp, Hj, S, Gt, Gc, Gs] = create_G0_PID(T1, T2, At, Ti, Kp, Tf, Td, Tg, R, H, Kd,Dg,Tdel)

s = tf('s');
Gt = At*(1-s*T1)/(1+s*T2);
Gc = Kp*(Ti*s+1)/((1+s*Tf)*(Ti*s*(1+s*Tg)+R*Kp));
Gs = exp(-s*Tdel)/(1+s*Tg);
Hj = 1/(2*H*s +Kd);
Gp = Gt*Gc+Dg;
S = 1/(1+Hj*Gp);
G0 = -Hj*S;

