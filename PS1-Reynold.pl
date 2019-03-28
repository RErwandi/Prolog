% male(X) denotes that X is a male.
male(benjamin).
male(david). male(edward). male(george).
male(james). male(lucas). male(mike). male(oscar).
male(peter). male(raymond). male(umberto).
% female(X) denotes that X is female.
female(anya).
female(clara). female(fiona).
female(hannah). female(ira). female(kiana). female(nancy).
female(quincy). female(sarah). female(tina). female(victoria).
% parent(X,Y) denotes that X is one of Y's parent.
parent(anya,clara). parent(anya,edward). parent(anya,fiona).
parent(benjamin,clara). parent(benjamin,edward). parent(benjamin,fiona).
parent(clara,hannah). parent(clara,ira). parent(clara,lucas).
parent(david,hannah). parent(david,ira). parent(david,lucas).
parent(fiona,mike). parent(fiona,nancy).
parent(george,mike). parent(george,nancy).
parent(ira,peter). parent(ira,quincy).
parent(james,peter). parent(james,quincy).
parent(kiana,raymond). parent(kiana,sarah). parent(kiana,tina).
parent(lucas,raymond). parent(lucas,sarah). parent(lucas,tina).
parent(nancy,umberto). parent(nancy,victoria).
parent(oscar,umberto). parent(oscar,victoria).

married(X,Y):- parent(X,Z),parent(Y,Z), X \= Y.


grandchild(X,Y):- parent(Z,X),parent(Y,Z).
is_a_grandson(X):- male(X), grandchild(X,_).
is_a_granddaughter(X):- female(X), grandchild(X,_).

sibling(X,Y):- parent(Z,X),parent(Z,Y), X \== Y.
brother(X,Y):- sibling(X,Y),male(X), X \== Y.
sister(X,Y):- sibling(X,Y),female(X), X \== Y.

husband(X,Y):- male(X),married(X,Y).
wife(X,Y):- female(X),married(X,Y).
uncle(X,Y):- parent(Z,Y),brother(X,Z).
uncle(X,Y):- husband(X,P),sibling(P,Q),parent(Q,Y).
aunt(X,Y):- parent(Z,Y),sister(X,Z).
aunt(X,Y):- wife(X,P),sibling(P,Q),parent(Q,Y).

child(X,Y):- parent(Y,X).
son(X,Y):- male(X),child(X,Y).
daughter(X,Y):- female(X),child(X,Y).
is_a_nephew(X):- son(X,Z),sibling(Z,_).
is_a_niece(X):- daughter(X,Z),sibling(Z,_).
