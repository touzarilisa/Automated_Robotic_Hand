function new_pos = limit(pos,val_min,val_max)
% LIMIT limite la valeur de position "pos" entre ses valeurs
% minimales et maximales autoris�es par la g�om�trie du 
% robot
% 
% pos = limit(pos,val_min,val_max);
if (pos(1) <= val_min)
new_pos(1) =val_min;

elseif  (pos(1)>= val_max) 
 new_pos(1) =val_max;
else 
     new_pos(1)= pos(1); 
end

if (pos(2) <= val_min)
new_pos(2) =val_min;

elseif  (pos(2)>= val_max) 
 new_pos(2) =val_max;
else 
     new_pos(2)= pos(2); 
end

if (pos(3) <= val_min)
new_pos(3) =val_min;

elseif  (pos(3)>= val_max) 
 new_pos(3) =val_max;
else 
     new_pos(3)= pos(3); 
end
end