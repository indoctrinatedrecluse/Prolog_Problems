% 3.To remove duplicate elements from a list using accumulator.

remove_duplicate(L,Result):- rem_acc(L,[],Result1), reverse(Result1, Result). % initialize accumulator with empty list
rem_acc([],Acc,Acc):- !. % return accumulator when parent list is empty
rem_acc([H|T],Acc,Result):- member(H,Acc), !, rem_acc(T,Acc,Result). % If currently in Accumulator, don't add
rem_acc([H|T],Acc,Result):- rem_acc(T,[H|Acc],Result). % Else add it to accumulator