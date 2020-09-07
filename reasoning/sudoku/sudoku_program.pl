% Original https://www.metalevel.at/sudoku/sudoku.pl

:- use_module(library(clpfd)).
:- use_module(library(apply)).

pfx('sudoku:', '<http://josd.github.io/eye/reasoning/sudoku#>').

'<http://josd.github.io/eye/reasoning/sudoku#solve>'(Problem, Rows) :-
    problem(Problem, Rows),
    append(Rows, Vs),
    Vs ins 1..9,
    maplist(all_distinct, Rows),
    transpose(Rows, Columns),
    maplist(all_distinct, Columns),
    Rows = [A,B,C,D,E,F,G,H,I],
    blocks(A, B, C),
    blocks(D, E, F),
    blocks(G, H, I),
    once(maplist(label, Rows)).

blocks([], [], []).
blocks([A,B,C|Bs1], [D,E,F|Bs2], [G,H,I|Bs3]) :-
    all_distinct([A,B,C,D,E,F,G,H,I]),
    blocks(Bs1, Bs2, Bs3).

problem(1, [[8,_,_,4,_,5,_,_,_],
            [6,_,4,_,_,_,_,_,1],
            [_,_,_,_,1,_,_,_,2],
            [_,3,7,2,_,_,_,_,_],
            [_,_,_,_,5,1,_,_,9],
            [_,_,_,_,_,4,_,3,_],
            [9,_,2,_,_,8,1,_,7],
            [7,_,_,_,_,_,_,_,_],
            [_,_,1,_,_,2,_,_,_]]).

problem(2, [[4,_,_,_,_,8,5,_,_],
            [6,_,_,_,1,5,9,_,_],
            [5,_,1,_,_,_,_,_,_],
            [_,7,_,_,2,4,_,_,_],
            [_,_,_,_,_,_,_,9,_],
            [9,_,5,3,_,6,_,_,8],
            [3,_,_,_,_,_,_,8,7],
            [_,_,_,_,_,_,6,_,_],
            [_,9,6,_,_,_,4,_,1]]).

problem(3, [[8,5,_,_,_,2,4,_,_],
            [7,2,_,_,_,_,_,_,9],
            [_,_,4,_,_,_,_,_,_],
            [_,_,_,1,_,7,_,_,2],
            [3,_,5,_,_,_,9,_,_],
            [_,4,_,_,_,_,_,_,_],
            [_,_,_,_,8,_,_,7,_],
            [_,1,7,_,_,_,_,_,_],
            [_,_,_,_,3,6,_,4,_]]).

problem(4, [[_,_,_,_,_,6,_,_,_],
            [_,5,9,_,_,_,_,_,8],
            [2,_,_,_,_,8,_,_,_],
            [_,4,5,_,_,_,_,_,_],
            [_,_,3,_,_,_,_,_,_],
            [_,_,6,_,_,3,_,5,4],
            [_,_,_,3,2,5,_,_,6],
            [_,_,_,_,_,_,_,_,_],
            [_,_,_,_,_,_,_,_,_]]).
