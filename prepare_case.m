function [data, validation_data] = prepare_case(y, u, ratio, T, Ts )
%PREPARE_CASE Summary of this function goes here
%   Detailed explanation goes here

yd = decimate(y,ratio);
ud = decimate(u,ratio);
Tsd = ratio*Ts;
T1=T/2/Tsd+1;

data = iddata(yd,ud,Tsd);
validation_data = iddata(yd(T1+1:end),ud(T1+1:end), Tsd);

data = detrend(data);
validation_data = detrend(validation_data);


end

