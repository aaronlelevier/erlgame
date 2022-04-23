%%%-------------------------------------------------------------------
%%% @author Aaron Lelevier
%%% @doc
%%%
%%% @end
%%% Created : 04. Jul 2020 8:29 AM
%%%-------------------------------------------------------------------
-module(main_tests).
-author("Aaron Lelevier").
-include_lib("eunit/include/eunit.hrl").
-include_lib("erlgame/include/records.hrl").

main_test() ->
  %% world
  Tab = db:init(),

  Area1 = world:create_area(Tab),

  ?assertEqual(1, Area1#area.id),
  ?assertEqual([], Area1#area.connection),

  Conn1 = world:create_connection(Tab),
  ?assertEqual(1, Conn1#connection.id)
.
