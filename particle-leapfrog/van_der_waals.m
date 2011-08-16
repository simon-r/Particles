function [ F ] = van_der_waals(  A , x , m )


m1m2 = my_pdist( m , @dist_mult ) ;
m1pm2 = my_pdist( m , @dist_sum ) ;
dist = pdist( x )' ;

F = (A .* m1m2 ) ./ ( (m1pm2) .* 6 .* dist.^2 ) ;

end

