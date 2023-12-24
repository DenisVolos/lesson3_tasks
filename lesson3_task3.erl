% Split line to separate words with exact marker
% c(lesson3_task3).

% 1> BinText2 = <<"Col1-:-Col2-:-Col3-:-Col4-:-Col5">>.
% <<"Col1-:-Col2-:-Col3-:-Col4-:-Col5">>
% 2> lesson3_task3:splt2(BinText2, "-:-").
% [<<"Col1">>, <<"Col2">>, <<"Col3">>, <<"Col4">>, <<"Col5">>]


-module(lesson3_task3).
-export([splt2/2]).


splt2(Bin, Chars) ->
    splt2(Chars, Bin, 0, []).

splt2(Chars, Bin, Idx, Acc) ->
    case Bin of
        <<This:Idx/binary, Char, Tail/binary>> ->
            case lists:member(Char, Chars) of
                false ->
                    splt2(Chars, Bin, Idx+1, Acc);
                true ->
                    splt2(Chars, Tail, 0, [This|Acc])
            end;
        <<This:Idx/binary>> ->
            lists:reverse(Acc, [This])
    end.