-module(circuit_test).
-compile(export_all).

test_1() ->
    W1 = wire:make(),
    W2 = wire:make(),
    W3 = wire:make(),

    le_and:make(W1, W2, W3),

    wire:add_reaction(W3, fun(S) ->
        io:format("Result: ~p~n", [S])
    end),

    wire:signal(W1, true),
    wire:signal(W2, true).

test_2() ->
    W1 = wire:make(),
    W2 = wire:make(),
    W3 = wire:make(),

    le_and:make(W1, W2, W3),

    wire:add_reaction(W3, fun(S) ->
        io:format("Result: ~p~n", [S])
    end),

    wire:signal(W1, false),
    wire:signal(W2, true).

 test_3() ->
    W1 = wire:make(),
    W2 = wire:make(),

    le_not:make(W1, W2),

    wire:add_reaction(W2, fun(S) ->
        io:format("Result: ~p~n", [S])
    end),

    wire:signal(W1, true).

test_4() ->
    W1 = wire:make(),
    W2 = wire:make(),

    le_not:make(W1, W2),

    wire:add_reaction(W2, fun(S) ->
        io:format("Result: ~p~n", [S])
    end),

    wire:signal(W1, false).

test_5() ->
    W1 = wire:make(),
    W2 = wire:make(),
    W3 = wire:make(),

    le_or:make(W1, W2, W3),

    wire:add_reaction(W3, fun(S) ->
        io:format("Result: ~p~n", [S])
    end),

    wire:signal(W1, true),
    wire:signal(W2, true).

test_6() ->
    W1 = wire:make(),
    W2 = wire:make(),
    W3 = wire:make(),

    le_or:make(W1, W2, W3),

    wire:add_reaction(W3, fun(S) ->
        io:format("Result: ~p~n", [S])
    end),

    wire:signal(W1, true),
    wire:signal(W2, false).


test_7() ->
    W1 = wire:make(),
    W2 = wire:make(),
    W3 = wire:make(),

    le_or:make(W1, W2, W3),

    wire:add_reaction(W3, fun(S) ->
        io:format("Result: ~p~n", [S])
    end),

    wire:signal(W1, false),
    wire:signal(W2, true).

test_8() ->
    W1 = wire:make(),
    W2 = wire:make(),
    W3 = wire:make(),

    le_or:make(W1, W2, W3),

    wire:add_reaction(W3, fun(S) ->
        io:format("Result: ~p~n", [S])
    end),

    wire:signal(W1, false),
    wire:signal(W2, false).





