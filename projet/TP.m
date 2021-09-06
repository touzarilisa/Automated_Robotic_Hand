clear all; close all; clc;

% Question 1
% r=5*pi/(3*1024);
% q=r*(step-offset);

%Question 3
%r=5*pi/(3*1024);
%p=(q/r)+ offset;

%Question 5
a=step2angle(512,0)
b=step2angle(1024,512)
c=angle2step(150,0)
d=angle2step(150,512)

%% Question 6
R1=create_robot(0.2);
vitesse = 5;
R1.setSpeed(vitesse);

%% Question 6(a)
R1.setPosition(300);
[q0,t0]=R1.setPosition(700,1);

plot(t0,q0,'r');
title('position du moteur exprime en pas moteur en fonction du temps')
xlabel('axe des temps') 
ylabel('axe des positions') 
savefig('PAS.fig')

r=step2angle(q0,0);
plot(t0,r,'r');
title('position du moteur exprime en radian en fonction du temps')
xlabel('axe des temps') 
ylabel('axe des positions')
savefig('RADIAN.fig')
%% Question 6(b)
vitesse=[ 3  6  9 ];

 R1.setSpeed(vitesse(1));   
 R1.setPosition(300);
 [q1,t1]=R1.setPosition(700);
 plot(t1,q1);
 savefig('vitesse=3.fig')
 title('position du moteur exprimé en pas moteur en fonction du temps')
 xlabel('axe des temps') 
 ylabel('axe des positions')
 
 R1.setSpeed(vitesse(2));   
 R1.setPosition(300);
 [q2,t2]=R1.setPosition(700);
 plot(t2,q2);
 savefig('vitesse=6.fig')
 title('position du moteur exprimé en pas moteur en fonction du temps')
 xlabel('axe des temps') 
 ylabel('axe des positions')
 
 R1.setSpeed(vitesse(3));   
 R1.setPosition(300);
 [q3,t3]=R1.setPosition(700);
 plot(t3,q3);
 savefig('vitesse=9.fig')
 title('position du moteur exprimé en pas moteur en fonction du temps')
 xlabel('axe des temps') 
 ylabel('axe des positions')
 

%% Question 6(c)
%la vitesse correspond à la pente de notre droite
%pas pas seconde
v_5=(q0(length(q0))-q0(1))/(t0(length(t0))-t0(1))
v_3=(q1(length(q1))-q1(1))/(t1(length(t1))-t1(1))
v_6=(q2(length(q2))-q2(1))/(t2(length(t2))-t2(1))
v_9=(q3(length(q3))-q3(1))/(t3(length(t3))-t3(1))

%tours par minute
vt_5=v_5*60/1024
vt_3=v_3*60/1024
vt_6=v_6*60/1024
vt_9=v_9*60/1024

%% Question 6(d)
%entre chaque pas qi et qi-1 on calcul la vitesse vi=(qi-qi-1)/ti
for i =2:1:length(q0)
    vi(i-1)=(q0(i)-q0(i-1))/(t0(i)-t0(i-1));
   
end
for i =2:1:length(q1)
v1i(i-1)=(q1(i)-q1(i-1))/(t1(i)-t1(i-1));
   
end
for i =2:1:length(q2)
   v2i(i-1)=(q2(i)-q2(i-1))/(t2(i)-t2(i-1));
end
for i =2:1:length(q3)
 v3i(i-1)=(q3(i)-q3(i-1))/(t3(i)-t3(i-1));
end
 
vi=[0, vi];
v1i=[0, v1i];
v2i=[0, v2i];
v3i=[0, v3i];

plot(t0,vi,'r');
title('vitesse du moteur en fct du temps')
xlabel('axe des temps') 
ylabel('axe des vitesses')

plot(t1,v1i,'r');
title('vitesse du moteur en fct du temps')
xlabel('axe des temps') 
ylabel('axe des vitesses')

plot(t2,v2i,'r');
title('vitesse du moteur en fct du temps')
xlabel('axe des temps') 
ylabel('axe des vitesses')

plot(t3,v3i,'r');
title('vitesse du moteur en fct du temps')
xlabel('axe des temps') 
ylabel('axe des positions')
%% Question 7
l=[0.1, 0.08, 0.12]
R3=create_robot(l);
%% Question 9(a)
qi=[pi/2,0,0];
T=mod_geo_dir_3Rplan(l,qi)
%% Question 9(b)
qi=[pi/4,0,0];
a=angle2step(qi,512)
R3_v1=create_robot(l);
vitesse = 3;
R3_v1.setSpeed(vitesse);

[q,t]=R3_v1.setPosition(a,1)
V=step2angle(R3_v1.getPosition(),512);

Theorie_v1=mod_geo_dir_3Rplan(l,qi)
Reel_v1=mod_geo_dir_3Rplan(l,V)


qi=[pi/4,0,0];
a=angle2step(qi,512)
R3_v2=create_robot(l);
vitesse = 6;
R3_v2.setSpeed(vitesse);

[q,t]=R3_v2.setPosition(a,1)
V=step2angle(R3_v2.getPosition(),512);

Theorie_v2=mod_geo_dir_3Rplan(l,qi)
Reel_v2=mod_geo_dir_3Rplan(l,V)



%% Question 11
target=[0.2,0.2,pi/6];
[x,y] = mod_geo_inv_3Rplan(l, target)

x=angle2step(x,512)
R3.setPosition(x);
a=R3.getPosition()

y=angle2step(y,512)
R3.setPosition(y);
b=R3.getPosition()
% %%Question 12==========================================================
%tester la fonction limit
% pos=[pi -3*pi/2  pi/4]
% n_pos=limit(pos,-pi/2,pi/2)

% %======================================================================
% % Géneration de trajectoire 
% % Espace articulaire=====================================================
% % tracer une lettre ====================================================

  Target=[0.24,0,pi/4] % definir target finale
  [qa1,qb1]=mod_geo_inv_3Rplan(l,Target);
  qc1=choose(qa1,qb1);
  new_qc1=limit(qc1,-pi/2,pi/2);
  for i=0.1:0.1:1 %interpolation  
   new_qc1_int=i*new_qc1;
    Qc1= angle2step(new_qc1_int,512);    %conversion angle-pas
  R3.setPosition(Qc1,1);     %vers la position init 
  end
  Target2=[0.24,-0.1,-pi/4] % definir target finale
  [qa2,qb2]=mod_geo_inv_3Rplan(l,Target2);
  qc2=choose(qa2,qb2);
  new_qc2=limit(qc2,-pi/2,pi/2);
  for i=0.1:0.1:1 %interpolation  
   new_qc2_int=i*new_qc2;
    Qc2= angle2step(new_qc2_int,512);    %conversion angle-pas
  R3.setPosition(Qc2,1);     %vers la position init 
  end
% Espace Operationel=====================================================
% tracer de la lettre E =================================================
% 
% for i=0:0.01:0.1 %interpolation 
%   target1=[0.24,i,pi/4]; % definir target finale
% [qa1,qb1]=mod_geo_inv_3Rplan(l,target1);
% qc1=choose(qa1,qb1)
% new_qc1=limit(qc1,-pi/2,pi/2);      %limiter les depacements angulaires
%     Qc1= angle2step(new_qc1,512);    %conversion angle-pas
%   R3.setPosition(Qc1,1);     %vers la position init 
% 
% end

% for i=0:0.01:0.07 %interpolation 
%   target1=[0.24+i,0.1,pi/8]; % definir target finale
% [qa1,qb1]=mod_geo_inv_3Rplan(l,target1);
% qc1=choose(qa1,qb1);
% new_qc1=limit(qc1,-pi/2,pi/2);      %limiter les depacements angulaires
%     Qc1= angle2step(new_qc1,512);    %conversion angle-pas
%   R3.setPosition(Qc1,1);     %vers la position init 
% 
% end
% for i=0:0.01:0.05 %interpolation 
%   target1=[0.24,0.1-i,pi/4]; % definir target finale
% [qa1,qb1]=mod_geo_inv_3Rplan(l,target1);
% qc1=choose(qa1,qb1);
% new_qc1=limit(qc1,-pi/2,pi/2);      %limiter les depacements angulaires
%     Qc1= angle2step(new_qc1,512);    %conversion angle-pas
%   R3.setPosition(Qc1,1);     %vers la position init 
% 
% end
% for i=0:0.01:0.05 %interpolation 
%   target1=[0.24+i,0.05,pi/12]; % definir target finale
% [qa1,qb1]=mod_geo_inv_3Rplan(l,target1);
% qc1=choose(qa1,qb1);
% new_qc1=limit(qc1,-pi/2,pi/2);      %limiter les depacements angulaires
%     Qc1= angle2step(new_qc1,512);    %conversion angle-pas
%   R3.setPosition(Qc1,1);     %vers la position init 
% 
% end

R3.setPosition([0,0,0])