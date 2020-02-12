function bode_to_csv(tf, fname, w, base, skip, sd)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
if nargin<6
    sd = 0;
end
if nargin < 5
    skip = 1;
end
if nargin < 4
    base = 1;
end
if sd == 0
    
[mag, phase] = corrected_bode(tf/base, w);  
csvwrite(fname, [reshape(w(1:skip:end),[],1), reshape(20*log10(mag(1:skip:end)),[],1),...
            reshape(phase(1:skip:end),[],1)])
else
    [mag, phase, omega, sdmag, sdphase] = bode(tf, 'sd', 2);  
    csvwrite(fname,...
    [reshape(omega(1:skip:end),[],1),...
    reshape(20*log10(mag(1:skip:end)),[],1),...
            reshape(phase(1:skip:end),[],1),...
            reshape(20*log10(sqrt(sdmag(1:skip:end).^2+mag(1:skip:end)).^2),[],1),...
            reshape(sdphase(1:skip:end),[],1)])
end
