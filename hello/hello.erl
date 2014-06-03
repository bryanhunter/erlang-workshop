-module(hello).

-export([say_hello/1]).

say_hello(Name) ->
    %boo(),
    case Name of
	joe -> io:format("Hello Joe. Hello Mike. Hello Robert.~n");
	_ -> io:format("Hello ~s from your friends at ~p.~n", [Name, node()])
    end.

boo() ->
    io:format("Booooo!~n").






% For distributed fun...
% cd("c:/code/erlang-workshop/hello")
% nl(hello).
% rpc:call(node(), hello,say_hello, ["Joe"]).
% [rpc:call(Node, hello,say_hello, ["Joe"]) || Node <- nodes()].
