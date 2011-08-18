function  particles_rk
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

vs = 700 ;

G = 0.005 ;
dt = 0.004 ;
steps = 2000 ;

x1 = cluster( 1 , 1 , 1 , vs/2 ) ;
x2 = cluster( -1 , -1 , -1 , vs/2 ) ;
x3 = cluster( -1 , -1 , 0 , vs/3 ) ;


x = [ x1 ; x2 ; x3 ] ;

[vs dim] = size(x) ;
tmsize = (vs-1)*vs / 2 ;


v = ( zeros( size(x) ) ) ;


m = ( rand( size(x,1) , 1 )*0.5 + 1 );
a = ( zeros( size(x) ) ) ;
a1 = ( zeros( size(x) ) ) ;



F = ( zeros( vs , dim ) ) ;
Fs = ( ones( tmsize , 1 ) ) ; 

tFs = ( zeros( vs , dim ) ) ;
Fsi = ( zeros( vs , 1 ) ) ;

ru = ( zeros( tmsize , dim ) ) ;

mc = ( zeros( 1, dim ) ) ;


indx = zeros( vs-1 , 1 ) ;

clock1 = 0 ;
clock2 = 0 ;

%m(30) = 5 ;

lm = 7 ;

mt = sum( m ) ;

    
for j=2:(vs-1+1)
    indx(j) = indx(j-1) + vs-j ;
end
    
    
disp(' === Start ========================') ;   
for i=1:steps
    
    tic ;   

    Fs(:) = gravity( G , x , m ) ;
    
    ru(:) = my_pdist( x , @dist_uvect ) ;
    clock1 = clock1 + toc  ;
      
    tic ;
    for j=1:vs
        i1 = (indx(1:j-1) + j-1)' ;
        i2 = (j+indx(j)):(indx(j)+vs-1) ;
        
        Fsi(:) = [ Fs(i1) ; 0 ; Fs(i2)] ;
        
        for n=1:dim
            tFs(:,n) = ( Fsi .* [ -ru(i1,n) ; 0 ; ru(i2,n) ]) ; 
        end
        F(j,:) = sum( tFs , 1 )' ;
    end
    
    parfor n=1:dim
        a1(:,n) = F(:,n) ./ m ;
        x(:,n) = x(:,n) + v(:,n)*dt + 1/2*a(:,n)*dt^2 ;
        %v(:,n) = v(:,n) + a1(:,n)*dt ;
        v(:,n) = v(:,n) + ( ( a(:,n) + a1(:,n) ) )  ./ 2 * dt ;
    end
    
    a(:) = a1(:) ;
        
    clock2 = clock2 + toc  ;
    
    
    cla ;
    plot3( x(:,1) , x(:,2) , x(:,3) , '.' , 'Color' , 'blue' ) ;
    grid on ;
    hold on ;
    plot3( mc(1) , mc(2) , mc(3) , '+' , 'Color' , 'red' ) ;
    xlim([-lm lm]) ;
    ylim([-lm lm]) ;
    zlim([-lm lm]) ;
    drawnow;
    pause(0.0);
    
end

disp('========================') ;
disp('step 1:') ;
disp( clock1 / steps ) ;

disp('step 2:') ;
disp( clock2 / steps ) ;

end

