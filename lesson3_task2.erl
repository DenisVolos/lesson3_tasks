% Split line to separate words
% c(lesson3_task2).

% 1> BinText = <<"Text with four words">>.
% <<"Text with four words">>
% 2> lesson3_task2:split(BinText).
% [<<"Text">>, <<"with">>, <<"four">>, <<"words">>]

-module(lesson3_task2).
-export([split/1]).


split(Bin) when is_binary(Bin) ->
    split(Bin, <<>>, []).

split(<<$ :8, Rest/binary>>, <<>>, Result) ->
    split(Rest, <<>>, Result);

split(<<$ :8, Rest/binary>>, Buffer, Result) ->
    split(Rest, <<>>, [Buffer|Result]);

split(<<Char:8, Rest/binary>>, Buffer, Result) ->
    split(Rest, <<Buffer/binary, Char>>, Result);

split(<<>>, <<>>, Result) ->
    lists:reverse(Result);

split(<<>>, Buffer, Result) ->
    lists:reverse([Buffer|Result]).