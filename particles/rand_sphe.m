function [ rnd ] = rand_sphe( i ) 
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

rnd = zeros(i,3) ;

r = rand(i,1) ;
phi = rand(i,1) * 2*pi ;
theta = rand(i,1) * pi ;

[rnd(:,1) rnd(:,2) rnd(:,3)] = sph2cart(theta,phi,r) ;

end

