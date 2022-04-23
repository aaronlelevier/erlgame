%%%-------------------------------------------------------------------
%%% @author Aaron Lelevier
%%% @doc
%%% @end
%%% Created : 23. Apr 2022 11:55 AM
%%%-------------------------------------------------------------------
-module(db_item_impl).
-author("Aaron Lelevier").
-vsn(1.0).
-include_lib("erlgame/include/records.hrl").

-callback set_id(erlgame_type(), integer()) -> erlgame_type().