function [ x ] = loop_boundary( xl , yl , zl , x )

delta_x = xl(2) - xl(1) ;
rx_min = find( (x(:,1) < xl(1) ) ) ;
rx_max = find( (x(:,1) > xl(2) ) ) ;

x(rx_min,1) = x(rx_min,1) + delta_x ;
x(rx_max,1) = x(rx_max,1) - delta_x ;



delta_y = yl(2) - yl(1) ;
ry_min = find( (x(:,2) < yl(1) ) ) ;
ry_max = find( (x(:,2) > yl(2) ) ) ;

x(ry_min,2) = x(ry_min,2) + delta_y ;
x(ry_max,2) = x(ry_max,2) - delta_y ;




delta_z = zl(2) - zl(1) ;
rz_min = find( (x(:,3) < zl(1) ) ) ;
rz_max = find( (x(:,3) > zl(2) ) ) ;

x(rz_min,3) = x(rz_min,3) + delta_z ;
x(rz_max,3) = x(rz_max,3) - delta_z ;

end

