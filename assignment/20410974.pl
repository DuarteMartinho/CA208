/* CA208 Assignment 2 */

/* Student name: Duarte Martinho */
/* Student id: 20410974 */

/* ADD */
/* add(X, T1, T2) is true if adding X to the 2-3 Tree T1 generates the 2-3 Tree T2. */
add(X, nil, tree(X, nil, nil)) :- !.

add(X, tree(H11, H21, L1, M1, R1), tree(_, _, L2, M2, R2)) :-
   (
       X =< H11,
       add(X, L1, L2), 
       !
    ) ; (
        X > H11,
        X =< H21,
        add(X, M1, M2), 
       !
    ) ; (
        X > H21,
        add(X, R1, R2), 
       !
    ).

add(X, tree(H, L1, R1), tree(_, L2, R2)) :-
   (
       X =< H,
       add(X, L1, L2), 
       !
    ) ; (
        X > H,
        add(X, R1, R2), 
       !
    ).

/* MEMBER */
/* member(X, T) is true if X is in the 2-3 Tree T. */
member(X, tree(H1, H2, _, _, _)) :- X == H1, ! ; X == H2, !.
member(X, tree(H, _, _)) :- X == H, !.

member(X, tree(_, _, L, M, R)) :- member(X, L), ! ; member(X, M) ; member(X, R), !.
member(X, tree(_, L, R)) :- member(X, L), ! ; member(X, R), !.


/* HEIGHT */
/* height(T, N) is true if the height of T is N. */
max(V1, V2, V3, Max) :-
    (
        V1 > V2,
        V1 > V3,
        Max is V1
    ) ; (
        V2 > V1,
        V2 > V3,
        Max is V2
    ) ; (
        V3 > V1,
        V3 > V2,
        Max is V3
    ) ; (
        V1 == V1,
        V1 == V3,
        Max is V1
    ).

height(nil,0).
height(tree(nil, _, _), 0) :- !.
height(tree(H, nil, nil), 1) :- H \== nil, !.

height(tree(nil, nil, _, _, _), 0) :- !.
height(tree(H1, H2, nil, nil, nil), 1) :- H1 \== nil, H2 \== nil, !.

height(tree(_, L, R), H):-
  height(L, HL),
  height(R, HR),
  max(HL, HR, 0, MAX),
  H is 1 + MAX, !.

height(tree(_, _, L, M, R), H):-
  height(L, HL),
  height(M, HM),
  height(R, HR),
  max(HL, HM, HR, MAX),
  H is 1 + MAX, !.


/* PRETTYPRINT */
/* Inspiration taken from: http://users.utcluj.ro/~cameliav/lp/lab8.pdf */

myPrint(nil, C) :- printVal("nil", C).
myPrint(tree(H, L, R), C) :- COL is C + 1, myPrint(L, COL), printVal(H, C), myPrint(R, COL).
myPrint(tree(H1,H2, L, M, R), C) :- COL is C + 1, myPrint(L, COL), printVal2(H1, H2, C), myPrint(M, COL), myPrint(R, COL).

printVal(H, C) :- C > 0, !, COL is C - 1, write('\t'), printVal(H, COL).
printVal(H, _) :- write(H), nl.

printVal2(H1, H2, C) :- C > 0, !, COL is C - 1, write('\t'), printVal2(H1, H2, COL).
printVal2(H1, H2, _) :- write(H1), write(","), write(H2).

prettyPrint(T) :- myPrint(T, 0).