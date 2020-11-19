-module(main).
-export([main/0]).

-define(MAX, 28123).

%% n is a factor of m
is_factor(M, N) ->
  M rem N == 0.

%% get the proper divisors of N
proper_divisors(N) -> proper_divisors(N div 2, 1, N, []).

%% M: max (dont have to calculate past this)
%% C: current value
%% N: number to calculate for
%% R: result (list)
proper_divisors(M, C, _, R) when C > M -> R;
proper_divisors(M, C, N, R) ->
  case is_factor(N, C) of
    true -> proper_divisors(M, C + 1, N, [C|R]);
    false -> proper_divisors(M, C + 1, N, R)
  end.


%% a number N is an abundant number if
%% the sum of the proper divisors for N
%% is larger than N
is_abundant(N) ->
  lists:sum(proper_divisors(N)) > N.

%% N: min, X: max (inclusive range) C: current
%% gets all abundant numbers in the given range
%% returns a set
abundant_range(N, X) -> abundant_range(N, X, N, []).
abundant_range(_, X, C, L) when C > X -> sets:from_list(L); %% base case
abundant_range(N, X, C, L) ->  %% recurse
    case is_abundant(C) of
      true -> abundant_range(N, X, C + 1, [C|L]);
      false -> abundant_range(N, X, C + 1, L)
    end.


%% check if N can be written as the abundant sum of
%% two numbers from S (set)
%% I: current number we're checking
is_sum_of_abundants(N, S) -> is_sum_of_abundants(N, S, sets:to_list(S)).
is_sum_of_abundants(_, _, []) -> false; %% base case
is_sum_of_abundants(N, S, [I|L]) ->
  case sets:is_element(N - I, S) of
    true -> true;
    false -> is_sum_of_abundants(N, S, L)  %% recurse
  end.


%% driver
main() ->
  AbundantSet = abundant_range(1, ?MAX),
  NotSumOfTwoAbundants = [Num || Num <- lists:seq(1, ?MAX), not is_sum_of_abundants(Num, AbundantSet)],
  io:fwrite("~p~n", [lists:sum(NotSumOfTwoAbundants)]).
