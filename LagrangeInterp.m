function [yy] = LagrangeInterp(x,y,xx)
% Question: How do you verify that this is indeed Lagrange interpolation?
% Answer: If two polinomials of degree <= n, produce the same values y_i
% for every x_i for n+1 points (x_i) than the two polinomiyals are
% identical, so we can verify that P(x_i) = f(x_i).
% the proof of the first claim is based on the fact that P1 = P2 (two interpolation polynomials
% of degree <=n), than the polinomiyal h(x) = P1(x) - P2(x)  = 0 has degree
% <= n, and thus h(x)=0, so if we assume towards contradiction that there
% is a polynomial of degree <= n and has more than n roots, we will get the
% contradiction.

x_length = length(x);
index = 1;
L = 0;
while(index <= x_length)
    l_i = 0;
    for i=1:x_length
       % calculate lagrange expression for index
       if i ~= index
            l_i= l_i + (xx-x(i))/(x(index)-x(i));
            L = L + y(index)*l_i;
       end
    end
    index =  index+1;
end

yy = L;
end

