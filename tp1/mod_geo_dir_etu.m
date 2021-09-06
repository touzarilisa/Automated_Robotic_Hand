function [TH1, TH1p] = mod_geo_dir_etu(robot,segment)
% MOD_GEO_DIR retourne les matrices de transformation homogène associées au
% corps 'segment' d'un robot 'robot'
%   [TH1, TH1p] = mod_geo_dir(robot,segment)

TH1 = eye(4);
TH1p = eye(4);
for i=1:segment
    
    TH1p = trans_homogene_etu(rotation_Z_etu(robot.q(i)),zeros(3,1))*TH1
    TH1 = trans_homogene_etu(eye(3),[robot.T(i);0;0])*TH1p
    
end 

end
