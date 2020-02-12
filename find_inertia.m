function H = find_inertia(model, w1, w2)
if model.Ts == 0
    H = (w2-w1)/(2*w1*w2*(abs(evalfr(model,w1))...
    -abs(evalfr(model,w2))));
else
H = (w2-w1)/(2*w1*w2*(abs(evalfr(model,exp(sqrt(-1)*w1*model.Ts)))...
    -abs(evalfr(model,exp(sqrt(-1)*w2*model.Ts)))));
end

   %resp = freqresp(model^(-1),w1);
   %H = -imag(resp)/(2*w1);
   %Kd = real(resp);