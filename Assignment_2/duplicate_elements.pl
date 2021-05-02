/* 6. To duplicate the elements of a list.
Example:
?- duplicate([a,b,c,c,d],X).
{X = [a,a,b,b,c,c,c,c,d,d]}
*/

duplicate_elements([],[]).
duplicate_elements([H|T],[H|[H|T1]]):-duplicate_elements(T,T1).