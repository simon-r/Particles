function [ r ] = dist_eucl( x1 , x2 )

Sx2 = size( x2 ) ;

x1 = repmat( x1 , Sx2(1) , 1 ) ;
r = sqrt( sum( ( x1 - x2 ).^2 , 2 ) ) ;
end

