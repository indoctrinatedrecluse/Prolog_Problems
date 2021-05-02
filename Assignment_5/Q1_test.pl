convert_vars_to_template(X,L):-
    length(X,Length),
    prime(Length,Primer),
    distinct(comb_perm(Length,Primer,L)).

convert_template_to_boolean([],[]):-
    !.
convert_template_to_boolean([H|T],[true|T1]):-
    H>0,
    !,
    convert_template_to_boolean(T,T1).
convert_template_to_boolean([H|T],[true|T1]):-
    H>0,
    !,
    convert_template_to_boolean(T,T1).

comb_perm(N,List,Result) :-
    comb(N,List,Comb),
    permutation(Comb,Result).

comb(0,_,[]):-
    !.

comb(N,[X|T],[X|Comb]):-
    N>0,
    N1 is N-1,
    comb(N1,T,Comb).

comb(N,[_|T],Comb) :-
    N>0,
    !,
    comb(N,T,Comb).

prime(0,[]):-
    !.
prime(N,[1,0|L]):-
    N1 is N-1,
    prime(N1,L).

or_logic([X,Y],Result):-
    Result is X+Y,
    !.
or_logic([A|Rest],Result):-
    or_logic(Rest,Intermediate),
    !,
    Result is Intermediate+A.

or_wrapper(L,true):-
    or_logic(L,Res),
    Res>0,
    !.
or_wrapper(_,false):-
    !.

table(_,or(Vars)):-
    convert_vars_to_template(Vars,Template),
    %convert_template_to_boolean(Template,Vars_output),
    or_wrapper(Template,Result),
    format('~w -> ~w',[Template,Result]),nl,
    fail.