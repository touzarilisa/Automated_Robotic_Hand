function q = step2angle(step,offset)
% STEP2ANGLE convertit la valeur de pas moteur STEP en une valeur angulaire
% Q exprim�e en rad.
% OFFSET permet de sp�cifier � quelle valeur de pas moteur correspond la
% valeur angulaire 0.
% 
% q = step2angle(step,offset);

r=5*pi/(3*1024);
q=r*(step-offset);
end