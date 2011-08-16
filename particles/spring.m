function [ F ] = spring( k , x , m )

dist = pdist( x )' ;

F = k * dist ;

end

