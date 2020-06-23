%% テキスト ファイルからのデータのインポート
% 次のテキスト ファイルからデータをインポートするスクリプト:
%
%    ファイル名: D:\user\Documents\MATLAB\9166-8583_sp_score.csv
%
% MATLAB からの自動生成日: 2020/06/23 14:45:40

%% 自分のCSVインポート
opts = delimitedTextImportOptions("NumVariables", 41, "Encoding", "UTF-8");

% 範囲と区切り記号の指定
opts.DataLines = [1, Inf];
opts.Delimiter = ",";

% 列名と型の指定
opts.VariableNames = ["VarName1", "VarName2", "VarName3", "VarName4", "VarName5", "BEGINNER", "BEGINNEREX", "BEGINNERPGreat", "BEGINNERGreat", "BEGINNER1", "BEGINNER2", "BEGINNERDJLEVEL", "NORMAL", "NORMALEX", "NORMALPGreat", "NORMALGreat", "NORMAL1", "NORMAL2", "NORMALDJLEVEL", "HYPER", "HYPEREX", "HYPERPGreat", "HYPERGreat", "HYPER1", "HYPER2", "HYPERDJLEVEL", "ANOTHER", "ANOTHEREX", "ANOTHERPGreat", "ANOTHERGreat", "ANOTHER1", "ANOTHER2", "ANOTHERDJLEVEL", "LEGGENDARIA", "LEGGENDARIAEX", "LEGGENDARIAPGreat", "LEGGENDARIAGreat", "LEGGENDARIA1", "LEGGENDARIA2", "LEGGENDARIADJLEVEL", "VarName41"];
opts.VariableTypes = ["double", "string", "categorical", "categorical", "double", "double", "double", "double", "double", "categorical", "categorical", "categorical", "double", "double", "double", "double", "categorical", "categorical", "categorical", "double", "double", "double", "double", "categorical", "categorical", "categorical", "double", "double", "double", "double", "categorical", "categorical", "categorical", "double", "double", "double", "double", "categorical", "categorical", "categorical", "datetime"];

% ファイル レベルのプロパティを指定
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% 変数プロパティを指定
opts = setvaropts(opts, "VarName2", "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["VarName2", "VarName3", "VarName4", "BEGINNER1", "BEGINNER2", "BEGINNERDJLEVEL", "NORMAL1", "NORMAL2", "NORMALDJLEVEL", "HYPER1", "HYPER2", "HYPERDJLEVEL", "ANOTHER1", "ANOTHER2", "ANOTHERDJLEVEL", "LEGGENDARIA1", "LEGGENDARIA2", "LEGGENDARIADJLEVEL"], "EmptyFieldRule", "auto");
opts = setvaropts(opts, "VarName41", "InputFormat", "yyyy-MM-dd HH:mm");
opts = setvaropts(opts, "VarName1", "TrimNonNumeric", true);
opts = setvaropts(opts, "VarName1", "ThousandsSeparator", ",");

% データのインポート
spscore = readtable("D:\user\Documents\MATLAB\9166-8583_sp_score.csv", opts);


%% 一時変数のクリア
clear opts