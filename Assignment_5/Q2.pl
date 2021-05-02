/*  Truth tables for logical expressions (2).
    Continue problem P1by defining and/2, or/2, etc as being operators.
    This allows to write the logical expression in the more natural way, as in the example:
    A and (A or not B).
    Define operator precedence as usual, i.e., as in Java.
    Example:
    ?-table(A,B, A and (A or not B)).
        true true true
        true fail true
        fail true fail
        fail fail fail
*/
    
:- ensure_loaded('Q1.pl').

% copied this format from an Eclipse implementation on stackoverflow, cannot find the thread anymore :/
% used precedence format and values (0-1200) from https://www.swi-prolog.org/pldoc/man?predicate=op/3
:- op(50, fy, not).
:- op(100, yfx, and).
:- op(150, yfx, nand).
:- op(200, yfx, or).
:- op(250, yfx, nor).
:- op(300, yfx, impl).
:- op(350, yfx, equ).
:- op(400, yfx, xor).

% The meaning of this is that [not] binds stronger than [and, nand], which bind stronger than
% [or,nor], which in turn bind stronger than [implication, equivalence, xor].
% The precedence table is based on my intuition, have to cross check with JAVA.