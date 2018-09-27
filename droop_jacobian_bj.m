function J = droop_jacobian_bj(model)

F = model.F;
B = model.B;

over_f = 1/sum(F);
b_over_f = sum(B)*over_f^2;
    
for i = 1:numel(B)
    J(i) = over_f;
end

for i = 1:(numel(F)-1)
    J(numel(B )+i) = -b_over_f;
end