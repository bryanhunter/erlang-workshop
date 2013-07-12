-module(fizzbuzz3).

-export([playto/1]).

playto(Upper) ->
    [play(X, {X rem 3, X rem 5}) || X <- lists:seq(1,Upper)].

play(_, {0, 0}) -> 
    fizzbuzz;
play(_, {0, _}) ->
    fizz;
play(_, {_, 0}) ->
    buzz;
play(Number, _) -> 
    Number.
