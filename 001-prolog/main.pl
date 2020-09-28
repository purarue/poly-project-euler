/* check if divisible by 3 or 5 */
in_set(N) :- 0 is N mod 3, !.
in_set(N) :- 0 is N mod 5.

/* divisible by 3 or 5 and within range */
meets_predicate(Num) :-
	between(2, 999, Num),
	in_set(Num).

/* find all items that match predicate and add them */
findsum(Result) :-
	findall(N, meets_predicate(N), AnsList),
	sumlist(AnsList, Result).

/* print to stdout */
main :-
	findsum(Result),
	format("~d", [Result]), nl.
