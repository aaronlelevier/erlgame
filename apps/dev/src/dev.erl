%%%===================================================================
%% # Summary
%% Code for local dev
%% ## Style
%% The function names follow this style
%% <mod>_<action>
%%%===================================================================
-module(dev).

-export([
  test/0,
  db_start/0
]).

-include_lib("erlgame/include/records.hrl").

test() ->
  Tab = db_start(),
  Area1 = db:read(Tab, {area, 1}),
  [] = Area1#area.connection,
  ok.

db_start() ->
  Tab = db:init(),

  Area1 = world:create_area(#{"id" => 1}),
  Area2 = world:create_area(#{"id" => 2}),
  Conn1 = world:create_connection(#{"id" => 1, "point" => {Area1, Area2}, "type" => 'bridge'}),

  db:write(Tab, Area1),
  db:write(Tab, Area2),
  db:write(Tab, Conn1),

  Tab.
