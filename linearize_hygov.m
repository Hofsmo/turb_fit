function [T1,T2,Dg,q0] = linearize_hygov(Pm0, Tw, qnl, At,Dt)

q0 = Pm0/At + qnl;
T1 = (q0-qnl)*Tw;
T2 = q0*Tw/2;
Dg = q0*Dt;