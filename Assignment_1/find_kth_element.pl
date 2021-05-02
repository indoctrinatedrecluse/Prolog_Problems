/* 16. To find the K'th element of a list.
The first element in the list is number 1.
Example:
?- element_at(X,[a,b,c,d,e],3).
{X = c}
*/

find_kth_element(_,P,"Error"):-P=<0.
find_kth_element([X|_],1,X).
find_kth_element([Y|Rest],P,X):-Q is P-1,find_kth_element(Rest,Q,X).