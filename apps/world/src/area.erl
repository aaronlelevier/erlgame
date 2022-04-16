%%%-------------------------------------------------------------------
%%% @author Aaron Lelevier
%%% @doc
%%% @end
%%% Created : 16. Apr 2022 11:29 AM
%%%-------------------------------------------------------------------
-module(area).
-author("Aaron Lelevier").
-vsn(1.0).
-export([
  set_id/2
]).

-include_lib("erlgame/include/records.hrl").

set_id(Area, Id) ->
  Area2 = Area#area{id = Id},
  Area2.