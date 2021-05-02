/* 10. In a lost-world language, a poem can have any number of verses, each of which takes the following form:
    A      B      B      C
    D      E      E       C
    F       F      G
    H      I        I        C
where the same letter represents rhymed words.
For example,
    anun kura tama su
    unuri bimo co kuru
    sonen ariten sicom
    kana te shime xanadu.
Design a database to store a number of lost-world words and write a Prolog program to produce a poem for a given number ofverses.
*/

singlet(anun).
singlet(unuri).
singlet(sicom).
singlet(kana).

doublet(kura,tama).
doublet(bimo,co).
doublet(sonen,ariten).
doublet(te,shime).
doublet(su,kuru).
doublet(kuru,shanadu).
doublet(su,xanadu).

pairwise_doublet(X,Y):-
    doublet(X,Y).
pairwise_doublet(X,Y):-
    doublet(Y,X).

triplet(su,kuru,xanadu):-!. 

% this is just a template pass to random solution generator
pairwise_doublet_list([X,Y]):- doublet(X,Y).
pairwise_doublet_list([X,Y]):- doublet(Y,X).

randomly_select(List,Element):-
   length(List,Length),
   MaxIndex is Length-1,
   random_between(0,MaxIndex,Index),
   nth0(Index,List,Element).
% acts like seed for random
random_solution(Goal,Element):-
   bagof(X,call(Goal,X),Bag),
   randomly_select(Bag,Element).

random_singlet(X):-
    random_solution(singlet,X).
random_doublet(X,Y):-
    random_solution(pairwise_doublet_list,[X,Y]).

generate_poem([],0).
generate_poem([[A,B,C,D],[G,H,I,E],[J,K,L],[M,N,O,F]|Rest],Verses):- 
   Verses>0,
   random_singlet(A),
   random_doublet(B,C),
   triplet(D,E,F),
   random_singlet(G),
   random_doublet(H,I),
   random_doublet(J,K),
   random_singlet(L),
   random_singlet(M),
   random_doublet(N,O),
   Verse_next is Verses-1,
   generate_poem(Rest,Verse_next).

print([]) :- !.
print([[A,B,C,D]|Rest]) :-
  !,
  format("~a ~a ~a ~a~n",[A,B,C,D]),
  print(Rest).
print([[A,B,C]|Rest]) :-
  format("~a ~a ~a~n",[A,B,C]),
  print(Rest).