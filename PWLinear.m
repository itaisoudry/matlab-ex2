function [yy] = PWLinear(x,y,xx)
x_length = length(x);
% flag that indicates xx == x_i for some i
found_match = false;
% flag that indicates xx found in range
found = false;

range_index = 0;
% if xx == x_i for some i, return y_i
for i=1:x_length
    if x(i)==xx
        found_match = true;
        yy = y(i);
        break;
    end
    if i < x_length && x(i)<xx<x(i+1)
        range_index=i;
        found=true
        break;
    end
end

if found_match==false && found==true
    % this calculation is based on the face that given xx, we need to
    % calculate its value in the function in the range / line x_i to x_i+1
    % the formula is: (y_2-y_1)/(x_2-x_1) = (y-y_1) / (x-x_1)
    % if we simplify this formula, we get:
    % y=y_i + ((y_i+1-y_i)/(x_i+1-x_i))*(x-x_i) which is the formula i used
    range_mult = ((y(range_index+1)-y(range_index)) / (x(range_index+1)-x(range_index)));
    yy = y(range_index) + range_mult*(xx-x(range_index));
else
    disp('xx not in range!');
    yy='Error';
end
end

