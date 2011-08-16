function  particles
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

vs = 200 ;

tmsize = (vs-1)*vs / 2 ;

G = 0.1 ;
dim = 3 ;
dt = 0.001 ;
steps = 40000 ;

x = set_array( rand( vs , dim )*2 - 1 );

m = set_array( ones( size(x,1) , 1 ) );
m1m2 = set_array( ones( tmsize , 1 ) ) ;

a = set_array( zeros( size(x) ) ) ;
%xcp = set_array( zeros( size(x) ) ) ;
a1 = set_array( zeros( size(x) ) ) ;
v = set_array( zeros( size(x) ) ) ;

F = set_array( zeros( vs , dim ) ) ;
Fs = set_array( ones( tmsize , 1 ) ) ; 

%rv = set_array( zeros( size(x) ) ) ;
dist = set_array( ones( tmsize , 1 ) ) ;
ru = set_array( zeros( tmsize , dim ) ) ;

mc = set_array( zeros( 1, dim ) ) ;
%mcp = set_array( ones( size(x) ) ) ; 

indx = set_array( zeros( vs-1 , 1 ) ) ;


%m(30) = 5 ;

lm = 3 ;

% xc = sum( x , 1 ) ;
mt = sum( m ) ;

%mp = mt - m ;
    
for j=2:(vs-1+1)
    indx(j) = indx(j-1) + vs-j ;
end
    
    
    
for i=1:steps
    
    tic ;
        
    m1m2(:) = pdist( m , @dist_mult ) ;
    dist(:) = pdist( x ) ;
    
    Fs(:) = (G .* m1m2 ) ./ ( dist.^2 ) ;
    
    ru(:) = my_pdist( x , @dist_uvect ) ;
    
    
    
    for j=1:vs
        i1 = (indx(1:j-1) + j-1)' ;
        i2 = (j+indx(j)):(indx(j)+vs-1) ;
        
        for n=1:dim
            tFs = ([ Fs(i1) ; 0 ; Fs(i2) ] .* ...
                [ -ru(i1,n) ; 0 ; ru(i2,n) ]) ;
            
            F(j,n) = sum( tFs ) ;
        end
    end
        
    for n=1:dim
        a1(:,n) = F(:,n) ./ m ;
    end
    
    for n=1:dim
        x(:,n) = x(:,n) + v(:,n)*dt + 1/2*a1(:,n)*dt^2 ;
        %v(:,n) = v(:,n) + a1(:,n)*dt ;
        v(:,n) = v(:,n) + ( ( a(:,n) + a1(:,n) ) )  ./ 2 * dt ;
    end
    
    a(:) = a1(:) ;
        
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

