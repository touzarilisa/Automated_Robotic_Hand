% TP1 LU3MEE01
% 2.1) Construction et affichage d’un 3R plan
% ================================================================================================
% 1) declare_robot
% -----------------------------

n1=3
Trans1=[0.5,0.3,0.2]
q1=[pi/2,0,2]
r3 = declare_robot(n1,Trans1,q1)

n=4
Trans=[0.5,0.3,0.2,0.2]
q=[pi/3,pi/4,pi/5,pi/6]
r4 = declare_robot(n,Trans,q)

% 2) affiche_robot
% ----------------------------- 
affiche_robot(r3,1,1,1,[1,1,0],1) 
affiche_robot(r4,1,1,0,[0,0,1],1)
% 2.1) Construction et affichage d’un 3R plan

q1=[pi/2,0,0]
r3 = declare_robot(n1,Trans1,q1)
affiche_robot(r3,1,1,1,[1,1,0],1) 
% 2.2) Fonctionnalités élémentaires
% ================================================================================================



% 1) fonction matlab qui retourne une matrice de rotation d’un angle a autour de l’axe Z
Rot=rotation_Z_etu(r3.q(1))



% 2) fonction matlab qui retourne l’angle de rotation autour de l’axe Z à partir d’une matrice de 
%    rotation passée comme argument
a=inv_rotation_Z_etu(Rot)

% 3) fonction matlab qui retourne une matrice de transformation homogène correspondant à une
%    rotation R et à une translation T successives

Hom= trans_homogene_etu(Rot,Trans1)

% 2.3) Calcul du modèle géométrique direct et inverse
% ================================================================================================

% 1) fonction matlab qui retourne les matrices de transformation homogène
[Ths, Thsp]=mod_geo_dir_etu(r3,3)


% 2) Tester la fonction mod_geo_dir_etu() dans trois configurations particulières du robot 3
n1=3
Trans1=[0.5,0.3,0.2]
% 1ere configuration
q3_1=[0,0,0]
r3_1 = declare_robot(n1,Trans1,q3_1)
affiche_robot(r3_1,1,1,1,[1,1,0],1)
[Ths1, Thsp1]=mod_geo_dir_etu(r3_1,3)

% 2eme configuration
q3_2=[pi/2,0,0]
r3_2 = declare_robot(n1,Trans1,q3_2)
affiche_robot(r3_2,1,1,1,[1,1,0],1)
[Ths2, Thsp2]=mod_geo_dir_etu(r3_2,3)

% 3eme configuration
q3_3=[0,pi/2,0]
r3_3 = declare_robot(n1,Trans1,q3_3)
affiche_robot(r3_3,1,1,1,[1,1,0],1)
[Ths3, Thsp3]=mod_geo_dir_etu(r3_3,3)


% 3) écrire une fonction qui retourne les configurations du robot correspondant à une position 
%    cartésienne x, y et à une orientation theta dans le plan

% c'est la fonction [qA,qB] = mod_geo_inv_3Rplan_etu(robot,x,y,theta)

% 4) Vérifier pour un exemple trivial et un exemple non trivial
% -----------------------------
n=3
Tr=[0.5,0.3,0.2]
q=[pi/2,0,2]
r = declare_robot(n,Tr,q)

[qA1,qB1] = mod_geo_inv_3Rplan_etu(r,1.1,0,0)

[qA2,qB2] = mod_geo_inv_3Rplan_etu(r,0.7,0.2,pi/3)

% 5) Utiliser le modèle inverse pour la position [1.0 1.0]^T et l’orientation 3pi/2.
% -----------------------------

[qA3,qB3] = mod_geo_inv_3Rplan_etu(r,1.0,1.0,3*pi/2)
r = declare_robot(n,Tr,qA3)
[Ths, Thsp]=mod_geo_dir_etu(r,3)

% 3) Interpolation géométrique
% ================================================================================================

% 1) écrire les instructions permettant de rejoindre la cible en effectuant une interpolation 
%    sur 100 pas dans l’espace articulaire
n=3
T=[0.1,0.08,0.12]

x=0.2;
y=0.1;
o=pi/6;

r = declare_robot(n,T,[0,0,0]);
affiche_robot(r,1,1,1,[1,1,0],1)
[q1, q2] = mod_geo_inv_3Rplan_etu(r, x,y,o)

for i =0:0.01:1
    q=q1*i;
    r = declare_robot(n,T,q)
    
end

affiche_robot(r,1,1,0,[0,0,1],1)

% 2) avantages et inconvénients inhérents à cette manière d’interpoler ?
% 
%

% 3) écrire les instructions permettant de rejoindre la cible en effectuant une interpolation sur 
%    100 pas dans l’espace opérationnel
n=3
T=[0.1,0.08,0.12]


x=0.1;
y=0.1;
o=pi/6;

r = declare_robot(n,T,[0,0,0]);

[q1, q2] = mod_geo_inv_3Rplan_etu(r, x,y,o)
r = declare_robot(n,T,q1);
affiche_robot(r,0,1,1,[1,1,0],1)
for i =1:1:100
    x(i+1)=x(i)+0.001;
    y(i+1)=y(i)+0.001;
    o(i+1)= atan2(y(i+1)-y(i) ,x(i+1)-x(i))-o(i);
    [q1, q2] = mod_geo_inv_3Rplan_etu(r, x(i+1),y(i+1),o(i+1))
    r = declare_robot(n,T,q1)
    
end
affiche_robot(r,0,1,0,[0,0,1],1)


