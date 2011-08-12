function  particles
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

vs = 100 ;
vr = 1:vs ;

G = 0.01 ;
dim = 3 ;
dt = 0.001 ;
steps = 40000 ;

x = set_array( rand( vs , dim )*2 - 1 );
m = set_array( ones( size(x,1) , 1 ) );
a = set_array( zeros( size(x) ) ) ;
a1 = set_array( zeros( size(x) ) ) ;
v = set_array( zeros( size(x) ) ) ;
F = set_array( zeros( size(x) ) ) ;
mc = set_array( zeros( size(x) ) ) ;

%m(30) = 5 ;

lm = 3 ;

xc = sum( x , 1 ) ;
mt = sum( m ) ;


for i=1:steps
    xc = sum( x , 1 ) ;
    for j=1:size(x,1)
        xcs = xc - x(j,:) ;
        mts = mt - m(j) ;
        
        rv =  x(j,:) - (xcs/(vs-1)) ;
        dist = sqrt( sum( ( rv ).^2 ) ) ;
        
        F(j,:) = -(G * m(j) * mts ) / ... 
            ( dist.^2 ) * ... 
            ( rv ) ;
    end
    
    for n=1:dim
        a1(:,n) = F(:,n) ./ m ;
    end
    
    x = lf_step( x , v , a , dt , dim ) ;
    
    for n=1:dim
        v(:,n) = v(:,n) + ( ( a(:,n) + a1(:,n) ) )  / 2 * dt ;
    end
    %toc 
    
    for n=1:dim
        mc(:,n) = m.*x(:,n) / mt ;
    end
    
    hold off ;
    plot3( x(:,1) , x(:,2) , x(:,3) , '.') ;
    grid on ;
    hold on ;
    plot3( mc(1) , mc(2)/mt , mc(3)/mt , '+' , 'Color' , 'red' ) ;
    xlim([-lm lm]) ;
    ylim([-lm lm]) ;
    zlim([-lm lm]) ;
    drawnow;
    pause(0.0);
    
    
end


    function ar = set_array( ar ) 
        %ar = gpuArray( ar ) ;
    end

end

