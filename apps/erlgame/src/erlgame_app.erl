%%%-------------------------------------------------------------------
%% @doc erlgame public API
%% @end
%%%-------------------------------------------------------------------

-module(erlgame_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    erlgame_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
