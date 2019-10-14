%-------------------------------------------------------------------------
%    This code reads the computes the single-molecule trajectory
%      of overdamped Brownian motion on a fre-energy landscape
%               using the overdamped Langevin equation
%-------------------------------------------------------------------------

% ---- Thermal bath Parameters ----
kT=1; ga=[1 1]; diffu=kT./ga;
% ---- Simulation Parameters ----
dt=1.2e-3; Time=70;
NT=ceil(Time/dt); wn=[]; 

rng('shuffle'); wn(1,:)=sqrt(dt)*normrnd(0,1,[1,NT]);
rng('shuffle'); wn(2,:)=sqrt(dt)*normrnd(0,1,[1,NT]);
% ---- Potential parameters ----
A=1;B=1;U=1.7; height=3; fx=0;fy=0;
% ---- We need to declare the potential as a symbolic function 1st
syms yy xx;
fun=@(xx,yy) (xx-yy+U*((8/(pi^2))*(-cos(pi*(xx+yy))-(A/9)*cos(3*pi*(xx+yy))...
        -(B/25)*cos(5*pi*(xx+yy)))+1)/2);        
V=-height*cos(pi*fun(xx,yy))+fx*xx+fy*yy;
% ---- We now compute the derivatives of the potential
dVx=diff(V,xx); dVy=diff(V,yy);

% ---- We now convert the symbolic derivatives of the potential into
%matlabfunctions

FFx=matlabFunction(dVx); FFy=matlabFunction(dVy);
VV=matlabFunction(V);
% ---- Initialization of simulation ----
XX=zeros(2,NT+1);

XX(1,1)=floor(4*rand(1))+rand(1); %--- random initial position in x
XX(2,1)=floor(4*rand(1))+rand(1); %--- random initial position in y
Iden=eye(2,2);
for l=1:NT
    [Y] = Murayama2D(diffu,ga,dt,FFx(XX(1,l),XX(2,l)),FFy(XX(1,l),XX(2,l)),XX(:,l),wn(:,l));
    XX(:,l+1)=Y(:,1);
end

XX=real(XX);
TT=0:dt:Time;
if length(TT)<length(XX)
    TT=[TT TT(end)+dt];
else
end

