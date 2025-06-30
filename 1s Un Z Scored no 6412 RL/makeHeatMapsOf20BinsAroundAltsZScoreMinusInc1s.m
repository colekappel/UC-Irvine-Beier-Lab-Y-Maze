clear

%% Look at correct turn responsive vs incorrect turn responsive:

%% spike rate matrices 5x+: correct alts
spikeRatesBinned6025 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6025IncorrectAlts.mat').binnedSpikeRateAroundAlts;
spikeRatesBinned6026 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6026IncorrectAlts.mat').binnedSpikeRateAroundAlts;
spikeRatesBinned6027 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6027IncorrectAlts.mat').binnedSpikeRateAroundAlts;
spikeRatesBinned6028 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6028IncorrectAlts.mat').binnedSpikeRateAroundAlts;
spikeRatesBinned6029 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6029IncorrectAlts.mat').binnedSpikeRateAroundAlts;

plusCorrectSpikeRatesBinned = [spikeRatesBinned6025;spikeRatesBinned6026;spikeRatesBinned6027;spikeRatesBinned6028;spikeRatesBinned6029];

%% copy above for minus: 
spikeRatesBinned6039_inc = load('SpontAltSpikesAroundAlts/spikesAroundAlts6039IncorrectAlts.mat').binnedSpikeRateAroundAlts;
spikeRatesBinned6041_inc = load('SpontAltSpikesAroundAlts/spikesAroundAlts6041IncorrectAlts.mat').binnedSpikeRateAroundAlts;

%spikeRatesBinned6412_inc = load('SpontAltSpikesAroundAlts/spikesAroundAlts6412IncorrectAlts.mat').binnedSpikeRateAroundAlts;
spikeRatesBinned6416_inc = load('SpontAltSpikesAroundAlts/spikesAroundAlts6416IncorrectAlts.mat').binnedSpikeRateAroundAlts;
spikeRatesBinned6417_inc = load('SpontAltSpikesAroundAlts/spikesAroundAlts6417IncorrectAlts.mat').binnedSpikeRateAroundAlts;
spikeRatesBinned6431_inc = load('SpontAltSpikesAroundAlts/spikesAroundAlts6431IncorrectAlts.mat').binnedSpikeRateAroundAlts;

minusIncorrectSpikeRatesBinned = [spikeRatesBinned6039_inc;spikeRatesBinned6041_inc;spikeRatesBinned6416_inc;...
    spikeRatesBinned6417_inc;spikeRatesBinned6431_inc];

%% load in the 5x+ correct turn responsive rows and Inc turn responsive rows
fiveXPlusCorRespRows = load('ResponsiveRowsCorrect.mat').rPlus;
fiveXPlusIncRespRows = load('ResponsiveRowsIncorrect.mat').rPlus;

%% copy above for minus:
fiveXMinusCorRespRows = load('CorVIncResponsiveness/Correct.mat').rMinus;
fiveXMinusIncRespRows = load('CorVIncResponsiveness/Incorrect.mat').rMinus;

%% get unresponsive correct alternation rows
plusAllRows=transpose(linspace(1,height(plusCorrectSpikeRatesBinned),height(plusCorrectSpikeRatesBinned)));
fiveXPlusCorUnrespRows= find(~ismember(plusAllRows,fiveXPlusCorRespRows));
fiveXPlusIncorUnrespRows= find(~ismember(plusAllRows,fiveXPlusIncRespRows));

%% copy above for minus:
minusAllRows=transpose(linspace(1,height(minusIncorrectSpikeRatesBinned),height(minusIncorrectSpikeRatesBinned)));
fiveXMinusCorUnrespRows= find(~ismember(minusAllRows,fiveXMinusCorRespRows));
fiveXMinusIncorUnrespRows= find(~ismember(minusAllRows,fiveXMinusIncRespRows));


%% put the correct and inc turn responsive and unresponsive values into new array
plusCorAltResp = plusCorrectSpikeRatesBinned(fiveXPlusCorRespRows,:); % blue heatmap: can use default
plusCorAltUnresp = plusCorrectSpikeRatesBinned(fiveXPlusCorUnrespRows,:); % red heatmap: use copper maybe

plusIncAltResp = plusCorrectSpikeRatesBinned(fiveXPlusIncRespRows,:); % blue heatmap: can use default
plusIncAltUnresp = plusCorrectSpikeRatesBinned(fiveXPlusIncorUnrespRows,:); % red heatmap: use copper maybe

%% copy above for minus: 
minusCorAltResp = minusIncorrectSpikeRatesBinned(fiveXMinusCorRespRows,:); % blue heatmap: can use default
minusCorAltUnresp = minusIncorrectSpikeRatesBinned(fiveXMinusCorUnrespRows,:); % red heatmap: use copper maybe

minusIncAltResp = minusIncorrectSpikeRatesBinned(fiveXMinusIncRespRows,:); % blue heatmap: can use default
minusIncAltUnresp = minusIncorrectSpikeRatesBinned(fiveXMinusIncorUnrespRows,:); % red heatmap: use copper maybe


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
ylabel('Spike Rate','FontSize',16)

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
xlim([1,20])

figure;
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
spikeRatesBinned6039 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6039IncorrectAlts.mat').binnedSpikeRateAroundAlts;
spikeRatesBinned6041 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6041IncorrectAlts.mat').binnedSpikeRateAroundAlts;

minusSpikeRatesBinned = [spikeRatesBinned6039;spikeRatesBinned6041];
%}

%% vvvv here im gonna write code for getting plus cor resp AUC vvvv
%{
i = 1; % start w first neuron 
NumNeurons = height(plusCorAltResp);
nBins = 50;
preAUC_PlusCorResp = zeros(1,NumNeurons);
postAUC_PlusCorResp = zeros(1,NumNeurons);

for i =1:NumNeurons  % change to 1:NumNeurons
    preAUC_PlusCorResp(i) = (sum(plusCorAltResp(i,1:50))/nBins)*5;
    postAUC_PlusCorResp(i) = (sum(plusCorAltResp(i,51:end))/nBins)*5;

end

av_preAUC_PlusCorResp = mean(preAUC_PlusCorResp);
av_postAUC_PlusCorResp = mean(postAUC_PlusCorResp);

if length(preAUC_PlusCorResp) == 1 
    av_preAUC_PlusCorResp =0;
end

if length(postAUC_PlusCorResp) == 1 
    av_postAUC_PlusCorResp =0;
end

%% vvvv here im gonna write code for getting plus incor resp AUC vvvv

i = 1; % start w first neuron 
NumNeurons = height(plusIncAltResp);
nBins = 50;
preAUC_PlusIncResp = zeros(1,NumNeurons);
postAUC_PlusIncResp = zeros(1,NumNeurons);

for i =1:NumNeurons  % change to 1:NumNeurons
    preAUC_PlusIncResp(i) = (sum(plusIncAltResp(i,1:50))/nBins)*5;
    postAUC_PlusIncResp(i) = (sum(plusIncAltResp(i,51:end))/nBins)*5;

end

av_preAUC_PlusIncResp = mean(preAUC_PlusIncResp);
av_postAUC_PlusIncResp = mean(postAUC_PlusIncResp);

if length(preAUC_PlusIncResp) == 1 
    av_preAUC_PlusIncResp =0;
end

if length(postAUC_PlusIncResp) == 1 
    av_postAUC_PlusIncResp =0;
end

%% vvvv here im gonna write code for getting minus cor resp AUC vvvv

i = 1; % start w first neuron 
NumNeurons = height(minusCorAltResp);
nBins = 50;
preAUC_MinusCorResp = zeros(1,NumNeurons);
postAUC_MinusCorResp = zeros(1,NumNeurons);

for i =1:NumNeurons  % change to 1:NumNeurons
    preAUC_MinusCorResp(i) = (sum(minusCorAltResp(i,1:50))/nBins)*5;
    postAUC_MinusCorResp(i) = (sum(minusCorAltResp(i,51:end))/nBins)*5;

end

av_preAUC_MinusCorResp = mean(preAUC_MinusCorResp);
av_postAUC_MinusCorResp = mean(postAUC_MinusCorResp);

if length(preAUC_MinusCorResp) == 1 
    av_preAUC_MinusCorResp =0;
end

if length(postAUC_MinusCorResp) == 1 
    av_postAUC_MinusCorResp =0;
end

%% vvvv here im gonna write code for getting minus inc resp AUC vvvv

i = 1; % start w first neuron 
NumNeurons = height(minusIncAltResp);
nBins = 50;
preAUC_MinusIncResp = zeros(1,NumNeurons);
postAUC_MinusIncResp = zeros(1,NumNeurons);

for i =1:NumNeurons  % change to 1:NumNeurons
    preAUC_MinusIncResp(i) = (sum(minusIncAltResp(i,1:50))/nBins)*5;
    postAUC_MinusIncResp(i) = (sum(minusIncAltResp(i,51:end))/nBins)*5;

end

av_preAUC_MinusIncResp = mean(preAUC_MinusIncResp);
av_postAUC_MinusIncResp = mean(postAUC_MinusIncResp);


if length(preAUC_MinusIncResp) == 1 
    av_preAUC_MinusIncResp =0;
end

if length(postAUC_MinusIncResp) == 1 
    av_postAUC_MinusIncResp =0;
end

figure;
%}
%% make bar charts: 
%{
y = [av_preAUC_PlusCorResp av_postAUC_PlusCorResp;...
    av_preAUC_PlusIncResp av_postAUC_PlusIncResp;...
    av_preAUC_MinusCorResp av_postAUC_MinusCorResp;...
    av_preAUC_MinusIncResp av_postAUC_MinusIncResp];
b=bar(y, 'FaceColor','flat');
title('AUC Comparison for Responsive Cells','FontSize',24)
ylabel('AUC','FontSize',24)
legend('Before Turn','After Turn','FontSize',24,'Location','northwest');
%}
%% want to make violin plots, error bars, lme comparison and csvs of data

