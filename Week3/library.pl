/* FACTS */
book('illiad', 'homer', 'study', 500).
book('c', 'Richie', 'study', 150).
book('nt_bible', 'sams', 'reference', 480).
book('monty_python', 'cleese', 'comedy', 300).
book('Adventure', 'me', 'comedy', 500).

buildLibrary(Lib) :- findall(book(Title, Author, Genre, Size), book(Title, Author,
Genre, Size), Lib).
 
/* book(N, A, C, S) */
/* RULES */
isHoliday(book(_, _, C, S)):- not(C == 'study'), not(C == 'reference'), S < 400.
holiday(B, [B | _]) :- isHoliday(B).
holiday(B, [_ | T]) :- holiday(B, T).

isRevision(book(_, _, C, S)):- (C == 'study'; C == 'reference'), S > 300.
revision(B, [B | _]) :- isRevision(B).
revision(B, [_ | T]) :- revision(B, T).

isLiterary(book(_, _, C, _)):- (C == 'drama').
literary(B, [B | _]) :- isLiterary(B).
literary(B, [_ | T]) :- literary(B, T).

isLeisure(book(_, _, C, _)):- (C == 'comedy'; C == 'fiction').
leisure(B, [B | _]) :- isLeisure(B).
leisure(B, [_ | T]) :- leisure(B, T).
