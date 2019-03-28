use_module(library(clpfd)).
% % Problem 1: Pasaran Days
% The pasaran days are: pahing, pon, wage, kliwon, legi, respectively.

pasaran_day(0, pahing).
pasaran_day(1, pon).
pasaran_day(2, wage).
pasaran_day(3, kliwon).
pasaran_day(4, legi).

day(Today, N, NextDay):-
    N > 0,
    pasaran_day(X, Today), % X is number of today
    pasaran_day(Y, NextDay), % Y is number of nextday
    Y is (X+N-1) mod 5.

% Problem 2: Triangles
% Part 1: inverted triangle
inverttri(N) :- N > 0, count1(0, N), M is N-1, inverttri(M).
count1(X, Y) :- X < Y, write('*'), X1 is X+1, count1(X1,Y).
count1(X, Y) :- X >= Y, nl.

% Part 2
startri(N) :- C = 0, N > 0, count(0, C), C1 is C+1, startri_next(C1, N).
startri_next(C, X) :- C < X, count(0, C), C1 is C+1, startri_next(C1, X).
startri_next(C, X) :- C >= X.
count(X, Y) :- X =< Y, write('*'), X1 is X+1, count(X1,Y).
count(X, Y) :- X > Y, nl.

% Part 3
% Spasi diganti - karena tidak dapat ditampilkan di swi-prolog browser
tristar(N) :- tristar(N, N-1).
tristar(0, _) :- nl.
tristar(N, K) :- N > 0, N1 is N - 1,
                 foreach(between(1, N1, _), write('-')), 
                 Q is (K - N1) + 1,
                 foreach(between(1, Q, _), write('*')),
                 foreach(between(1, N1, _), write(' ')), 
                 nl, tristar(N1, K).

% Problem 3: The Long Travels
byCar(auckland,hamilton).
byCar(hamilton,raglan).
byCar(valmont,saarbruecken).
byCar(valmont,metz).

byTrain(metz,frankfurt).
byTrain(saarbruecken,frankfurt).
byTrain(metz,paris).
byTrain(saarbruecken,paris).

byPlane(frankfurt,bangkok).
byPlane(frankfurt,singapore).
byPlane(paris,losAngeles).
byPlane(bangkok,auckland).
byPlane(losAngeles,auckland).

% Part 1
travelable(X,Y) :- onestep(X,Y).
travelable(X,Y) :- onestep(X,Z), travelable(Z,Y).
onestep(X,Y) :- byCar(X,Y).
onestep(X,Y) :- byTrain(X,Y).
onestep(X,Y) :- byPlane(X,Y).

% Part 2
travelwhere(X,Y,go(X,Y)) :- onestep(X,Y).
travelwhere(X,Y,go(X,Z,Path)) :- onestep(X,Z), travelwhere(Z,Y,Path).

% Part 3
travelhow(X,Y,go(X,Y,Transport)) :- onestep(X,Y,Transport).
travelhow(X,Y,go(X,Z,Transport,Path)) :- onestep(X,Z,Transport), travelhow(Z,Y,Path).
onestep(X,Y,byCar) :- byCar(X,Y).
onestep(X,Y,byTrain) :- byTrain(X,Y).
onestep(X,Y,byPlane) :- byPlane(X,Y).

% Problem 4: Greatest Common Divisor
gcd(0, 0, _X) :- write('gcd error'),!.
gcd(0, X, X) :- !.
gcd(X, 0, X) :- !.
gcd(X, X, X) :- !.
gcd(M, N, X) :- N>M, Y is N-M, gcd(M, Y, X).
gcd(M, N, X) :- N<M, Y is M-N, gcd(Y, N, X).

% Problem 5: Favorite Meals 
:- op(650, xfx, suka).
alia suka mie.
alia suka bakso.
alia suka rendang.
alia suka eskrim.

bambang suka bakso.
bambang suka sate.
bambang suka coklat.
bambang suka eskrim.

caca suka sate.
caca suka mie.
caca suka bakso.
caca suka coklat.

dani suka bakso.
dani suka sate.
dani suka rendang.
dani suka eskrim.

:- op(600, xfy, dan).
X suka (A dan B) :-
    X suka A,
    X suka B.
    
% Problem 6: Happy Pi Day!
% The value of π can be determined by the series equation
% π=4∗(1-1/3+1/5−1/7+1/9−1/11+1/13…)
approxpi(0, 0).
approxpi(N, Approx):-
    N > 0,
    M is N-1,
    approxpi(M,Z),
    Tn is (4/(2*N-1)*(-1)**(1-N)),
    Approx is Tn+Z.