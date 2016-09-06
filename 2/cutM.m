function [m] = cutM( m )
[x y]=size(m);
bound=0;i=1;
while i<=x-bound
    
    if sum(m(i,:))==0
        m(i,:)=[];
        i=i-1;
        bound=bound+1;
    end
i=i+1;    
end
bound=0;j=1;
while j<=y-bound
    if sum(m(:,j))==0
        m(:,j)=[];
        bound=bound+1;
        j=j-1;    
    end
   j=j+1;
end
        
end

