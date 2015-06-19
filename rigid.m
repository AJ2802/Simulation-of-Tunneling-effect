function dy = rigid(t,y)
dy=zeros(2,1);
dy(1)=y(2);
dy(2)=-2/5*y(1)^3+9/5*y(1);


end

