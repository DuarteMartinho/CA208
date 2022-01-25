/* NORTH FACTS */
north(a, f).
north(f, k).
north(k, p).
north(b, g).
north(g, l).
north(l, 'q').
north(c, h).
north(h, 'm').
north('m', r).
north(d, i).
north(i, n).
north(n, 's').
north(e, j).
north(j, o).
north(o, t).

/* EAST FACTS */
east(a, b).
east(b, c).
east(c, d).
east(d,e).
east(f, g).
east(g, h).
east(h, i).
east(i, j).
east(k, l).
east(l, 'm').
east('m', n).
east(n, o).
east(p, 'q').
east('q', r).
east(r, 's').
east('s', t).

/* RELATIONSHIPS */
findNorth(X, N) :- north(N, X).
findNorth(X, Z) :- north(N, X), findNorth(N, Z).

findSouth(X, S) :- north(X, S).
findSouth(X, Z) :- north(X, S), findSouth(S, Z).

findWest(X, E) :- east(E, X).
findWest(X, Z) :- east(E, X), findWest(E, Z).

findEast(X, W) :- east(X, W).
findEast(X, Z) :- east(X, W), findEast(W, Z).

findNW(X, NW) :- findNorth(X, N), findWest(N, NW).
findNE(X, NE) :- findNorth(X, N), findEast(N, NE).
findSW(X, SW) :- findSouth(X, S), findWest(S, SW).
findSE(X, SE) :- findSouth(X, S), findEast(S, SE).

/*
This file creates a grid like shown below
a   b   c   d   e
f   g   h   i   j
k   l   m   n   o
p   q   r   s   t
*/