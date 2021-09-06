function p = angle2step(q,offset)
% ANGLE2STEP convertit la valeur angulaire Q (rad) en une valeur de pas
% moteur P.
% OFFSET permet de sp�cifier � quelle valeur de pas moteur correspond la
% valeur angulaire 0.
% 
% p = angle2step(q,offset);

r=5*pi/(3*1024);
p=(q/r)+ offset;
end