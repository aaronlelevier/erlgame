-module(db).

-export([
  init/0,
  write/2,
  read/2,
  get_count/2
]).

-include_lib("erlgame/include/macros.hrl").
-include_lib("erlgame/include/records.hrl").

-define(DEFAULT_COUNT, 0).

%%%===================================================================
%% DB
%%%===================================================================

-spec init() -> reference().
init() ->
  ets:new(?DEFAULT_TABLE, [set]).

-spec write(reference(), tuple()) -> true.
write(Tab, R) ->
  Key = {element(1,R), element(2,R)},
  ets:insert(Tab, {Key, R}).

-spec read(reference(), {atom(), integer()}) -> erlgame_type().
read(Tab, Key) ->
  [{Key, R}] = ets:lookup(Tab, Key),
  R.

-spec get_count(reference(), erlgame_type()) -> {CountKey, Count} when
  CountKey :: {erlgame_type(), count},
  Count :: integer().
get_count(Tab, Type) ->
  CountKey = {Type, count},
  Count = case ets:lookup(Tab, CountKey) of
            [] ->
              % initialize Mod counter to 0
              ets:insert(Tab, {CountKey, ?DEFAULT_COUNT}),
              ?DEFAULT_COUNT;
            [{_CountKey, CountValue}] ->
              % on first call this initializes the first row's
              % id to 1, db row's start with 1 not 0
              CountValue
          end,
  {CountKey, Count}.

