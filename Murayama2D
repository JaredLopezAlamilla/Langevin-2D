function [Y] = Murayama2D(diffu,ga,dt,dVx,dVy,X,wn)

	Iden=eye(2,2);
	diffuX=diffu(1,1);gaX=ga(1,1);wnX=wn(1,1);
	diffuY=diffu(1,2);gaY=ga(1,2);wnY=wn(2,1);

	Y=Iden*X+[-dt/gaX 0;0 -dt/gaY]*[dVx; dVy]+...
	[sqrt(2*diffuX) 0;0 sqrt(2*diffuY)]*[wnX; wnY];

end
