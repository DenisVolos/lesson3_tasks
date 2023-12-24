% Get first word
% c(lesson3_task1).

% 1> BinTxt = <<"Some text">>.
% <<"Some Text">>
% 2> lesson3_task1:first_word(BinTxt).
% <<”Some”>>


-module(lesson3_task1).
-export([first_word/1]).


first_word(Bin) ->
    first_word(ltrim(Bin), <<>>).

first_word(<<>>, Acc) -> Acc;
first_word(<<$\s, _/binary>>, Acc) -> Acc;
first_word(<<X, Bin/binary>>, Acc) ->
    first_word(Bin, <<Acc/binary, X>>).

ltrim(<<$\s, Bin/binary>>) -> ltrim(Bin);
ltrim(Bin) -> Bin.