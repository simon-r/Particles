function [ r ] = my_pdist( X , dist_f )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

sX = size(X) ;

tmsize = ( sX(1) - 1 ) * sX(1) / 2 ;

r = set_array( zeros( tmsize , sX(2) ) ) ;

ir = 1 ;
for i=1:(sX(1)-1)
    pr = dist_f( X(i,:) , X( (i+1):sX(1) , : ) ) ;
    spr = size(pr,1) ;
    r( ir:(ir+spr-1) , : ) = pr ;
    ir = ir + spr ;
end

end

