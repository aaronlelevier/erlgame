-module(world).

-export([
  create_area/1,
  create_connection/1
]).

-include_lib("erlgame/include/records.hrl").


%%%===================================================================
%% Functions
%%%===================================================================

%% Create

%% creates a new 'area' entry in ETS with an id and returns the record
-spec create_area(ets:tab()) -> #area{}.
create_area(Ref) ->
  db:create(Ref, #area{}).

%% creates a new 'connection' entry in ETS with an id and returns the record
-spec create_connection(ets:tab()) -> #connection{}.
create_connection(Ref) ->
  db:create(Ref, #connection{}).


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