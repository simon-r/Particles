function [ r ] = dist_uvect( x1 , x2 )

x1 = repmat( x1 , size(x2,1) , 1 ) ;

x2mx1 = x2 - x1 ;
nrm =  sqrt( sum( x2mx1.^2 , 2 ) ) ;

r = set_array( zeros( size(x2) ) ) ;

for i=1:size(x2mx1,2)
    r(:,i) = x2mx1(:,i) ./ nrm ;
end

end

