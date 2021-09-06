function [H] = trans_homogene_etu(R,T)
% TRANS_HOMOGENE retourne la matrice de transformation homogene 3D
% correspondant à une rotation R et à une translation T successives. 

H = [R(1,:) T(1);
    R(2,:) T(2);
    R(3,:) T(3);
    0 0 0 1];

end