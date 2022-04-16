-module(db).

-export([
  init/0,
  write/2,
  read/2
]).

-include_lib("erlgame/include/macros.hrl").
-include_lib("erlgame/include/records.hrl").

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

