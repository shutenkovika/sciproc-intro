% file 'midpoint_v.m'
% calculates a midpoint rule approximation of
% the integral from 0 to pi/2 of f(x) = exp (x^2) cos (x)
% -- traditional looped code 
% set limits of integration, number of terms and delta x
a = 0
b = pi/2
n = 100
dx = (b-a)/n
% define function to integrate 
function y = f (x)
y = exp(x .^ 2) .* cos(x);
end
% create vector of midpoints
m = [a + dx/2:dx:b-dx/2]; 
% create vector of function values at midpoints
M = f(m);
% midpoint appproximation to the integral
approx = msum * dx
