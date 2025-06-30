clear

%% Look at correct turn responsive vs incorrect turn responsive:

%% spike rate matrices 5x+: correct alts
spikeRatesBinned6025 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6025IncorrectAlts.mat').binnedSpikeRateAroundAlts;
spikeRatesBinned6026 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6026IncorrectAlts.mat').binnedSpikeRateAroundAlts;
spikeRatesBinned6027 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6027IncorrectAlts.mat').binnedSpikeRateAroundAlts;
spikeRatesBinned6028 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6028IncorrectAlts.mat').binnedSpikeRateAroundAlts;
spikeRatesBinned6029 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6029IncorrectAlts.mat').binnedSpikeRateAroundAlts;

plusCorrectSpikeRatesBinned = [spikeRatesBinned6025;spikeRatesBinned6026;spikeRatesBinned6027;spikeRatesBinned6028;spikeRatesBinned6029];

%% load in the 5x+ correct turn responsive rows and Inc turn responsive rows
fiveXPlusCorRespRows = load('ResponsiveRowsCorrect.mat').rPlus;
fiveXPlusIncRespRows = load('ResponsiveRowsIncorrect.mat').rPlus;


%% get unresponsive correct alternation rows
plusAllRows=transpose(linspace(1,948,948));
fiveXPlusCorUnrespRows= find(~ismember(plusAllRows,fiveXPlusCorRespRows));
fiveXPlusIncorUnrespRows= find(~ismember(plusAllRows,fiveXPlusIncRespRows));

%% put the correct and inc turn responsive and unresponsive values into new array
plusCorAltResp = plusCorrectSpikeRatesBinned(fiveXPlusCorRespRows,:); % blue heatmap: can use default
plusCorAltUnresp = plusCorrectSpikeRatesBinned(fiveXPlusCorUnrespRows,:); % red heatmap: use copper maybe

plusIncAltResp = plusCorrectSpikeRatesBinned(fiveXPlusIncRespRows,:); % blue heatmap: can use default
plusIncAltUnresp = plusCorrectSpikeRatesBinned(fiveXPlusIncorUnrespRows,:); % red heatmap: use copper maybe

%% want to take the column wise average of those arrays ^^^ and plot for cor and inc alts separately: 
%% plot resp and unresp in same plot

meanPlusIncorAltResp = mean(plusIncAltResp,1); %change this
stdPlusIncorAltResp = std(plusIncAltResp,0,1); %change this 

meanPlusIncorAltUnresp = mean(plusIncAltUnresp,1);
stdPlusIncorAltUnresp = std(plusIncAltUnresp,0,1);

%% want to make shaded std for plus cor alt resp:
%subplot(2,1,1)
x= 1:numel(stdPlusIncorAltResp);
curve1 = meanPlusIncorAltResp + stdPlusIncorAltResp;
curve2 = meanPlusIncorAltResp - stdPlusIncorAltResp;
x2=[x,fliplr(x)];
inBetween = [curve1,fliplr(curve2)];
fill(x2,inBetween,[211,211,211]./255,'FaceAlpha',.3,'EdgeAlpha',.3)
hold on

plot(x,meanPlusIncorAltResp)
title('Average Incorrect Alternation Spike Rate With Standard Deviation (With Precise Time Points)','FontSize',16)
ylabel('Spike Rate','FontSize',16)

hold on %instead of subplot
%subplot(2,1,2)
x= 1:numel(stdPlusIncorAltUnresp);
curve1 = meanPlusIncorAltUnresp + stdPlusIncorAltUnresp;
curve2 = meanPlusIncorAltUnresp - stdPlusIncorAltUnresp;
x2=[x,fliplr(x)];
inBetween = [curve1,fliplr(curve2)];
fill(x2,inBetween,[169,169,169]./255,'FaceAlpha',.3,'EdgeAlpha',.3)
hold on
plot(x,meanPlusIncorAltUnresp,'r') 
xlabel('1/10th Second Bins Around Alternation (Alternation occurs in the middle)','FontSize',16)
legend('5x+ Incorrect Alternation Responsive Std','5x+ Incorrect Alternation Responsive Avg','5x+ Incorrect Alternation Unresponsive Std','5x+ Incorrect Alternation Unresponsive Avg','FontSize',16)
xlim([1,20])
%