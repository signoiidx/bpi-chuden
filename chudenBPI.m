%% load date
clearvars
load_iidx_average
load_my_score

%% あなたのスコアの抽出 (lv11, lv12)
j = 1;
for i = 2:height(spscore)
    if spscore.HYPER(i) == 12
        yourscore(j,:) = [spscore.VarName2(i) spscore.HYPEREX(i)];
        j = j + 1;
    end
    if spscore.ANOTHER(i) == 12
        yourscore(j,:) = [spscore.VarName2(i) spscore.ANOTHEREX(i)];
        j = j + 1;
    end
    if spscore.LEGGENDARIA(i) == 12
        yourscore(j,:) = [spscore.VarName2(i) spscore.LEGGENDARIAEX(i)];
        j = j + 1;
    end
    if spscore.ANOTHER(i) == 11
        yourscore(j,:) = [spscore.VarName2(i) spscore.ANOTHEREX(i)];
        j = j + 1;
    end
    if spscore.LEGGENDARIA(i) == 11
        yourscore(j,:) = [spscore.VarName2(i) spscore.LEGGENDARIAEX(i)];
        j = j + 1;
    end
end
%% ソート
for i = 1:height(iidxscore)
    ind = yourscore(:,1) == iidxscore.title(i);
    if sum(ind) > 1
        ind_lvsrt = iidxscore.title(:) == iidxscore.title(i);
        sortedscore(find(ind_lvsrt, 1, 'first'),:) = yourscore(find(ind, 1, 'first'),:);
        sortedscore(find(ind_lvsrt, 1, 'last'),:) = yourscore(find(ind, 1, 'last'),:);
    elseif sum(ind) == 1
        sortedscore(i,:) = yourscore(ind,:);
    else
        % do nothing
    end
    sortedscore(height(iidxscore),:) = ["夕焼け～Fanding Day～","0"];
    
end
%% 必要な変数の抽出
rate_you = double(sortedscore(:,2)) ./ (iidxscore.notes * 2);
ind = rate_you == 0;
rate_you(ind) = NaN;
rate_kai = iidxscore.exsc_kai ./ (iidxscore.notes * 2);
rate_chu = iidxscore.exsc_chu ./ (iidxscore.notes * 2);
rate_10d = iidxscore.exsc_10d ./ (iidxscore.notes * 2);
%% 変数の宣言
pgf_you = zeros(height(iidxscore), 1);
pgf_kai = zeros(height(iidxscore), 1);
pgf_chu = zeros(height(iidxscore), 1);
pgf_10d = zeros(height(iidxscore), 1);
bpi = zeros(height(iidxscore), 1);
%% PGF Pika-Great Function
for i = 1:height(iidxscore)
    pgf_you(i) = 1 + (rate_you(i)-0.5)/(1-rate_you(i));
    pgf_kai(i) = 1 + (rate_kai(i)-0.5)/(1-rate_kai(i));
    pgf_chu(i) = 1 + (rate_chu(i)-0.5)/(1-rate_chu(i));
    pgf_10d(i) = 1 + (rate_10d(i)-0.5)/(1-rate_10d(i));
end
%% PGFの正規化
pgf_nmr_you = pgf_you ./ pgf_chu;
pgf_nmr_chu = pgf_kai ./ pgf_chu;

%% 中伝BPI Beat Power Index
p = 1.5;
for i = 1:height(iidxscore)
    if rate_you(i) >= rate_chu(i) % 中伝平均より高いとき
        bpi(i) = 100 * (log(pgf_nmr_you(i)) / log(pgf_nmr_chu(i)))^p;
    else
        bpi(i) = -100 * (-log(pgf_nmr_you(i)) / log(pgf_nmr_chu(i)))^p;
    end
end

bpi_data = table(sortedscore(:,1), bpi, double(sortedscore(:,2)), iidxscore.exsc_chu, iidxscore.exsc_kai);
bpi_data = rmmissing(bpi_data);
bpi_data.Properties.VariableNames = {'title','bpi','yourScore', 'chudenScore', 'kaidenScore'};