-module(db).

-export([
  init/0,
  write/2,
  read/2,
  record_to_proplist/1
]).

-include_lib("erlgame/include/records.hrl").


%%%===================================================================
%% DB
%%%===================================================================

init() ->
  ets:new(world, [set]).

write(Tab, R) ->
  Key = {element(1,R), element(2,R)},
  ets:insert(Tab, {Key, R}).

read(Tab, Key) ->
  [{Key, R}] = ets:lookup(Tab, Key),
  R.

%%%===================================================================
%% Helpers
%%%===================================================================

%% Converts a record to a proplist
%% credit: https://stackoverflow.com/a/3762102/1913888
record_to_proplist(#area{} = Rec) ->
  lists:zip(record_info(fields, area), tl(tuple_to_list(Rec)));
record_to_proplist(#connection{} = Rec) ->
  lists:zip(record_info(fields, connection), tl(tuple_to_list(Rec))).
