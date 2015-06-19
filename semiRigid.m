function [ dy ] = semiRigid( t,y)
h=0.001;
dy=zeros(4,1);
[Hcl H sV0 sV1 sV2] = potential(y(1),y(2),y(3),y(4),h);
dy(1)=y(2);
dy(2)=-sV1;
dy(3)=-(y(3)^2-y(4)^2)-sV2;
dy(4)=-2*y(3)*y(4);



end

