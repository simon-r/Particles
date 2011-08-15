    function r = dist_mult( x1 , x2 )
        x1 = repmat( x1 , length( x2 ) , 1 ) ;
        r = x1.*x2 ;
    end

