function [ F ] = gravity( G , x , m )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

m1m2 = my_pdist( m , @dist_mult ) ;
dist = pdist( x )' ;

F = (G .* m1m2 ) ./ ( dist.^2 ) ;

end

