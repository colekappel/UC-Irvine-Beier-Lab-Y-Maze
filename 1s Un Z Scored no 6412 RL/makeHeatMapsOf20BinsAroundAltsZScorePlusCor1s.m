clear

%% Look at correct turn responsive vs incorrect turn responsive:

%% spike rate matrices 5x+: correct alts
spikeRatesBinned6025 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6025CorrectAlts.mat').binnedSpikeRateAroundAlts;
spikeRatesBinned6026 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6026CorrectAlts.mat').binnedSpikeRateAroundAlts;
spikeRatesBinned6027 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6027CorrectAlts.mat').binnedSpikeRateAroundAlts;
spikeRatesBinned6028 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6028CorrectAlts.mat').binnedSpikeRateAroundAlts;
spikeRatesBinned6029 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6029CorrectAlts.mat').binnedSpikeRateAroundAlts;

plusCorrectSpikeRatesBinned = [spikeRatesBinned6025;spikeRatesBinned6026;spikeRatesBinned6027;spikeRatesBinned6028;spikeRatesBinned6029];

spikeRatesBinned6025_inc = load('SpontAltSpikesAroundAlts/spikesAroundAlts6025IncorrectAlts.mat').binnedSpikeRateAroundAlts;
spikeRatesBinned6026_inc = load('SpontAltSpikesAroundAlts/spikesAroundAlts6026IncorrectAlts.mat').binnedSpikeRateAroundAlts;
spikeRatesBinned6027_inc = load('SpontAltSpikesAroundAlts/spikesAroundAlts6027IncorrectAlts.mat').binnedSpikeRateAroundAlts;
spikeRatesBinned6028_inc = load('SpontAltSpikesAroundAlts/spikesAroundAlts6028IncorrectAlts.mat').binnedSpikeRateAroundAlts;
spikeRatesBinned6029_inc = load('SpontAltSpikesAroundAlts/spikesAroundAlts6029IncorrectAlts.mat').binnedSpikeRateAroundAlts;

plusIncorrectSpikeRatesBinned = [spikeRatesBinned6025_inc;spikeRatesBinned6026_inc;spikeRatesBinned6027_inc;spikeRatesBinned6028_inc;spikeRatesBinned6029_inc];


%% load in the 5x+ correct turn responsive rows and Inc turn responsive rows
fiveXPlusCorRespRows = load('ResponsiveRowsCorrect.mat').rPlus;
fiveXPlusIncRespRows = load('ResponsiveRowsIncorrect.mat').rPlus;

%% copy above for minus: 


%% get unresponsive correct alternation rows
plusAllRows=transpose(linspace(1,948,948));
fiveXPlusCorUnrespRows= find(~ismember(plusAllRows,fiveXPlusCorRespRows));
fiveXPlusIncorUnrespRows= find(~ismember(plusAllRows,fiveXPlusIncRespRows));

%% put the correct and inc turn responsive and unresponsive values into new array
plusCorAltResp = plusCorrectSpikeRatesBinned(fiveXPlusCorRespRows,:); % blue heatmap: can use default
plusCorAltUnresp = plusCorrectSpikeRatesBinned(fiveXPlusCorUnrespRows,:); % red heatmap: use copper maybe

plusIncAltResp = plusIncorrectSpikeRatesBinned(fiveXPlusIncRespRows,:); % blue heatmap: can use default
plusIncAltUnresp = plusIncorrectSpikeRatesBinned(fiveXPlusIncorUnrespRows,:); % red heatmap: use copper maybe

%% want to take the column wise average of those arrays ^^^ and plot for cor and inc alts separately: 
%% plot resp and unresp in same plot

meanPlusCorAltResp = mean(plusCorAltResp,1);
stdPlusCorAltResp = std(plusCorAltResp,0,1);

meanPlusCorAltUnresp = mean(plusCorAltUnresp,1);
stdPlusCorAltUnresp = std(plusCorAltUnresp,0,1);

%% want to make shaded std for plus cor alt resp:
%subplot(2,1,1)
x= 1:numel(stdPlusCorAltResp);
curve1 = meanPlusCorAltResp + stdPlusCorAltResp;
curve2 = meanPlusCorAltResp - stdPlusCorAltResp;
x2=[x,fliplr(x)];
inBetween = [curve1,fliplr(curve2)];
fill(x2,inBetween,[211,211,211]./255,'FaceAlpha',.3,'EdgeAlpha',.3)
hold on

plot(x,meanPlusCorAltResp)
title('Average Correct Alternation Spike Rate With Standard Deviation ','FontSize',16)
ylabel('Spike Rate','FontSize',16)

hold on %instead of subplot
%subplot(2,1,2)
x= 1:numel(stdPlusCorAltUnresp);
curve1 = meanPlusCorAltUnresp + stdPlusCorAltUnresp;
curve2 = meanPlusCorAltUnresp - stdPlusCorAltUnresp;
x2=[x,fliplr(x)];
inBetween = [curve1,fliplr(curve2)];
fill(x2,inBetween,[169,169,169]./255,'FaceAlpha',.3,'EdgeAlpha',.3)
hold on
plot(x,meanPlusCorAltUnresp,'r') 
xlabel('1/10th Second Bins Around Alternation (Alternation occurs in the middle)','FontSize',16)
legend('5x+ Correct Alternation Responsive Std','5x+ Correct Alternation Responsive Avg','5x+ Correct Alternation Unresponsive Std','5x+ Correct Alternation Unresponsive Avg','FontSize',16)
xlim([1,20])

figure;
%
%% code for plus correct alt responsive on top and correct alt unresponsive on bottom where both have different colorings
subplot(2,1,1)
hCorAltResp = heatmap(plusCorAltResp,'Colormap',abyss);
grid off
title('5x+ Correct Alternation: Responsive ')
ylabel('cell')
hCorAltResp.FontSize=14;

subplot(2,1,2)
hCorAltUnresp = heatmap(plusCorAltUnresp,'Colormap',copper);
grid off 
title('5x+ Correct Alternation: Unresponsive ')
ylabel('cell')
hCorAltUnresp.FontSize=14;
%}
%
%% code for plus incorrect alt responsive on top and incorrect alt unresponsive on bottom where both have different colorings
figure;
subplot(2,1,1)
hIncorAltResp = heatmap(plusIncAltResp,'Colormap',abyss);
grid off
title('5x+ Incorrect Alternation: Responsive ')
ylabel('cell')
hIncorAltResp.FontSize=14;

subplot(2,1,2)
hIncorAltUnresp = heatmap(plusIncAltUnresp,'Colormap',copper);
grid off 
title('5x+ Incorrect Alternation: Unresponsive ')
ylabel('cell')
hIncorAltUnresp.FontSize=14;
%}
%% code for plus correct alt resp vs incorrect alt responsive
%
figure;
subplot(2,1,1)
hCor=heatmap(plusCorAltResp,'Colormap',abyss);
grid off
title('5x+ Correct Alternation: Responsive ')
ylabel('cell')
hCor.FontSize=14;
%xlabel('1/10th second bins around alternation')

subplot(2,1,2)
hInc = heatmap(plusIncAltResp,'Colormap',abyss);
grid off
title('5x+ Incorrect Alternation: Responsive ')
ylabel('cell')
xlabel('1/10th second bins around alternation (alternation occurs in middle)')
hInc.FontSize=14;
%}

%heatmap(plusCorrectSpikeRatesBinned)

%% spike rate matrices 5x- for correct turns
%{
spikeRatesBinned6039 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6039CorrectAlts.mat').binnedSpikeRateAroundAlts;
spikeRatesBinned6041 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6041CorrectAlts.mat').binnedSpikeRateAroundAlts;

minusSpikeRatesBinned = [spikeRatesBinned6039;spikeRatesBinned6041];
%}