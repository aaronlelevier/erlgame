%%%-------------------------------------------------------------------
%%% @author Aaron Lelevier
%%% @doc
%%% @end
%%% Created : 14. Apr 2022 10:12 AM
%%%-------------------------------------------------------------------
-author("Aaron Lelevier").

%%%===================================================================
%% Types
%%%===================================================================
-type connection_type() :: 'bridge' | 'tunnel'.

-type key_type() :: undefined | 'gate'.

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
  type :: connection_type(),
  open :: boolean(),
  key :: key_type(),
  key_requirement :: string()
}).