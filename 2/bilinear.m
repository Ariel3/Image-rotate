function [ imr ] = bilinearInterpolation( im, theta )

theta= degtorad(theta);

if (~ismatrix(im))
    error('im should be a grayscale image (matrix)');
end

Y= size(im,1);
X= size(im,2);
diagonal_length= sqrt( (Y-1)^2 + (X-1)^2 );
imr= zeros(ceil(diagonal_length), ceil(diagonal_length));

Yr= size(imr,1);
Xr= size(imr,2);
mid_point= diagonal_length/2;

inv_rotation_matrix= [
    cos(theta) -sin(theta);...
    sin(theta) cos(theta);]';

for yr= 1:Yr
    for xr= 1:Xr

        % translate such that mid_point,mid_point will translate to 0,0
        yr_t= yr-mid_point;
        xr_t= xr-mid_point;
        
        % inv rotation & translation
        [xr_yr_t_invr_vec]= inv_rotation_matrix*[yr_t; xr_t];
        yr_t_invr= xr_yr_t_invr_vec(1)+mid_point-((Yr-Y)/2);
        xr_t_invr= xr_yr_t_invr_vec(2)+mid_point-((Xr-X)/2);
        y_u= floor(yr_t_invr); 
        x_u= ceil(xr_t_invr);
        y_d= ceil(yr_t_invr);
        x_d= floor(xr_t_invr);
       
        
        % compute new grayvalues from 4 bounding points
        if ( (y_u>=1)&&(y_u<=Y) && ...
             (y_d>=1)&&(y_d<=Y) && ...
             (x_u>=1)&&(x_u<=X) && ...
             (x_d>=1)&&(x_d<=X) )
            % y_u   a       b
            % y        *
            % y_d   c       d
            %      x_d x   x_u
            ag= im(y_u,x_d);
            bg= im(y_u,x_u);
            cg= im(y_d,x_d);
            dg= im(y_d,x_u);
            imr(yr,xr)= (x_u-xr_t_invr)*(y_d-yr_t_invr)*ag + (xr_t_invr-x_d)*(y_d-yr_t_invr)*bg + (yr_t_invr-y_u)*(x_u-xr_t_invr)*cg + (xr_t_invr-x_d)*(yr_t_invr-y_u)*dg;
        end
    end
    
end

