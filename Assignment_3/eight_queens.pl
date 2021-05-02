/* 7. Eight Queens’ Problem:
    Eight Queens are to be placed in an 8x8 chess board such that no queens attack each other.
    Write a Prolog program to obtain solution(s) of Eight Queen Problem.
*/

eight_queen(L):- template(L), solution(L).

template([(1,Y1),(2,Y2),(3,Y3),(4,Y4),(5,Y5),(6,Y6),(7,Y7),(8,Y8)]):-
    !.

solution([]).
solution([(X,Y)|Rest]):-
    member(Y,[1,2,3,4,5,6,7,8]),
    solution(Rest),
    no_attack([(X,Y)],Rest).

no_attack(_,[]).
no_attack([(X,Y)],[(X1,Y1)|Rest]):-
    Y =\= Y1,
    (X-X1) =\= (Y-Y1),
    (X-X1) =\= (Y1-Y),
    no_attack([(X,Y)],Rest).

% N queen in label rendering format:

n_queen(N, L) :-
    queens(N, Result),
    create_template(Result, N, 1, L).

create_template([], _, _, []) :-
    !.
create_template([X|Rest], N, Cur, [(Cur,X)|Rest1]):-
    Cur=<N,
    Cur1 is Cur+1,
    !,
    create_template(Rest, N, Cur1, Rest1).

queens(N, Queens) :-
    length(Queens, N),
	board(Queens, Board, 0, N, _, _),
	queens(Board, 0, Queens).

board([], [], N, N, _, _).
board([_|Queens], [Col-Vars|Board], Col0, N, [_|VR], VC) :-
	Col is Col0+1,
	functor(Vars, f, N),
	constraints(N, Vars, VR, VC),
	board(Queens, Board, Col, N, VR, [_|VC]).

constraints(0, _, _, _) :- !.
constraints(N, Row, [R|Rs], [C|Cs]) :-
	arg(N, Row, R-C),
	M is N-1,
	constraints(M, Row, Rs, Cs).

queens([], _, []).
queens([C|Cs], Row0, [Col|Solution]) :-
	Row is Row0+1,
	select(Col-Vars, [C|Cs], Board),
	arg(Row, Vars, Row-Row),
	queens(Board, Row, Solution).