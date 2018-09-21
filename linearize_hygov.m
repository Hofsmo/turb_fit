function [T1,T2,Dg,q0] = linearize_hygov(Pm0, Tw, qnl, At,Dt,w0)

q0=(Pm0+(At*qnl))/(At-(w0*Dt));
T1 = (q0-qnl)*Tw;
T2 = q0*Tw/2;
Dg = q0*Dt;

