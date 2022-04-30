%%%-------------------------------------------------------------------
%% @doc dta public API
%% @end
%%%-------------------------------------------------------------------

-module(dta_app).

-behaviour(application).

-compile(export_all).



start(_StartType, _StartArgs) ->
    % 3rd party
    start_deps(),
    % internal
    dta_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
start_deps() ->
    start_erlcloud().

%% common startup
start_dep(Name) ->
    util:io_format("~s - start .. ", [Name]),
    application:ensure_all_started(Name),
    io:format("ok~n").

%% erlcloud specific startup
start_erlcloud() ->
    application:set_env(erlcloud, aws_access_key_id, "AWS_ACCESS_KEY_ID"),
    application:set_env(erlcloud, aws_secret_access_key, "AWS_SECRET_ACCESS_KEY"),
    application:set_env(erlcloud, aws_region, "AWS_DEFAULT_REGION"),
    start_dep(erlcloud).
