% 14.To determine symmetric difference of two sets. 

symmetric_difference(L1,L2,L3):-union(L1,L2,L4),intersection(L1,L2,L5),subtract(L4,L5,L3).