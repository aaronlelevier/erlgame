-module(world).

-export([
  create_area/1,
  create_connection/1
]).

%%%===================================================================
%% Types
%%%===================================================================
-type connection_type() :: 'land' | 'road' | 'tunnel'.

%%%===================================================================
%% Records
%%%===================================================================
-record(area, {
  id :: integer(),
  connection = [] :: [integer()]
}).

-record(connection, {
  id :: integer(),
  point :: {#area{}, #area{}},
  type :: connection_type()
}).


%%%===================================================================
%% Functions
%%%===================================================================

%% Create

create_area(M) ->
  #area{
    id=maps:get("id", M)
  }.

create_connection(M) ->
  {Area1, Area2} = maps:get("point", M),
  #connection{
    id=maps:get("id", M),
    point= {
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


%%%===================================================================
%% References
%%%===================================================================

%% Reserved words
%% https://www.erlang.org/doc/reference_manual/introduction.html#reserved-words

%% Types and function specs
%% https://www.erlang.org/doc/reference_manual/typespec.html#type-declarations-of-user-defined-types
