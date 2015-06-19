function  dynamics( q,p,a,b )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

h=0.001;
m=1;
w=sqrt(9/5);
c=1/10;
d=1;

x = linspace(-3,3);
[Hcl H sV0 sV1 sV2] = potential(1,-1,1,1,h);
y1 = c*x.^4-1/2*m*w^2*x.^2;
y2 = Hcl;
y3 = H;

figure
plot(x,y3,'k-', x,y2,'b-',x,y1,'y.');
legend('expectation of Hamiltonian <H>','classical Hamiltonian Hcl','potential V','location','southeast')
str = sprintf('Potential wells diagram with h=%d and V=q^4/10-9q^2/10', h);
title(str);
xlabel('position q');
ylabel('Energy');


options = odeset('RelTol',1e-4,'AbsTol',[1e-4 1e-4]);
soptions = odeset('RelTol',1e-4,'AbsTol',[1e-4 1e-4 1e-4 1e-4]);
[T,Y]=ode45(@rigid,[0,100],[q,p],options);
[sT,sY]=ode45(@semiRigid,[0,100],[q,p,a,b],soptions );

figure
plot(sY(:,1),sY(:,2),'g.',Y(:,1),Y(:,2),'b--');
str = sprintf('Phase portrait with h= %d and H=p^2/2+q^4/10-9q^2/10', h);
title(str);
xlabel('position q');
ylabel('momentum p');
legend('semiclassical','classical','location','southeast')

figure
plot(sT,sY(:,1),'g.',T,Y(:,1),'b--');
str = sprintf('Time evolution of the position of the particle with h=%d and H=p^2/2+q^4/10-9q^2/10',h);
title(str);
xlabel('time t');
ylabel('position q');
legend('semiclassical','classical','location','southeast');

end

