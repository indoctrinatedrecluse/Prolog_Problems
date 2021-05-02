% 14. To determine whether a list is a palindrome.
:- dynamic reverse_list/2.

is_palindrome_list(L):- reverse_list(L,L).