% Problem 1
triangle(X, Y, Z) :-
    X > 0, Y > 0, Z > 0,
    X + Y > Z,
    X + Z > Y,
    Y + Z > X.

% Problem 2
sum(0, X,_Y,_Z,X).
sum(1,_X, Y,_Z,Y).
sum(2,_X,_Y, Z,Z).
sum(3,X,Y,Z,Next):-
    Next is (3*X)+(2*Y)+Z.
sum(N,X,Y,Z,Next):-
    N > 3,
    NewN is N-1,
    W is (3*X)+(2*Y)+Z,
    sum(NewN,Y,Z,W,Next).

tribo(N,T):-
    sum(N,0,1,2,T).