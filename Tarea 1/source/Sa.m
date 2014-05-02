function y = Sa(x)
y = zeros(1,length(x));
for i = 1:length(x);
    if i == 1
        y(i) = -x(i);
    else
        y(i) = 0.5*y(i-1) - x(i);
    end
end