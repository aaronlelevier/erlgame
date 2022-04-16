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
  {CountKey, Count} = db:get_count(Tab, area),
  % save new area to db
  NewCount = Count+1,
  Area = #area{id=NewCount},
  true = db:write(Tab, Area),
  % update counter
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