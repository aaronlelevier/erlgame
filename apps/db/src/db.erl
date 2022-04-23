-module(db).

-export([
  init/0,
  write/2,
  create/2,
  update/2,
  read/2,
  next_id/2
]).

-include_lib("erlgame/include/macros.hrl").
-include_lib("erlgame/include/records.hrl").

-define(DEFAULT_COUNT, 1).

%%%===================================================================
%% DB
%%%===================================================================

-spec init() -> ets:tab().
init() ->
  ets:new(?DEFAULT_TABLE, [set]).


-spec write(ets:tab(), erlgame_type()) -> erlgame_type().
write(Tab, R) ->
  case ets:lookup(Tab, key(R)) of
    [] ->
      create(Tab, R);
    [{_Key, _Existing}] ->
      update(Tab, R)
  end.


-spec create(ets:tab(), erlgame_type()) ->  erlgame_type().
create(Tab, R) ->
  {Type, undefined} = key(R),
  Id = next_id(Tab, Type),
  R2 = Type:set_id(R, Id),
  % create R
  ets:insert(Tab, {key(R2), R2}),
  % inc counter
  ets:insert(Tab, {{Type, count}, Id}),
  R2.


update(Tab, R) ->
  ets:insert(Tab, {key(R), R}),
  R.


-spec read(ets:tab(), {atom(), integer()}) -> erlgame_type().
read(Tab, Key) ->
  [{Key, R}] = ets:lookup(Tab, Key),
  R.

%% Returns the id of the next ETS record to insert
-spec next_id(ets:tab(), erlgame_type()) -> integer().
next_id(Tab, Type) ->
  CountKey = {Type, count},
  case ets:lookup(Tab, CountKey) of
    [] ->
      % initialize Mod counter to 0
      ets:insert(Tab, {CountKey, ?DEFAULT_COUNT}),
      ?DEFAULT_COUNT;
    [{CountKey, CountValue}] ->
      % on first call this initializes the first row's
      % id to 1, db row's start with 1 not 0
      CountValue + 1
  end.


%%%===================================================================
%% Private
%%%===================================================================

key(R) -> {element(1,R), element(2,R)}.

