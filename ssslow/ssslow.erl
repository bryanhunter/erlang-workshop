-module(ssslow).

-export([do_work/1]).

do_work(MaxNumber) ->
    bad_fib(MaxNumber).
    %tail_recursive_fib(MaxNumber).


%% Excerpt from: http://www.erlang.org/doc/efficiency_guide/listHandling.html
%%
%% Lists can only be built starting from the end and attaching list elements
%% at the beginning. If you use the ++ operator like this:
%% List1 ++ List2
%% you will create a new list which is copy of the elements in List1, followed
%% by List2. Looking at how lists:append/1 or ++ would be implemented in plain
%% Erlang, it can be seen clearly that the first list is copied:
%%
%% append([H|T], Tail) ->
%%    [H|append(T, Tail)];
%% append([], Tail) ->
%%    Tail.
%% So the important thing when recursing and building a list is to make sure
%% that you attach the new elements to the beginning of the list, so that you
%% build a list, and not hundreds or thousands of copies of the growing result
%% list.


bad_fib(N) ->
    bad_fib(N, 0, 1, []).

bad_fib(0, _Current, _Next, Fibs) ->
    Fibs;
bad_fib(N, Current, Next, Fibs) ->
    bad_fib(N - 1, Next, Current + Next, Fibs ++ [Current]).


tail_recursive_fib(N) ->
    tail_recursive_fib(N, 0, 1, []).

tail_recursive_fib(0, _Current, _Next, Fibs) ->
    lists:reverse(Fibs);
tail_recursive_fib(N, Current, Next, Fibs) ->
    tail_recursive_fib(N - 1, Next, Current + Next, [Current|Fibs]).



%%  eprof:start().
%%  eprof:profile(fun () -> ssslow:do_work(5000) end).
%%  eprof:analyze().
%%  eprof:stop().
