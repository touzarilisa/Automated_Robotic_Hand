function [a] = inv_rotation_Z_etu(R)
% INV_ROTATION_Z retourne l'angle de rotation autour de l'axe Z à partir
% d'une matrice de rotation passée comme argument (et dont on suppose 
% qu'elle représente bien une rotation d'axe Z).
%   [a] = inv_rotation_Z(R)
a=acos((R(1,1)+R(2,2)+R(3,3)-1)/2)
end