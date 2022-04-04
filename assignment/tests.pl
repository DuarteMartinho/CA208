member(1, tree(2, nil, nil)).
member(2, tree(2, nil, nil)).
member(1, tree(2, tree(1, nil, nil), nil)).

member(99, tree(5, 7, nil, nil, tree(8, nil, tree(12, nil, tree(13, nil, tree(14, nil, tree(15, nil, tree(99, nil, nil)))))))).


height(tree(nil, nil, nil, nil, nil), 0).
height(tree(nil, nil, nil), 0).
height(tree(nil, nil, nil, nil, nil), 1).
height(tree(nil, nil, nil), 1).

height(tree(2, 3, nil, nil, nil), 0).
height(tree(2, nil, nil), 0).
height(tree(2, 3, nil, nil, nil), 1).
height(tree(2, nil, nil), 1).
height(tree(5, 7, tree(2, nil, nil), nil, nil), H).
height(tree(5, 7, tree(2, tree(1, nil, nil), nil), tree(6, nil, nil), nil), H).
height(tree(5, 7, tree(2, tree(1, nil, nil), nil), tree(6, nil, nil), tree(9, nil, tree(13, nil, tree(19, nil, nil)))), H).
height(tree(3, 10, tree(1, nil, nil), tree(5, nil, nil), tree(100, nil, nil)), H).


add(1, tree(3, 4, nil, nil, nil), tree(3, 4, tree(1, nil, nil), nil, nil)).
add(9, tree(3, 4, tree(1, nil, nil), nil, nil), tree(3, 4, tree(1, nil, nil), nil, tree(9, nil, nil))).
add(5, tree(3, 7, tree(1, nil, nil), nil, tree(9, nil, nil)), tree(3, 7, tree(1, nil, nil), tree(5, nil, nil), tree(9, nil, nil))).
add(11, tree(3, 7, tree(1, nil, nil), nil, tree(9, nil, nil)), tree(3, 7, tree(1, nil, nil), tree(5, nil, nil), tree(9, nil, tree(11, nil, nil)))).


prettyPrint(tree(3, tree(1, nil, nil), tree(5, nil, nil))).
prettyPrint(tree(5, 10, tree(1, nil, nil), tree(7, tree(5, nil, nil), tree(8, nil, nil)), tree(18, nil, nil))).
prettyPrint(tree(4, 10, tree(2, tree(1, nil, nil), tree(3, nil, nil)), tree(6, tree(5, nil, nil), tree(9, nil, nil)), tree(15, tree(12, nil, nil), tree(20, tree(18, nil, nil), tree(28, nil, nil))))).