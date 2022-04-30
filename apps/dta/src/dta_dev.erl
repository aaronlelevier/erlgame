%%%-------------------------------------------------------------------
%%% @author Aaron Lelevier
%%% @doc
%%% @end
%%% Created : 30. Apr 2022 8:50 AM
%%%-------------------------------------------------------------------
-module(dta_dev).
-author("Aaron Lelevier").
-vsn(1.0).
-export([
  conf/0,
  buckets/0,
  buckets/1
]).

conf() ->
  erlcloud_aws:default_config().

buckets() ->
  Conf = conf(),
  buckets(Conf).

buckets(Conf) ->
  erlcloud_s3:list_buckets(Conf).
