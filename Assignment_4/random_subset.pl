/* 2.
    Extract a given number of randomly selected elements from a list.
    The selected items shall be put into a result list.
    Example:
    ?-rnd_select([a,b,c,d,e,f,g,h],3,L).
    {L = [e,d,a]}.
    Hint: Use the built-in random number generator random/2 and the result of problem P1.
*/
:-ensure_loaded('remove_kth_element.pl').

rnd_select(List,0,[]):-
    !.
rnd_select(List,N,[X|Rest]):-
    length(List,Length),    
    random_between(1,Length,Result),
    remove_at(X,List,Result,R),
    N1 is N-1,
    !,
    rnd_select(R,N1,Rest).