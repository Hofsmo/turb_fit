function [T1,q0] = linearize_hygov(Pm0, Tw, qnl, At)
q0 = Pm0/At + qnl;
T1 = q0*Tw;

