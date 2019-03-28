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

% birth(X,Y) explains the birth year of person X.
birth(anya,1938). birth(benjamin,1929).

birth(clara,1959). birth(david,1950). 
birth(edward,1963).
birth(fiona,1965). birth(george,1962).

birth(hannah,1980). 
birth(ira,1982). birth(james,1979).
birth(kiana,1990). birth(lucas,1986).

birth(mike,1991). 
birth(nancy,1994). birth(oscar,1992).

birth(peter,2005). birth(quincy,2008).
birth(raymond,2013). birth(sarah,2015). birth(tina,2018).

birth(umberto,2016). birth(victoria,2019).

married(X,Y):-parent(X,Z),parent(Y,Z),X \= Y.
sibling(X,Y):- parent(Z,X),parent(Z,Y), X \== Y.
brother(X,Y):- sibling(X,Y),male(X), X \== Y.
sister(X,Y):- sibling(X,Y),female(X), X \== Y.
child(X,Y):- parent(Y,X).
daughter(X,Y):- female(X),child(X,Y).

% brother_in_law(X,Y) denotes that X is brother in law of Y
brother_in_law(X,Y):-married(X,Z),sister(Z,Y).
brother_in_law(X,Y):-brother(X,Z),married(Z,Y).
brother_in_law(X,Y):-married(X,Z),sister(Z,X),married(X,Y).
% sister_in_law(X,Y) denotes that X is sister in law of Y
sister_in_law(X,Y):-married(X,Z),brother(Z,Y).
sister_in_law(X,Y):-sister(X,Z),married(Z,Y).
sister_in_law(X,Y):-married(X,Z),brother(Z,X),married(X,Y).

% son_in_law(X,Y) denotes that X is son in law of Y
son_in_law(X,Y):-married(X,Z),daughter(Z,Y).
% daughter_in_law(X,Y) denotes that X is daughter in law of Y
daughter_in_law(X,Y):-married(X,Z),child(Z,Y),male(Z).

% father_in_law(X,Y) denotes that X is father in law of Y
father_in_law(X,Y):-(son_in_law(Y,X);daughter_in_law(Y,X)),male(X).
% mother_in_law(X,Y) denotes that X is mother in law of Y
mother_in_law(X,Y):-(son_in_law(Y,X);daughter_in_law(Y,X)),female(X).

% older(X,Y) denotes that X is older than Y
older(X,Y):-birth(X,Y1),birth(Y,Y2),Y2>Y1.
% younger(X,Y) denotes that X is younger than Y
younger(X,Y):-birth(X,Y1),birth(Y,Y2),Y1>Y2.

% xiaodidi(X,Y) denotes that X is younger brother of Y
xiaodidi(X,Y):-brother(X,Y),younger(X,Y).
% xiaomeimei(X,Y) denotes that X is younger sister of Y
xiaomeimei(X,Y):-sister(X,Y),younger(X,Y).