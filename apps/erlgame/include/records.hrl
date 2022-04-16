%%%-------------------------------------------------------------------
%%% @author Aaron Lelevier
%%% @doc
%%% @end
%%% Created : 14. Apr 2022 10:12 AM
%%%-------------------------------------------------------------------
-author("Aaron Lelevier").

-export_type([
  erlgame_type/0
]).

%%%===================================================================
%% Types
%%%===================================================================
-type connection_type() :: 'bridge' | 'tunnel'.

-type key_type() :: undefined | 'gate'.

%%%===================================================================
%% Records
%% erlgame_type/0 is the type for all record types, see below.
%%%===================================================================
-record(area, {
  id :: integer(),
  connection = [] :: [integer()]
}).

-record(connection, {
  id :: integer(),
  point :: {#area{}, #area{}},
  type :: connection_type(),
  open :: boolean(),
  key :: key_type(),
  key_requirement :: string()
}).

-type erlgame_type() :: #area{} | #connection{}.