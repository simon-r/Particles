    function r = dist_sum( x1 , x2 )
        x1 = repmat( x1 , length( x2 ) , 1 ) ;
        r = x1 + x2 ;
    end
