function  particles
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

vs = 100000 ;
vr = 1:vs ;

G = 0.000001 ;
dim = 3 ;
dt = 0.001 ;
steps = 40000 ;

x = set_array( rand( vs , dim )*2 - 1 );
m = set_array( ones( size(x,1) , 1 ) );
a = set_array( zeros( size(x) ) ) ;
xcp = set_array( zeros( size(x) ) ) ;
a1 = set_array( zeros( size(x) ) ) ;
v = set_array( zeros( size(x) ) ) ;

F = set_array( zeros( size(x) ) ) ;
Fs = set_array( ones( size(x,1) , 1 ) ) ; 

rv = set_array( zeros( size(x) ) ) ;
dist = set_array( ones( size(x,1) , 1 ) ) ;
ru = set_array( ones( size(x,1) , 1 ) ) ;

mc = set_array( zeros( 1, dim ) ) ;
mcp = set_array( ones( size(x) ) ) ; 


%m(30) = 5 ;

lm = 3 ;

% xc = sum( x , 1 ) ;
mt = sum( m ) ;

mp = mt - m ;

for i=1:steps
    
    tic ;
%    xc = sum( x , 1 ) ;
%     for n=1:dim
%         xcp(:,n) = xc(n) - x(:,n) ;
%     end
    
    for n=1:dim
        sm = sum( m.*x(:,n) ) ;
        mcp(:,n) = ( sm - m.*x(:,n)) ./ mp ;
        mc(n) = sm / mt ;
        rv(:,n) = x(:,n) - mcp(:,n) ;
    end
    
    dist(:) = sqrt ( sum( (x - mcp).^2 , 2 ) ) ;
    
    for n=1:dim
        ru(:,n) = rv(:,n) ./ dist ;
    end
    
    Fs(:) = (G .* m .* mp ) ./ ( dist.^2 ) ;
    for n=1:dim
        F(:,n) = -Fs .* ru(:,n) ;
    end
        
    for n=1:dim
        a1(:,n) = F(:,n) ./ m ;
    end
    
    for n=1:dim
        x(:,n) = x(:,n) + a1(:,n)*dt ;
    end
    %x = lf_step( x , v , a , dt , dim ) ;
    
%     for n=1:dim
%         v(:,n) = v(:,n) + ( ( a(:,n) + a1(:,n) ) )  ./ 2 * dt ;
%     end
        
    
    toc
    
    
    hold off ;
    plot3( x(:,1) , x(:,2) , x(:,3) , '.') ;
    grid on ;
    hold on ;
    plot3( mc(1) , mc(2) , mc(3) , '+' , 'Color' , 'red' ) ;
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

