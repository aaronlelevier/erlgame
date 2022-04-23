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

  _Area1 = world:create_area(Tab),

  ?assert(true).
%%
%%  ?assertEqual(1, Area1#area.id),
%%  ?assertEqual([], Area1#area.connection).
