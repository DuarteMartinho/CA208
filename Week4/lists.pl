/* 
myElem(X,A)
This relation is true is X is an element of list A.
*/ 
myElem(X,[H|T]) :- X == H ; myElem(X,T). 

/* 
myHead(X,A)
This relation is true if X is the first element of list A.
*/ 
myHead(X, [H | _]) :- X == H.

/* 
myLast(X,A)
This relation is true if X is the last element of list A.
*/ 
myLast(X, [H | T]) :- X == H, T == [] ; myLast(X,T).

/* 
myTail(A,B)
This relation is true if list A is the tail of list B.
*/ 
myTail([_ | TA], [_ | TB]) :- TA == TB.

/* 
myAppend(A,B,C)
This relation is true if list C is list B appended to the end of list A.
*/
myAppend([], L, L).
myAppend([H|T], B, [H|L2]) :- myAppend(T, B, L2).

/* 
myReverse(A,B)
This relation is true if list A is the reverse of list B.
*/ 
myReverse([], []).
myReverse([H|T], B) :- myReverse(T, T1), myAppend(T1, [H], B).

/* 
myDelete(X,A,B)
This relation is true if list B is list A with the first occurrence of X removed. 
*/
myDelete(X, [X|T], T).
myDelete(X, [Y|T], [Y|L]) :- myDelete(X, T, L).