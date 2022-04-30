%%%-------------------------------------------------------------------
%%% @author Aaron Lelevier
%%% @doc
%%% @end
%%% Created : 30. Apr 2022 8:12 AM
%%%-------------------------------------------------------------------
-module(util).
-author("Aaron Lelevier").
-vsn(1.0).
-export([
  io_format/2,
  str_format/2
]).


%% Prints a string interpolated string to stdout
-spec io_format(String::string(), Args::list()) -> ok.
io_format(String, Args) ->
  io:format(str_format(String, Args)).

%% Returns a rendered a string interpolated string
-spec str_format(String::string(), Args::list()) -> string().
str_format(String, Args) ->
  lists:flatten(io_lib:format(String, Args)).
