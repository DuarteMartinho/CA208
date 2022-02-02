myElem(X,[H|T]) :- X == H ; myElem(X,T). 

myHead(X, [H | _]) :- X == H.

myLast(X, [H | T]) :- X == H, T == [] ; myLast(X,T).

myTail([_ | TA], [_ | TB]) :- TA == TB.

myAppend([], L, L).
myAppend([H|T], B, [H|L2]) :- myAppend(T, B, L2).

myReverse([], []).
myReverse([H|T], B) :- myReverse(T, T1), myAppend(T1, [H], B).

myDelete(X, [X|T], T).
myDelete(X, [Y|T], [Y|L]) :- myDelete(X, T, L).