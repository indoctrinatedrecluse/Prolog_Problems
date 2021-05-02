% 5.To reverse a list using accumulator.

reverse([],[]):- !.
reverse([X],[X]):- !.
reverse(L,Result):- reverse_acc(L,[],Result), !.
reverse_acc([],Acc,Acc):- !.
reverse_acc([H|T],Acc,Result):- append([H],Acc,Acc1), reverse_acc(T,Acc1,Result).