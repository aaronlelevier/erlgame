-module(db).

-export([
  init/0,
  write/2,
  read/2
]).

%%%===================================================================
%% DB
%%%===================================================================

init() ->
  ets:new(world, [set]).


write(Tab, R) ->
  Key = {element(1,R), element(2,R)},
  ets:insert(Tab, {Key, R})
.

read(Tab, Key) ->
  [{Key, R}] = ets:lookup(Tab, Key),
  R.

