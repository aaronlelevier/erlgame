%%%===================================================================
%% # Summary
%% Code for local dev
%%%===================================================================
-module(dev).

-export([
  test/0
]).

-include_lib("erlgame/include/records.hrl").

test() ->
  Tab = db:init(),
  Area1 = world:create_area(Tab),
  1 = Area1#area.id,
  [] = Area1#area.connection,
  ok.
