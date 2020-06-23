%% テキスト ファイルからのデータのインポート
% 次のテキスト ファイルからデータをインポートするスクリプト:
%
%    ファイル名: D:\user\Documents\MATLAB\iidx_score.csv
%
% MATLAB からの自動生成日: 2020/06/23 14:45:40

%% インポート オプションの設定およびデータのインポート
opts = delimitedTextImportOptions("NumVariables", 18);

% 範囲と区切り記号の指定
opts.DataLines = [1, Inf];
opts.Delimiter = ",";

% 列名と型の指定
opts.VariableNames = ["level", "title", "exsc_kai", "VarName4", "VarName5", "exsc_chu", "A1", "VarName8", "exsc_10d", "A2", "VarName11", "exsc_08d", "A3", "VarName14", "VarName15", "VarName16", "notes", "Feb20"];
opts.VariableTypes = ["double", "string", "double", "categorical", "double", "double", "categorical", "double", "double", "categorical", "double", "double", "categorical", "double", "double", "double", "double", "categorical"];

% ファイル レベルのプロパティを指定
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% 変数プロパティを指定
opts = setvaropts(opts, "title", "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["title", "VarName4", "A1", "A2", "A3", "Feb20"], "EmptyFieldRule", "auto");

% データのインポート
iidxscore = readtable("D:\user\Documents\MATLAB\iidx_score_new.csv", opts);


%% 一時変数のクリア
clear opts