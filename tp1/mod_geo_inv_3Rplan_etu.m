function [q1,q2] = mod_geo_inv_3Rplan(robot,x,y,theta)
% MOD_GEO_INV_3RPLAN retourne les configurations du robot correspondant
% à une position cartésienne 'x', 'y' et à une orientation 'theta' dans le plan
%   [q1,q2] = mod_geo_inv_3Rplan(robot,x,y,theta)


q1 = zeros(3,1);
q2 = zeros(3,1);

l1=robot.T(1);
l2=robot.T(2);
l3=robot.T(3);

w1=x-l3*cos(theta);
w2=y-l3*sin(theta);

cq2=(w1*w1+w2*w2-l1*l1-l2*l2)/(2*l1*l2);

if abs(cq2)>1.0 
    cq2=sign(cq2);
end

sqa2=sqrt(1.0-cq2*cq2);
q1(2)=atan2(sqa2, cq2);

sqb2=-sqa2;
q2(2)=atan2(sqb2, cq2);

k1a=l1+l2*cos(q1(2));
k2a=l2*sin(q1(2));
cqa1 =(w1*k1a + w2*k2a)/(k1a*k1a + k2a*k2a);
sqa1 = (w1*k2a + w2*k1a)/(k1a*k1a + k2a*k2a);
q1(1)=atan2(sqa1,cqa1);

k1b = l1 + l2*cos(q2(2));
k2b = l2*sin(q2(2));
cqb1 = (w1*k1b + w2*k2b)/(k1b*k1b+k2b*k2b);
sqb1 = (-w1*k2b + w2*k1b)/(k1b*k1b+k2b*k2b);
q2(1)= atan2(sqb1, cqb1);

q1(3) = theta- q1(2) - q1(1);
q2(3) = theta- q2(2) - q2(1);




end