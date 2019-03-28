addone([],[]).
addone([H1|T1],[H2|T2]) :- var(H2), H2 is H1+1, addone(T1, T2).
addone([H1|T1],[H2|T2]) :- var(H1), H1 is H2-1, addone(T1, T2).

sameElemList([]).
sameElemList([_]).
sameElemList([X,X|T]) :- sameElemList([X|T]).

scalarMult(_, [], []) :- !.
scalarMult(S, [R|Rs], [R1|A]) :-
    R1 is S * R,
    scalarMult(S, Rs, A).

add([], [], []).
add([_|T1], [_|T2], _) :- T1 = [], T2 \= [], write('Dimension error').
add([_|T1], [_|T2], _) :- T1 \= [], T2 = [], write('Dimension error').
add([H1|T1], [H2|T2], [Result|A]) :-
    Result is H1 + H2,
    add(T1, T2, A).

dot([], [], 0).
dot([_|T1], [_|T2], _) :- T1 = [], T2 \= [], write('Dimension error'),!.
dot([_|T1], [_|T2], _) :- T1 \= [], T2 = [], write('Dimension error'),!.
dot([H1|T1], [H2|T2], Result) :- 
    Prod is H1 * H2,
    dot(T1, T2, Remaining),
    Result is Prod + Remaining.