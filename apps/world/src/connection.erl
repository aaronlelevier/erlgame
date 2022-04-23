%%%-------------------------------------------------------------------
%%% @author Aaron Lelevier
%%% @doc
%%% @end
%%% Created : 23. Apr 2022 11:49 AM
%%%-------------------------------------------------------------------
-module(connection).
-behavior(db_item_impl).
-author("Aaron Lelevier").
-vsn(1.0).
-export([
  set_id/2
]).

-include_lib("erlgame/include/records.hrl").

set_id(Conn, Id) ->
  Conn#connection{id = Id}.