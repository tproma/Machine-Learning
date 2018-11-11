function [left, right, y_mean] = Regression_split(data, theta)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

     x = data(:, 1);
     y = data(:, 2);

     y_var = var(y);
     x_mean = mean(x);
     y_size = size(y);

     left = zeros(size(y_size));
     right = zeros(size(y_size));
     y_mean = zeros(1);

     if ( y_var> theta)

         k = 1;
         l =1;
         for i = 1: y_size 
            if data(i,1) <x_mean
                left(k,:) = data(i,:);
                k = k+1;

            else 
                right(l,:) = data(i,:);
                l = l+1;
            end

         end
     else 
         y_mean = mean(y);
     end
end

