function [ X ] = cluster( x , y , z , n )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

X = rand_sphe( round( n ) ) ;

X(:,1) = X(:,1) + x ;
X(:,2) = X(:,2) + y ;
X(:,3) = X(:,3) + z ;

end

