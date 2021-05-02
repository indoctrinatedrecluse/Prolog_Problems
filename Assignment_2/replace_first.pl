% 4. To replace the first occurrence of an element X in L with Y giving the result in L1.

replace_first(X,[],_,[]).
replace_first(X,[X|Rest],Y,[Y|Rest]):-!.
replace_first(X,[Z|Rest],Y,[Z|Rest1]):-replace_first(X,Rest,Y,Rest1).