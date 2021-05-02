/* 8.
    Tower of Hanoi Problem:
    The tower of Hanoi is a game played with three poles and a set of N discs.
    The discs are graded in diameter, and fit onto the poles by means of a hole cut through the center of each disc.
    Initially all the discs are on the left-hand pole.
    The object of the game is to move all the discs onto the center pole.
    The right-hand pole can be used as a “spare” pole, temporary resting place for discs.
    Each time a disc is moved from one pole to another, two constraints must be observed:
        only the top disc on a pole can be moved,
        and no disc may be placed on top of a smaller one.
    Write Prolog program to:
        enumerate the moves to transfer N discs from the left-hand pole to the center pole.
*/

/* The goal of the recursion essentially is to, in a bottom up fashion:
        
    Move everything on top of the bottom disc to the swap (which is the recursive step)
    Move the bottom disc to the goal
    Move everything else from the swap to the goal
*/

move([Disc],X,_,Y) :-  
    format("Move disk ~w from ~w to ~w\n", [Disc, X, Y]).
move([Bottom|Rest],Start,Swap,Goal) :- 
    move(Rest,Start,Goal,Swap), 
    move([Bottom],Start,_,Goal),
    move(Rest,Swap,Start,Goal).

% order is bottom to top. Test with move([biggest,middle,smallest],left,center,right).