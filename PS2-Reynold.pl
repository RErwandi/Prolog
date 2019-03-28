max3numbers(X,Y,Z):- X>=Y,X>=Z,write(X).
max3numbers(X,Y,Z):- Y>=X,Y>=Z,write(Y).
max3numbers(X,Y,Z):- Z>=X,Z>=Y,write(Z).

mypromise(N):- integer(N),N>0,write("I will study hard for the midterm"),nl,nextpromise(N).
nextpromise(N):- M is N-1,mypromise(M).

factorial(0, 1).
factorial(1, 1).
factorial(N, Factorial):- N>0,M is N-1,factorial(M,Z),Factorial is N*Z.

sumcube(0, 0).
sumcube(1, 1).
sumcube(N, Sum):- N>0, M is N-1, sumcube(M, Z), Sum is N**3+Z.

directTrain(forbach,saarbruecken).
directTrain(freyming,forbach).
directTrain(fahlquemont,stAvold).
directTrain(stAvold,forbach).
directTrain(saarbruecken,dudweiler).
directTrain(metz,fahlquemont).
directTrain(nancy,metz).

travelBetween(X,Y) :- directTrain(X,Y).
travelBetween(X,Y) :- directTrain(Y,X).
travelBetween(X,Y) :- directTrain(X,Z), travelBetween(Z,Y).
travelBetween(X,Y) :- directTrain(Z,X), travelBetween(Z,Y).