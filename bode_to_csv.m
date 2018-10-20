function bode_to_csv(tf, fname,base,skip)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
if nargin==2
    base =1;
end
[mag, phase, omega] = bode(tf/base);  
csvwrite(fname, [reshape(omega(1:skip:end),[],1), reshape(20*log10(mag(1:skip:end)),[],1),...
            reshape(phase(1:skip:end),[],1)])

end

