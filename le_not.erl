-module(le_not).
-export([
    make/2,
    reset/1
]).

-export([
    init/1,
    handle_message/2,
    terminate/1
]).


make(WireIn, WireOut) ->
    gen_proc:start(?MODULE, [WireIn,WireOut]).

reset(Not) ->
    gen_proc:send(Not, reset).


init([WireIn, WireOut]) ->
    LE_Not = self(),
    SignalSetter = fun(Signal) ->
        gen_proc:send(LE_Not, {set_pin, Signal})
    end,
    wire:add_reaction(WireIn, SignalSetter),
    #{
        out_signal => undefined,
        action => fun(Signal) ->
            wire:signal(WireOut, Signal)
        end
    }.


handle_message(
    {set_pin, false},
    #{out_signal := undefined, action := Action} = State
) ->
    Action(true),
    {ok, State#{out_signal => true}};
handle_message(
    {set_pin, true},
    #{out_signal := undefined, action := Action} = State
) ->
    Action(false),
    {ok, State#{out_signal => false}};


%handle_message({set_pin, true}, #{out_signal := undefined} = State) ->
%    {ok, State#{out_signal => {wait_pin, opposite_pin(Pin)}}};
handle_message(reset, State) ->
    {ok, State#{signal => undefined}}.

terminate(_) ->
    ok.

%opposite_pin(0) -> 1;
%opposite_pin(1) -> 0.
