/* 4.
    Generate the combinations of K distinct objects chosen from the N elements of a list.
    In how many ways can a committee of 3 be chosen from a group of 12 people?
    We all know that there are C(12,3) = 220 possibilities
    (C(N,K) denotes the well-known binomial coefficients).
    For pure mathematicians, this result may be great.
    But we want to really generate all the possibilities (via backtracking).
    Example:
    ?-combination(3,[a,b,c,d,e,f],L).
    {L = [a,b,c]};
    {L = [a,b,d]};
    {L = [a,b,e]};
    ...
*/

combination(Length,List,Result):-
    split(List,_,SubList),
    length(SubList,Length),
    permute(SubList,Result).

split([ ],[ ],[ ]):-
    !.
split([H|T],[H|L],R):-
    split(T,L,R).
split([H|T],L,[H|R]):-
    split(T,L,R).

permute([ ],[ ]):-
    !.
permute(L,[X|R]):-
    select(X,L,M),
    permute(M,R).

select(H,[H|T],T):-
    !.
select(X,[H|L],[H|R]):-
    select(X,L,R).