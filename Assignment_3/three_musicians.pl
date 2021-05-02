/* 11.
    Three musicians of a multinational band take turns playing solo in a piece of music: each plays only once.
    The pianist plays first.
    John plays saxophone plays before the Australian.
    Mark comes from the United States and plays before the violinist.
    One soloist comes from Japan and one is Sam.
    Write a PROLOG program to find out who comes from which country, plays what instrument, and in which order.
*/

% find_details determines the overall solution set
find_details(S):-
    % just an encapsulator
	band_soloists(S),
    % The pianist plays first
    % X is a member of set S with order 1, X plays piano
	first(X,S),
    plays(X,piano),
    % John plays saxophone plays before the Australian
    % Y,Z are ordered members of S, Y is named John, Y plays saxophone, Z comes from Australia
	ordered_members(Y,Z,S), 
	named(Y,john),
    plays(Y,sax),
	resident(Z,australia),
    % Mark comes from the United States and plays before the violinist
    % Y1,Z1 are ordered members of S, Y1 is named Mark, Y1 comes from US, Z1 plays violin
	ordered_members(Y1,Z1,S),
	named(Y1,mark),
    resident(Y1,us),
    plays(Z1,violin),
    % One soloist comes from Japan and one is Sam
    % U is a member of S, U comes from Japan
    % V is a member of S, V is named Sam
	member(U,S),
    resident(U,japan),
	member(V,S),
    named(V,sam).
% encapsulator, with soloist(name, country, instrument) being the format
band_soloists(band(soloist(N1,C1,I1),soloist(N2,C2,I2),soloist(N3,C3,I3))):-!.
% first entity of a soloist is name
named(soloist(N,_,_),N):-!.
% next entity is country of residence
resident(soloist(_,C,_),C):-!.
% last entity is instrument
plays(soloist(_,_,I),I):-!.
% returns the first soloist in the band
first(X,band(X,_,_)):-!.
% all combinations of ordered members in a three member set
ordered_members(X,Y,band(X,Y,Z)).
ordered_members(X,Z,band(X,Y,Z)).
ordered_members(Y,Z,band(X,Y,Z)).
% all possible members in a three member set
member(X,band(X,Y,Z)).
member(Y,band(X,Y,Z)).
member(Z,band(X,Y,Z)).