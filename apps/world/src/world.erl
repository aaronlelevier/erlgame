-module(world).

-export([
  create_area/1,
  create_connection/1
]).

-include_lib("erlgame/include/records.hrl").

-define(DEFAULT_COUNT, 0).


%%%===================================================================
%% Functions
%%%===================================================================

%% Create

-spec create_area(reference()) -> #area{}.
create_area(Tab) ->
  % get area counter
  CountKey = {area, count},
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
  % create new area
  NewCount = Count+1,
  Area = #area{
    id=NewCount
  },
  % save new area to db
  true = db:write(Tab, Area),
  % save new count to db
  ets:insert(Tab, {CountKey, NewCount}),
  Area.

create_connection(M) ->
  {Area1, Area2} = maps:get("point", M),
  #connection{
    id=maps:get("id", M),
    point={
      Area1#area{connection = [Area2#area.id | Area1#area.connection]},
      Area2#area{connection = [Area1#area.id | Area2#area.connection]}
    },
    type=maps:get("type", M)
  }.


%%%===================================================================
%% Notes
%%%===================================================================

%% we want to code up how to go from 1 -> 2 -> 6 and how to get there programmatically

%% area

%% are these connected

%% connections

%% area has connections

%% all map keys are strings

%% atoms need to be json serialized to strings because they're used
%% by 'connection_type'


%%%===================================================================
%% References
%%%===================================================================

%% Reserved words
%% https://www.erlang.org/doc/reference_manual/introduction.html#reserved-words

%% Types and function specs
%% https://www.erlang.org/doc/reference_manual/typespec.html#type-declarations-of-user-defined-types

%% Erlang BIFs
%% https://www.erlang.org/doc/man/erlang.html