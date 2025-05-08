clear

%% make lme tables for plus cor, inc and minus cor, inc

timeWindow = 2; % *** change this to timeWindow ie 3s vs 5s (3 bins w 6s total time mean 2s per bin)
nBins = 20; % *** change this to timeWindow times 10 if you change the time window ie 3s vs 5s

lme6025_cor = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6025CorrectAlts.mat').lmeTable;
lme6026_cor = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6026CorrectAlts.mat').lmeTable;
lme6027_cor = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6027CorrectAlts.mat').lmeTable;
lme6028_cor = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6028CorrectAlts.mat').lmeTable;
lme6029_cor = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6029CorrectAlts.mat').lmeTable;

lme5xPlus_cor = [lme6025_cor;lme6026_cor;lme6027_cor;lme6028_cor;lme6029_cor];

lme6025_inc = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6025IncorrectAlts.mat').lmeTable;
lme6026_inc = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6026IncorrectAlts.mat').lmeTable;
lme6027_inc = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6027IncorrectAlts.mat').lmeTable;
lme6028_inc = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6028IncorrectAlts.mat').lmeTable;
lme6029_inc = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6029IncorrectAlts.mat').lmeTable;

lme5xPlus_inc = [lme6025_inc;lme6026_inc;lme6027_inc;lme6028_inc;lme6029_inc];

%% 5x- mice:

lme6039_cor = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6039CorrectAlts.mat').lmeTable;
lme6041_cor = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6041CorrectAlts.mat').lmeTable;

lme6412_cor = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6412CorrectAlts.mat').lmeTable;
lme6416_cor = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6416CorrectAlts.mat').lmeTable;
lme6417_cor = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6417CorrectAlts.mat').lmeTable;
lme6431_cor = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6431CorrectAlts.mat').lmeTable;

lme5xMinus_cor = [lme6039_cor;lme6041_cor;lme6412_cor;lme6416_cor;lme6417_cor;lme6431_cor];

lme6039_inc = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6039IncorrectAlts.mat').lmeTable;
lme6041_inc = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6041IncorrectAlts.mat').lmeTable;

lme6412_inc = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6412IncorrectAlts.mat').lmeTable;
lme6416_inc = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6416IncorrectAlts.mat').lmeTable;
lme6417_inc = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6417IncorrectAlts.mat').lmeTable;
lme6431_inc = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6431IncorrectAlts.mat').lmeTable;

lme5xMinus_inc = [lme6039_inc;lme6041_inc;lme6412_inc;lme6416_inc;lme6417_inc;lme6431_inc];

%% spike rate matrices 5x+: correct alts
spikeRatesBinned6025 = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6025CorrectAlts.mat').binnedSpikeRateAroundAlts;
spikeRatesBinned6026 = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6026CorrectAlts.mat').binnedSpikeRateAroundAlts;
spikeRatesBinned6027 = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6027CorrectAlts.mat').binnedSpikeRateAroundAlts;
spikeRatesBinned6028 = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6028CorrectAlts.mat').binnedSpikeRateAroundAlts;
spikeRatesBinned6029 = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6029CorrectAlts.mat').binnedSpikeRateAroundAlts;

plusCorrectSpikeRatesBinned = [spikeRatesBinned6025;spikeRatesBinned6026;spikeRatesBinned6027;spikeRatesBinned6028;spikeRatesBinned6029];

%% copy above for minus: 
smoothWindowSize = 5;
spikeRatesBinned6039 = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6039CorrectAlts.mat').binnedSpikeRateAroundAlts;
spikeRatesBinned6041 = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6041CorrectAlts.mat').binnedSpikeRateAroundAlts;

spikeRatesBinned6412 = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6412CorrectAlts.mat').binnedSpikeRateAroundAlts;
spikeRatesBinned6416 = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6416CorrectAlts.mat').binnedSpikeRateAroundAlts;
spikeRatesBinned6417 = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6417CorrectAlts.mat').binnedSpikeRateAroundAlts;
spikeRatesBinned6431 = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6431CorrectAlts.mat').binnedSpikeRateAroundAlts;

minusCorrectSpikeRatesBinned = [spikeRatesBinned6039;spikeRatesBinned6041;spikeRatesBinned6412;spikeRatesBinned6416;...
    spikeRatesBinned6417;spikeRatesBinned6431];

%% spike rate matrices 5x+: incorrect alts
spikeRatesBinned6025_inc = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6025IncorrectAlts.mat').binnedSpikeRateAroundAlts;
spikeRatesBinned6026_inc = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6026IncorrectAlts.mat').binnedSpikeRateAroundAlts;
spikeRatesBinned6027_inc = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6027IncorrectAlts.mat').binnedSpikeRateAroundAlts;
spikeRatesBinned6028_inc = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6028IncorrectAlts.mat').binnedSpikeRateAroundAlts;
spikeRatesBinned6029_inc = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6029IncorrectAlts.mat').binnedSpikeRateAroundAlts;

plusIncorrectSpikeRatesBinned = [spikeRatesBinned6025_inc;spikeRatesBinned6026_inc;spikeRatesBinned6027_inc;spikeRatesBinned6028_inc;spikeRatesBinned6029_inc];

%% copy above for minus: 
spikeRatesBinned6039_inc = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6039IncorrectAlts.mat').binnedSpikeRateAroundAlts;
spikeRatesBinned6041_inc = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6041IncorrectAlts.mat').binnedSpikeRateAroundAlts;

spikeRatesBinned6412_inc = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6412IncorrectAlts.mat').binnedSpikeRateAroundAlts;
spikeRatesBinned6416_inc = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6416IncorrectAlts.mat').binnedSpikeRateAroundAlts;
spikeRatesBinned6417_inc = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6417IncorrectAlts.mat').binnedSpikeRateAroundAlts;
spikeRatesBinned6431_inc = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6431IncorrectAlts.mat').binnedSpikeRateAroundAlts;

minusIncorrectSpikeRatesBinned = [spikeRatesBinned6039_inc;spikeRatesBinned6041_inc;spikeRatesBinned6412_inc;spikeRatesBinned6416_inc;...
    spikeRatesBinned6417_inc;spikeRatesBinned6431_inc];

%% load in the 5x+ correct turn responsive rows and Inc turn responsive rows
fiveXPlusCorRespRows = load('newRows1sUnZscoredW6412_1stSesh.mat').rowsPlusCorRespIncNR;
fiveXPlusIncRespRows = load('newRows1sUnZscoredW6412_1stSesh.mat').rowsPlusIncRespCorNR;

%% copy above for minus:
fiveXMinusCorRespRows = load('newRows1sUnZscoredW6412_1stSesh.mat').rowsMinusCorRespIncNR;
fiveXMinusIncRespRows = load('newRows1sUnZscoredW6412_1stSesh.mat').rowsMinusIncRespCorNR;

%% get unresponsive correct alternation rows
plusAllRows=transpose(linspace(1,height(plusIncorrectSpikeRatesBinned),height(plusIncorrectSpikeRatesBinned)));
fiveXPlusCorUnrespRows= find(~ismember(plusAllRows,fiveXPlusCorRespRows));
fiveXPlusIncorUnrespRows= find(~ismember(plusAllRows,fiveXPlusIncRespRows));

%% copy above for minus:
minusAllRows=transpose(linspace(1,height(minusCorrectSpikeRatesBinned),height(minusCorrectSpikeRatesBinned)));
fiveXMinusCorUnrespRows= find(~ismember(minusAllRows,fiveXMinusCorRespRows));
fiveXMinusIncorUnrespRows= find(~ismember(minusAllRows,fiveXMinusIncRespRows));


%% put the correct and inc turn responsive and unresponsive values into new array
plusCorAltResp = plusCorrectSpikeRatesBinned(fiveXPlusCorRespRows,:); % blue heatmap: can use default
plusCorAltUnresp = plusCorrectSpikeRatesBinned(fiveXPlusCorUnrespRows,:); % red heatmap: use copper maybe

lmePlusCorResp = lme5xPlus_cor(fiveXPlusCorRespRows,:);

plusIncAltResp = plusIncorrectSpikeRatesBinned(fiveXPlusIncRespRows,:); % blue heatmap: can use default
plusIncAltUnresp = plusIncorrectSpikeRatesBinned(fiveXPlusIncorUnrespRows,:); % red heatmap: use copper maybe

lmePlusIncResp = lme5xPlus_inc(fiveXPlusIncRespRows,:);

%% copy above for minus: 
minusCorAltResp = minusCorrectSpikeRatesBinned(fiveXMinusCorRespRows,:); % blue heatmap: can use default
minusCorAltUnresp = minusCorrectSpikeRatesBinned(fiveXMinusCorUnrespRows,:); % red heatmap: use copper maybe

lmeMinusCorResp = lme5xMinus_cor(fiveXMinusCorRespRows,:);

minusIncAltResp = minusIncorrectSpikeRatesBinned(fiveXMinusIncRespRows,:); % blue heatmap: can use default
minusIncAltUnresp = minusIncorrectSpikeRatesBinned(fiveXMinusIncorUnrespRows,:); % red heatmap: use copper maybe

lmeMinusIncResp = lme5xMinus_inc(fiveXMinusIncRespRows,:);


%% want to take the column wise average of those arrays ^^^ and plot for cor and inc alts separately: 
%% plot resp and unresp in same plot

meanPlusCorAltResp = mean(plusCorAltResp,1);
stdPlusCorAltResp = std(plusCorAltResp,0,1);

meanPlusCorAltUnresp = mean(plusCorAltUnresp,1);
stdPlusCorAltUnresp = std(plusCorAltUnresp,0,1);

%% copy above for minus

meanMinusCorAltResp = mean(minusCorAltResp,1);
stdMinusCorAltResp = std(minusCorAltResp,0,1);

meanMinusCorAltUnresp = mean(minusCorAltUnresp,1);
stdMinusCorAltUnresp = std(minusCorAltUnresp,0,1);

%% copy above for minus Inc

meanMinusIncorAltResp = mean(minusIncAltResp,1);
stdMinusIncorAltResp = std(minusIncAltResp,0,1);

meanMinusIncorAltUnresp = mean(minusIncAltUnresp,1);
stdMinusIncorAltUnresp = std(minusIncAltUnresp,0,1);

%
%% want to make shaded std for plus cor alt resp:  ((( change all plusses to minuses )))
%subplot(2,1,1)
x= 1:numel(stdMinusIncorAltResp);
curve1 = meanMinusIncorAltResp + stdMinusIncorAltResp;
curve2 = meanMinusIncorAltResp - stdMinusIncorAltResp;
x2=[x,fliplr(x)];
inBetween = [curve1,fliplr(curve2)];
fill(x2,inBetween,[211,211,211]./255,'FaceAlpha',.3,'EdgeAlpha',.3)
hold on

plot(x,meanMinusIncorAltResp)
title('Average Incorrect Alternation Spike Rate With Standard Deviation (With Precise Time Points)','FontSize',16)
ylabel('Z Scored Spike Rate','FontSize',16)

hold on %instead of subplot
%subplot(2,1,2)
x= 1:numel(stdMinusIncorAltUnresp);
curve1 = meanMinusIncorAltUnresp + stdMinusIncorAltUnresp;
curve2 = meanMinusIncorAltUnresp - stdMinusIncorAltUnresp;
x2=[x,fliplr(x)];
inBetween = [curve1,fliplr(curve2)];
fill(x2,inBetween,[169,169,169]./255,'FaceAlpha',.3,'EdgeAlpha',.3)
hold on
plot(x,meanMinusIncorAltUnresp,'r') 
xlabel('1/10th Second Bins Around Alternation (Alternation occurs in the middle)','FontSize',16)
legend('5x- Incorrect Alternation Responsive Std','5x- Incorrect Alternation Responsive Avg','5x- Incorrect Alternation Unresponsive Std','5x- Incorrect Alternation Unresponsive Avg','FontSize',16)
xlim([1,100])

%{
figure;

%% code for plus correct alt responsive on top and correct alt unresponsive on bottom where both have different colorings
subplot(2,1,1)
hCorAltResp = heatmap(plusCorAltResp,'Colormap',abyss);
grid off
title('5x+ Correct Alternation: Responsive (Z Scored With Precise Time Points)')
ylabel('cell')
hCorAltResp.FontSize=14;

subplot(2,1,2)
hCorAltUnresp = heatmap(plusCorAltUnresp,'Colormap',copper);
grid off 
title('5x+ Correct Alternation: Unresponsive (Z Scored With Precise Time Points)')
ylabel('cell')
hCorAltUnresp.FontSize=14;
%
%
%% code for plus incorrect alt responsive on top and incorrect alt unresponsive on bottom where both have different colorings
figure;
subplot(2,1,1)
hIncorAltResp = heatmap(plusIncAltResp,'Colormap',abyss);
grid off
title('5x+ Incorrect Alternation: Responsive (Z Scored With Precise Time Points)')
ylabel('cell')
hIncorAltResp.FontSize=14;

subplot(2,1,2)
hIncorAltUnresp = heatmap(plusIncAltUnresp,'Colormap',copper);
grid off 
title('5x+ Incorrect Alternation: Unresponsive (Z Scored With Precise Time Points)')
ylabel('cell')
hIncorAltUnresp.FontSize=14;
%
%% code for plus correct alt resp vs incorrect alt responsive
%
figure;
subplot(2,1,1)
hCor=heatmap(plusCorAltResp,'Colormap',abyss);
grid off
title('5x+ Correct Alternation: Responsive (Z Scored With Precise Time Points)')
ylabel('cell')
hCor.FontSize=14;
%xlabel('1/10th second bins around alternation')

subplot(2,1,2)
hInc = heatmap(plusIncAltResp,'Colormap',abyss);
grid off
title('5x+ Incorrect Alternation: Responsive (Z Scored With Precise Time Points)')
ylabel('cell')
xlabel('1/10th second bins around alternation (alternation occurs in middle)')
hInc.FontSize=14;
%}

%heatmap(plusCorrectSpikeRatesBinned)

%% spike rate matrices 5x- for correct turns
%{
spikeRatesBinned6039 = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6039IncorrectAlts.mat').binnedSpikeRateAroundAlts;
spikeRatesBinned6041 = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6041IncorrectAlts.mat').binnedSpikeRateAroundAlts;

minusSpikeRatesBinned = [spikeRatesBinned6039;spikeRatesBinned6041];
%}

%% vvvv here im gonna write code for getting plus cor resp AUC vvvv

i = 1; % start w first neuron 
NumNeurons = height(plusCorAltResp);
%preAUC_PlusCorResp = zeros(1,NumNeurons);
%postAUC_PlusCorResp = zeros(1,NumNeurons);

for i =1:NumNeurons  % change to 1:NumNeurons
    AUC_PlusCorRespneg3toneg1(i) = (sum(plusCorAltResp(i,1:20))/20);
    AUC_PlusCorRespneg1to0(i) = (sum(plusCorAltResp(i,21:30))/10);
    AUC_PlusCorResp0to3(i) = (sum(plusCorAltResp(i,31:end))/30);

end

av_AUC_PlusCorRespneg3toneg1 = mean(AUC_PlusCorRespneg3toneg1);
av_AUC_PlusCorRespneg1to0 = mean(AUC_PlusCorRespneg1to0);
av_AUC_PlusCorResp0to3 = mean(AUC_PlusCorResp0to3);

%{
if length(AUC_PlusCorRespneg3toneg1) == 1 
    av_preAUC_PlusCorResp =0;
end

if length(AUC_PlusCorRespneg1to1) == 1 
    av_postAUC_PlusCorResp =0;
end
%}
%% vvvv here im gonna write code for getting plus incor resp AUC vvvv

i = 1; % start w first neuron 
NumNeurons = height(plusIncAltResp);
%nBins = 50;
%preAUC_PlusIncResp = zeros(1,NumNeurons);
%postAUC_PlusIncResp = zeros(1,NumNeurons);

for i =1:NumNeurons  % change to 1:NumNeurons
    AUC_PlusIncRespneg3toneg1(i) = (sum(plusIncAltResp(i,1:20))/20);
    AUC_PlusIncRespneg1to0(i) = (sum(plusIncAltResp(i,21:30))/10);
    AUC_PlusIncResp0to3(i) = (sum(plusIncAltResp(i,31:end))/30);

end

av_AUC_PlusIncRespneg3toneg1 = mean(AUC_PlusIncRespneg3toneg1);
av_AUC_PlusIncRespneg1to0 = mean(AUC_PlusIncRespneg1to0);
av_AUC_PlusIncResp0to3 = mean(AUC_PlusIncResp0to3);

%{
if length(AUC_PlusIncRespneg3toneg1) == 1 
    av_AUC_PlusIncRespneg3toneg1 =0;
end

if length(AUC_PlusIncRespneg1to1) == 1 
    av_AUC_PlusIncRespneg1to1 =0;
end
%}
%% vvvv here im gonna write code for getting minus cor resp AUC vvvv

i = 1; % start w first neuron 
NumNeurons = height(minusCorAltResp);
%nBins = 50;
%preAUC_MinusCorResp = zeros(1,NumNeurons);
%postAUC_MinusCorResp = zeros(1,NumNeurons);

for i =1:NumNeurons  % change to 1:NumNeurons
    AUC_MinusCorRespneg3toneg1(i) = (sum(minusCorAltResp(i,1:20))/20);
    AUC_MinusCorRespneg1to0(i) = (sum(minusCorAltResp(i,21:30))/10);
    AUC_MinusCorResp0to3(i) = (sum(minusCorAltResp(i,31:end))/30);

end

av_AUC_MinusCorRespneg3toneg1 = mean(AUC_MinusCorRespneg3toneg1);
av_AUC_MinusCorRespneg1to0 = mean(AUC_MinusCorRespneg1to0);
av_AUC_MinusCorResp0to3 = mean(AUC_MinusCorResp0to3);
%{
if length(AUC_MinusCorRespneg3toneg1) == 1 
    av_AUC_MinusCorRespneg3toneg1 =0;
end

if length(AUC_MinusCorRespneg1to1) == 1 
    av_AUC_MinusCorRespneg1to1 =0;
end
%}
%% vvvv here im gonna write code for getting minus inc resp AUC vvvv

i = 1; % start w first neuron 
NumNeurons = height(minusIncAltResp);
%nBins = 50;
%preAUC_MinusIncResp = zeros(1,NumNeurons);
%postAUC_MinusIncResp = zeros(1,NumNeurons);

for i =1:NumNeurons  % change to 1:NumNeurons
    AUC_MinusIncRespneg3toneg1(i) = (sum(minusIncAltResp(i,1:20))/20);
    AUC_MinusIncRespneg1to0(i) = (sum(minusIncAltResp(i,21:30))/10);
    AUC_MinusIncResp0to3(i) = (sum(minusIncAltResp(i,31:end))/30);

end

av_AUC_MinusIncRespneg3toneg1 = mean(AUC_MinusIncRespneg3toneg1);
av_AUC_MinusIncRespneg1to0 = mean(AUC_MinusIncRespneg1to0);
av_AUC_MinusIncResp0to3 = mean(AUC_MinusIncResp0to3);

%{
if length(AUC_MinusIncRespneg3toneg1) == 1 
    av_AUC_MinusIncRespneg3toneg1 =0;
end

if length(AUC_MinusIncRespneg1to1) == 1 
    av_AUC_MinusIncRespneg1to1 =0;
end
%}
figure;

%% make bar charts: 
y = [av_AUC_PlusCorRespneg3toneg1/2 av_AUC_PlusCorRespneg1to0 av_AUC_PlusCorResp0to3/3;...
    av_AUC_PlusIncRespneg3toneg1/2 av_AUC_PlusIncRespneg1to0 av_AUC_PlusIncResp0to3/3;...
    av_AUC_MinusCorRespneg3toneg1/2 av_AUC_MinusCorRespneg1to0 av_AUC_MinusCorResp0to3/3;...
    av_AUC_MinusIncRespneg3toneg1/2 av_AUC_MinusIncRespneg1to0 av_AUC_MinusIncResp0to3/3];
b=bar(y, 'FaceColor','flat');
title('AUC Comparison for Responsive Cells','FontSize',24)
ylabel('AUC','FontSize',24)
legend('Neg 3s to Neg 1s','Neg 1s to 0s','0s to 3s','FontSize',24,'Location','northeast');

%% want to make violin plots, error bars, lme comparison and csvs of data

%% violin plot for correct plus v minus (just copied from another prog - have to change it)
srComp = figure;
gg1 = repmat({'Neg 3 to neg 1 Plus Cor Resp'},length(AUC_PlusCorRespneg3toneg1),1);
gg2 = repmat({'Neg 1 to 0 Plus Cor Resp'},length(AUC_PlusCorRespneg1to0),1);
gg3 = repmat({'0 to 3 Plus Cor Resp'},length(AUC_PlusCorResp0to3),1);

gg4 = repmat({'Neg 3 to neg 1 Plus Inc Resp'},length(AUC_PlusIncRespneg3toneg1),1);
gg5 = repmat({'Neg 1 to 0 Plus Inc Resp'},length(AUC_PlusIncRespneg1to0),1);
gg6 = repmat({'0 to 3 Plus Inc Resp'},length(AUC_PlusIncResp0to3),1);

gg7 = repmat({'Neg 3 to neg 1 Minus Cor Resp'},length(AUC_MinusCorRespneg3toneg1),1);
gg8 = repmat({'Neg 1 to 0 Minus Cor Resp'},length(AUC_MinusCorRespneg1to0),1);
gg9 = repmat({'0 to 3 Minus Cor Resp'},length(AUC_MinusCorResp0to3),1);

gg10 = repmat({'Neg 3 to neg 1 Minus Inc Resp'},length(AUC_MinusIncRespneg3toneg1),1);
gg11 = repmat({'Neg 1 to 0 Minus Inc Resp'},length(AUC_MinusIncRespneg1to0),1);
gg12 = repmat({'0 to 3 Minus Inc Resp'},length(AUC_MinusIncResp0to3),1);


gg=[gg1;gg2;gg3;gg4;gg5;gg6;gg7;gg8;gg9;gg10;gg11;gg12];
xx_csv=[AUC_PlusCorRespneg3toneg1/2,AUC_PlusCorRespneg1to0,AUC_PlusCorResp0to3/3,...
    AUC_PlusIncRespneg3toneg1/2,AUC_PlusIncRespneg1to0,AUC_PlusIncResp0to3/3,...
    (AUC_MinusCorRespneg3toneg1/2 ),(AUC_MinusCorRespneg1to0 ),(AUC_MinusCorResp0to3/3),...
    (AUC_MinusIncRespneg3toneg1/2), (AUC_MinusIncRespneg1to0), (AUC_MinusIncResp0to3/3)];
violinplot(xx_csv,gg,'ShowMean', true,'ShowBox',false,'GroupOrder',...
    {'Neg 3 to neg 1 Plus Cor Resp','Neg 1 to 0 Plus Cor Resp','0 to 3 Plus Cor Resp',...
    'Neg 3 to neg 1 Plus Inc Resp', 'Neg 1 to 0 Plus Inc Resp','0 to 3 Plus Inc Resp',...
    'Neg 3 to neg 1 Minus Cor Resp', 'Neg 1 to 0 Minus Cor Resp','0 to 3 Minus Cor Resp',...
    'Neg 3 to neg 1 Minus Inc Resp', 'Neg 1 to 0 Minus Inc Resp','0 to 3 Minus Inc Resp'});

title('AUC Violin Comparison for Responsive Cells','FontSize',24)
ylabel('AUC','FontSize',20)
ylim()

red=[255,0,0]/255;
blue =[0,0, 255]/255;
colors = [blue;red];
h = findobj(gca,'Tag','Box');
for j=1:length(h)
    patch(get(h(j),'XData'),get(h(j),'YData'),colors(j,:),'FaceAlpha',.5);
end

%% make ANOVA - need to make 3 column matx for plus cor, plus inc, minus cor and minus inc

yPlusCor = [transpose(AUC_PlusCorRespneg3toneg1/2),transpose(AUC_PlusCorRespneg1to0),...
    transpose(AUC_PlusCorResp0to3/3)];
yPlusInc = [transpose(AUC_PlusIncRespneg3toneg1/2),transpose(AUC_PlusIncRespneg1to0),...
    transpose(AUC_PlusIncResp0to3/3)];
yMinusCor = [transpose(AUC_MinusCorRespneg3toneg1/2),transpose(AUC_MinusCorRespneg1to0),...
    transpose(AUC_MinusCorResp0to3/3)];
yMinusInc = [transpose(AUC_MinusIncRespneg3toneg1/2),transpose(AUC_MinusIncRespneg1to0),...
    transpose(AUC_MinusIncResp0to3/3)];

p_plusCor = anova1(yPlusCor) ; 
p_plusInc = anova1(yPlusInc) ; 
p_minusCor = anova1(yMinusCor) ; 
p_minusInc = anova1(yMinusInc) ;

%% y vectors for each put in place of MPG from example
yNeg3toneg1 = [transpose(AUC_PlusCorRespneg3toneg1/2); transpose(AUC_PlusIncRespneg3toneg1/2);...
    transpose(AUC_MinusCorRespneg3toneg1/2);transpose(AUC_MinusIncRespneg3toneg1/2)];

yNeg1to0 = [transpose(AUC_PlusCorRespneg1to0);transpose(AUC_PlusIncRespneg1to0);...
    transpose(AUC_MinusCorRespneg1to0);transpose(AUC_MinusIncRespneg1to0)];

y0to3 = [transpose(AUC_PlusCorResp0to3/3);transpose(AUC_PlusIncResp0to3/3);...
    transpose(AUC_MinusCorResp0to3/3);transpose(AUC_MinusIncResp0to3/3)];

%% now need label vectors ( can use same labels for each anova since i set them up same way
% -1 for minus 1 for plus
% 0 for incorrect 1 for correct

plusOrMinus = [ones(length(AUC_PlusCorRespneg3toneg1),1); ones(length(AUC_PlusIncRespneg3toneg1),1);...
    ones(length(AUC_MinusCorRespneg3toneg1),1)*-1;ones(length(AUC_MinusIncRespneg3toneg1),1)*-1];

correctOrIncorrect = [ones(length(AUC_PlusCorRespneg3toneg1),1); zeros(length(AUC_PlusIncRespneg3toneg1),1);...
    ones(length(AUC_MinusCorRespneg3toneg1),1);zeros(length(AUC_MinusIncRespneg3toneg1),1)];

mouseID = [lmePlusCorResp{:,3}; lmePlusIncResp{:,3}; lmeMinusCorResp{:,3};lmeMinusIncResp{:,3}];

anovaNeg3toNeg1 = anovan(yNeg3toneg1,{plusOrMinus correctOrIncorrect mouseID}, 'model',3,...
    'random',3,'nested',[0 0 0; 0 0 0; 1 0 0],'varnames',{'5x+ or 5x-','Correct or Incorrect', 'mouse ID'});

anovaNeg1to0 = anovan(yNeg1to0,{plusOrMinus correctOrIncorrect mouseID}, 'model',3,...
    'random',3,'nested',[0 0 0; 0 0 0; 1 0 0],'varnames',{'5x+ or 5x-','Correct or Incorrect', 'mouse ID'});

anova0to3 = anovan(y0to3,{plusOrMinus correctOrIncorrect mouseID}, 'model',3,...
    'random',3,'nested',[0 0 0; 0 0 0; 1 0 0],'varnames',{'5x+ or 5x-','Correct or Incorrect', 'mouse ID'});

%% AUC violins for different time periods

%% want to make violin plots, error bars, lme comparison and csvs of data

%% violin plot for correct plus v minus (just copied from another prog - have to change it)
%% violin for neg 3 to neg 1
figure;
gg1 = repmat({'Neg 3 to neg 1 Plus Cor Resp'},length(AUC_PlusCorRespneg3toneg1),1);
gg2 = repmat({'Neg 3 to neg 1 Plus Inc Resp'},length(AUC_PlusIncRespneg3toneg1),1);
gg3 = repmat({'Neg 3 to neg 1 Minus Cor Resp'},length(AUC_MinusCorRespneg3toneg1),1);
gg4 = repmat({'Neg 3 to neg 1 Minus Inc Resp'},length(AUC_MinusIncRespneg3toneg1),1);

gg=[gg1;gg2;gg3;gg4];
xx=[AUC_PlusCorRespneg3toneg1/2,...
    AUC_PlusIncRespneg3toneg1/2,...
    (AUC_MinusCorRespneg3toneg1/2 ),...
    (AUC_MinusIncRespneg3toneg1/2)];
violinplot(xx,gg,'ShowMean', true,'ShowBox',false,'GroupOrder',...
    {'Neg 3 to neg 1 Plus Cor Resp',...
    'Neg 3 to neg 1 Plus Inc Resp',...
    'Neg 3 to neg 1 Minus Cor Resp',...
    'Neg 3 to neg 1 Minus Inc Resp'});

title('AUC Violin Comparison for Responsive Cells: -3s to -1s','FontSize',24)
ylabel('AUC','FontSize',20)
%ylim()

red=[255,0,0]/255;
blue =[0,0, 255]/255;
colors = [blue;red];
h = findobj(gca,'Tag','Box');
for j=1:length(h)
    patch(get(h(j),'XData'),get(h(j),'YData'),colors(j,:),'FaceAlpha',.5);
end

%% violin for neg 1 to 0 

%% want to make violin plots, error bars, lme comparison and csvs of data

%% violin plot for correct plus v minus (just copied from another prog - have to change it)
figure;

gg1 = repmat({'Neg 1 to 0 Plus Cor Resp'},length(AUC_PlusCorRespneg1to0),1);
gg2 = repmat({'Neg 1 to 0 Plus Inc Resp'},length(AUC_PlusIncRespneg1to0),1);
gg3 = repmat({'Neg 1 to 0 Minus Cor Resp'},length(AUC_MinusCorRespneg1to0),1);
gg4 = repmat({'Neg 1 to 0 Minus Inc Resp'},length(AUC_MinusIncRespneg1to0),1);



gg=[gg1;gg2;gg3;gg4];
xx=[AUC_PlusCorRespneg1to0,...
    AUC_PlusIncRespneg1to0,...
    (AUC_MinusCorRespneg1to0 ),...
    (AUC_MinusIncRespneg1to0)];
violinplot(xx,gg,'ShowMean', true,'ShowBox',false,'GroupOrder',...
    {'Neg 1 to 0 Plus Cor Resp',...
    'Neg 1 to 0 Plus Inc Resp',...
    'Neg 1 to 0 Minus Cor Resp',...
    'Neg 1 to 0 Minus Inc Resp'});

title('AUC Violin Comparison for Responsive Cells: -1s to 0s','FontSize',24)
ylabel('AUC','FontSize',20)
%ylim()

red=[255,0,0]/255;
blue =[0,0, 255]/255;
colors = [blue;red];
h = findobj(gca,'Tag','Box');
for j=1:length(h)
    patch(get(h(j),'XData'),get(h(j),'YData'),colors(j,:),'FaceAlpha',.5);
end

%% violin for 0 to 3 s

%% want to make violin plots, error bars, lme comparison and csvs of data

%% violin plot for correct plus v minus (just copied from another prog - have to change it)
figure;

gg1 = repmat({'0 to 3 Plus Cor Resp'},length(AUC_PlusCorResp0to3),1);
gg2 = repmat({'0 to 3 Plus Inc Resp'},length(AUC_PlusIncResp0to3),1);
gg3 = repmat({'0 to 3 Minus Cor Resp'},length(AUC_MinusCorResp0to3),1);
gg4 = repmat({'0 to 3 Minus Inc Resp'},length(AUC_MinusIncResp0to3),1);


gg=[gg1;gg2;gg3;gg4];
xx=[AUC_PlusCorResp0to3/3,...
    AUC_PlusIncResp0to3/3,...
    (AUC_MinusCorResp0to3/3),...
    (AUC_MinusIncResp0to3/3)];
violinplot(xx,gg,'ShowMean', true,'ShowBox',false,'GroupOrder',...
    {'0 to 3 Plus Cor Resp',...
    '0 to 3 Plus Inc Resp',...
    '0 to 3 Minus Cor Resp',...
    '0 to 3 Minus Inc Resp'});

title('AUC Violin Comparison for Responsive Cells: 0s to 3s','FontSize',24)
ylabel('AUC','FontSize',20)
%ylim()

red=[255,0,0]/255;
blue =[0,0, 255]/255;
colors = [blue;red];
h = findobj(gca,'Tag','Box');
for j=1:length(h)
    patch(get(h(j),'XData'),get(h(j),'YData'),colors(j,:),'FaceAlpha',.5);
end


%% ks test and lme : should just be pre vs post
%{
[~,pKsPlusCor] = kstest2(AUC_PlusCorRespneg3toneg1, AUC_PlusCorRespneg1to1);
[~,pKsPlusInc] = kstest2(AUC_PlusIncRespneg3toneg1, AUC_PlusIncRespneg1to1);
[~,pKsMinusCor] = kstest2(AUC_MinusCorRespneg3toneg1, AUC_MinusCorRespneg1to1);
[~,pKsMinusInc] = kstest2(AUC_MinusIncRespneg3toneg1, AUC_MinusIncRespneg1to1);
%
%% stats for plus v minus correct alts: now plusOrMinus should be pre or post 
%% and have to construct new lme table for that 
%% need a table that has all AUC in one column, then plus or minus 
%% and mouse ID in another column


%% lme for plus cor 
lmePlusCorResp.preAUC = transpose(AUC_PlusCorRespneg3toneg1);
lmePlusCorResp.postAUC = transpose(AUC_PlusCorRespneg1to1);

lmePlusCor = table();
lmePlusCor.AUC = [ transpose(AUC_PlusCorRespneg3toneg1);  transpose(AUC_PlusCorRespneg1to1)];
lmePlusCor.preOrPost = [-1*ones(length(AUC_PlusCorRespneg3toneg1),1); ones(length(AUC_PlusCorRespneg1to1),1)];
lmePlusCor.mouseID = [lmePlusCorResp.mouseID ; lmePlusCorResp.mouseID];

%% lme for plus inc
lmePlusIncResp.preAUC = transpose(AUC_PlusIncRespneg3toneg1);
lmePlusIncResp.postAUC = transpose(AUC_PlusIncRespneg1to1);

lmePlusInc = table();
lmePlusInc.AUC = [ transpose(AUC_PlusIncRespneg3toneg1);  transpose(AUC_PlusIncRespneg1to1)];
lmePlusInc.preOrPost = [-1*ones(length(AUC_PlusIncRespneg3toneg1),1); ones(length(AUC_PlusIncRespneg1to1),1)];
lmePlusInc.mouseID = [lmePlusIncResp.mouseID ; lmePlusIncResp.mouseID];

%% lme for minus cor
lmeMinusCorResp.preAUC = transpose(AUC_MinusCorRespneg3toneg1);
lmeMinusCorResp.postAUC = transpose(AUC_MinusCorRespneg1to1);

lmeMinusCor = table();
lmeMinusCor.AUC = [ transpose(AUC_MinusCorRespneg3toneg1);  transpose(AUC_MinusCorRespneg1to1)];
lmeMinusCor.preOrPost = [-1*ones(length(AUC_MinusCorRespneg3toneg1),1); ones(length(AUC_MinusCorRespneg1to1),1)];
lmeMinusCor.mouseID = [lmeMinusCorResp.mouseID ; lmeMinusCorResp.mouseID];

%% lme for minus inc
lmeMinusIncResp.preAUC = transpose(AUC_MinusIncRespneg3toneg1);
lmeMinusIncResp.postAUC = transpose(AUC_MinusIncRespneg1to1);

lmeMinusInc = table();
lmeMinusInc.AUC = [ transpose(AUC_MinusIncRespneg3toneg1);  transpose(AUC_MinusIncRespneg1to1)];
lmeMinusInc.preOrPost = [-1*ones(length(AUC_MinusIncRespneg3toneg1),1); ones(length(AUC_MinusIncRespneg1to1),1)];
lmeMinusInc.mouseID = [lmeMinusIncResp.mouseID ; lmeMinusIncResp.mouseID];

%% i have the 4 lme tables now - just need to add the AUC values to them
lmeFormula = 'AUC~preOrPost+(1|mouseID)';

lmePlusCorStat = fitlme(lmePlusCor,lmeFormula);
lmePlusIncStat = fitlme(lmePlusInc,lmeFormula);
lmeMinusCorStat = fitlme(lmeMinusCor,lmeFormula);
lmeMinusIncStat = fitlme(lmeMinusInc,lmeFormula);
%}
%% code for minus correct alt responsive on top and correct alt unresponsive on bottom where both have different colorings
figure;
subplot(2,1,1)
hCorAltResp = heatmap(minusCorAltResp,'Colormap',abyss);
grid off
title('5x- Correct Alternation: Responsive (Z Scored With Precise Time Points)')
ylabel('cell')
hCorAltResp.FontSize=14;

writematrix(minusCorAltResp , 'minusCorAltResp.csv');

subplot(2,1,2)
hCorAltUnresp = heatmap(minusCorAltUnresp,'Colormap',copper);
grid off 
title('5x- Correct Alternation: Unresponsive (Z Scored With Precise Time Points)')
ylabel('cell')
hCorAltUnresp.FontSize=14;

writematrix(minusCorAltUnresp , 'minusCorAltUnresp.csv');

%lme
%
%% code for minus incorrect alt responsive on top and incorrect alt unresponsive on bottom where both have different colorings
figure;
subplot(2,1,1)
hIncorAltResp = heatmap(minusIncAltResp,'Colormap',abyss);
grid off
title('5x- Incorrect Alternation: Responsive (Z Scored With Precise Time Points)')
ylabel('cell')
hIncorAltResp.FontSize=14;

writematrix(minusIncAltResp , 'minusIncAltResp.csv');

subplot(2,1,2)
hIncorAltUnresp = heatmap(minusIncAltUnresp,'Colormap',copper);
grid off 
title('5x- Incorrect Alternation: Unresponsive (Z Scored With Precise Time Points)')
ylabel('cell')
hIncorAltUnresp.FontSize=14;

writematrix(minusIncAltUnresp , 'minusIncAltUnresp.csv');
%
%% code for minus correct alt resp vs incorrect alt responsive
%
figure;
subplot(2,1,1)
hCor=heatmap(minusCorAltResp,'Colormap',abyss);
grid off
title('5x- Correct Alternation: Responsive (Z Scored With Precise Time Points)')
ylabel('cell')
hCor.FontSize=14;
%xlabel('1/10th second bins around alternation')

subplot(2,1,2)
hInc = heatmap(minusIncAltResp,'Colormap',abyss);
grid off
title('5x- Incorrect Alternation: Responsive (Z Scored With Precise Time Points)')
ylabel('cell')
xlabel('1/10th second bins around alternation (alternation occurs in middle)')
hInc.FontSize=14;

%{
lmeAllMice=[lme5xPlus;lme5xMinus];

lmeFormulaPlusV_Minus = 'spikeRate~plusOrMinus+(1|mouseID)';

lmePlusVMinus_Correct= fitlme(lmeAllMice,lmeFormulaPlusV_Minus);
%}

% will change the formula to lmeFormulaPlusV_Minus = 'AUC~preOrPost+(1|mouseID)';
%}
%
AUC_PlusCorRespneg3toneg1 = transpose(AUC_PlusCorRespneg3toneg1);
AUC_PlusCorRespneg1to0 = transpose(AUC_PlusCorRespneg1to0);
AUC_PlusCorResp0to3 = transpose(AUC_PlusCorResp0to3);

aucPlusCorTable = table(AUC_PlusCorRespneg3toneg1,AUC_PlusCorRespneg1to0,AUC_PlusCorResp0to3);

writetable(aucPlusCorTable, 'plusCorAUCTable.csv');
%{

xx_csv=[AUC_PlusCorRespneg3toneg1/2,AUC_PlusCorRespneg1to0,AUC_PlusCorResp0to3/3,...
    AUC_PlusIncRespneg3toneg1/2,AUC_PlusIncRespneg1to0,AUC_PlusIncResp0to3/3,...
    (AUC_MinusCorRespneg3toneg1/2 ),(AUC_MinusCorRespneg1to0 ),(AUC_MinusCorResp0to3/3),...
    (AUC_MinusIncRespneg3toneg1/2), (AUC_MinusIncRespneg1to0), (AUC_MinusIncResp0to3/3)];

%}

AUC_PlusIncRespneg3toneg1 = transpose(AUC_PlusIncRespneg3toneg1);
AUC_PlusIncRespneg1to0 = transpose(AUC_PlusIncRespneg1to0);
AUC_PlusIncResp0to3 = transpose(AUC_PlusIncResp0to3);

aucPlusIncTable = table(AUC_PlusIncRespneg3toneg1,AUC_PlusIncRespneg1to0,AUC_PlusIncResp0to3);
writetable(aucPlusIncTable , 'aucPlusIncTable.csv');

AUC_MinusCorRespneg3toneg1 = transpose(AUC_MinusCorRespneg3toneg1);
AUC_MinusCorRespneg1to0 = transpose(AUC_MinusCorRespneg1to0);
AUC_MinusCorResp0to3 = transpose(AUC_MinusCorResp0to3);

aucMinusCorTable = table(AUC_MinusCorRespneg3toneg1,AUC_MinusCorRespneg1to0,AUC_MinusCorResp0to3);

writetable(aucMinusCorTable, 'MinusCorAUCTable.csv');

AUC_MinusIncRespneg3toneg1 = transpose(AUC_MinusIncRespneg3toneg1);
AUC_MinusIncRespneg1to0 = transpose(AUC_MinusIncRespneg1to0);
AUC_MinusIncResp0to3 = transpose(AUC_MinusIncResp0to3);

aucMinusIncTable = table(AUC_MinusIncRespneg3toneg1,AUC_MinusIncRespneg1to0,AUC_MinusIncResp0to3);

writetable(aucMinusIncTable, 'MinusIncAUCTable.csv');

save('All_AUCS.mat','AUC_MinusCorResp0to3', 'AUC_MinusIncResp0to3', 'AUC_MinusCorRespneg1to0', 'AUC_MinusCorRespneg3toneg1', 'AUC_MinusIncRespneg1to0', 'AUC_MinusIncRespneg3toneg1',...
    'AUC_PlusIncRespneg3toneg1', 'AUC_PlusIncRespneg1to0', 'AUC_PlusIncResp0to3', 'AUC_PlusCorRespneg3toneg1', 'AUC_PlusCorRespneg1to0', 'AUC_PlusCorResp0to3');
%}