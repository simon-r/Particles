function [ x ] = lf_step( x , v , a , dt , dim )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

for i=1:dim ;
    x(:,i) = x(:,i) + v(:,i)*dt + a(:,i)*dt^2 / 2 ;
end

end

