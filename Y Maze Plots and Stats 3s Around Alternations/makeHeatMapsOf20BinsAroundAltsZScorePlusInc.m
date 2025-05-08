clear

%% Look at correct turn responsive vs incorrect turn responsive:

%% Look at correct turn responsive vs incorrect turn responsive:
windowSize = 5;

%% spike rate matrices 5x+: correct alts
spikeRatesBinned6025 = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6025IncorrectAlts.mat').binnedSpikeRateAroundAlts;
spikeRatesBinned6026 = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6026IncorrectAlts.mat').binnedSpikeRateAroundAlts;
spikeRatesBinned6027 = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6027IncorrectAlts.mat').binnedSpikeRateAroundAlts;
spikeRatesBinned6028 = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6028IncorrectAlts.mat').binnedSpikeRateAroundAlts;
spikeRatesBinned6029 = load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6029IncorrectAlts.mat').binnedSpikeRateAroundAlts;

plusIncorrectSpikeRatesBinned = [spikeRatesBinned6025;spikeRatesBinned6026;spikeRatesBinned6027;spikeRatesBinned6028;spikeRatesBinned6029];

%% copy above for minus: 
spikeRatesBinned6039 = smoothdata(load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6039IncorrectAlts.mat').binnedSpikeRateAroundAlts,'movmean',windowSize);
spikeRatesBinned6041 = smoothdata(load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6041IncorrectAlts.mat').binnedSpikeRateAroundAlts,'movmean',windowSize);

spikeRatesBinned6412 = smoothdata(load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6412IncorrectAlts.mat').binnedSpikeRateAroundAlts,'movmean',windowSize);
spikeRatesBinned6416 = smoothdata(load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6416IncorrectAlts.mat').binnedSpikeRateAroundAlts,'movmean',windowSize);
spikeRatesBinned6417 = smoothdata(load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6417IncorrectAlts.mat').binnedSpikeRateAroundAlts,'movmean',windowSize);
spikeRatesBinned6431 = smoothdata(load('SpontAltSpikesAroundAltsZScore/spikesAroundAlts6431IncorrectAlts.mat').binnedSpikeRateAroundAlts,'movmean',windowSize);

minusIncorrectSpikeRatesBinned = [spikeRatesBinned6039;spikeRatesBinned6041;spikeRatesBinned6412;spikeRatesBinned6416;...
    spikeRatesBinned6417;spikeRatesBinned6431];

%% load in the 5x+ correct turn responsive rows and Inc turn responsive rows
fiveXPlusCorRespRows = load('CorVIncResponsiveness1sUnZScoredW6412_1stSesh/Correct.mat').rPlus;
fiveXPlusIncRespRows = load('CorVIncResponsiveness1sUnZScoredW6412_1stSesh/Incorrect.mat').rPlus;

%% copy above for minus:
fiveXMinusCorRespRows = load('CorVIncResponsiveness1sUnZScoredW6412_1stSesh/Correct.mat').rMinus;
fiveXMinusIncRespRows = load('CorVIncResponsiveness1sUnZScoredW6412_1stSesh/Incorrect.mat').rMinus;

%% get unresponsive correct alternation rows
plusAllRows=transpose(linspace(1,948,948));
fiveXPlusCorUnrespRows= find(~ismember(plusAllRows,fiveXPlusCorRespRows));
fiveXPlusIncorUnrespRows= find(~ismember(plusAllRows,fiveXPlusIncRespRows));

%% put the correct and inc turn responsive and unresponsive values into new array
plusCorAltResp = plusIncorrectSpikeRatesBinned(fiveXPlusCorRespRows,:); % blue heatmap: can use default
plusCorAltUnresp = plusIncorrectSpikeRatesBinned(fiveXPlusCorUnrespRows,:); % red heatmap: use copper maybe

plusIncAltResp = plusIncorrectSpikeRatesBinned(fiveXPlusIncRespRows,:); % blue heatmap: can use default
plusIncAltUnresp = plusIncorrectSpikeRatesBinned(fiveXPlusIncorUnrespRows,:); % red heatmap: use copper maybe

%% want to take the column wise average of those arrays ^^^ and plot for cor and inc alts separately: 
%% plot resp and unresp in same plot

meanPlusIncorAltResp = smoothdata(mean(plusIncAltResp,1),'movmean',5); %change this
stdPlusIncorAltResp = std(plusIncAltResp,0,1)./sqrt(height(plusIncAltResp)); %change this 

meanPlusIncorAltUnresp = smoothdata(mean(plusIncAltUnresp,1),'movmean',5);
stdPlusIncorAltUnresp = std(plusIncAltUnresp,0,1)./sqrt(height(plusIncAltUnresp));

%% make array for responsive minus unresponsive and plot
xx= 1:numel(meanPlusIncorAltResp);
meanPlusIncorRespMinusUnresp = meanPlusIncorAltResp-meanPlusIncorAltUnresp;
plot(xx,meanPlusIncorRespMinusUnresp);
title('5x+ Mean Incorrect Responsive Minus Incorrect Unresponsive','FontSize',16);
xlabel('1/10th Second Bins Around Alternation (Alternation occurs in the middle)','FontSize',16)
ylabel('Z Scored Spike Rate','FontSize',16)
figure; 

save("plusIncorMeanPlusIncorRespMinusUnresp","meanPlusIncorRespMinusUnresp");


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
ylabel('Z Scored Spike Rate','FontSize',16)

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
xlim([1,60])
%

meanPlusIncorAltResp = transpose(meanPlusIncorAltResp);
stdPlusIncorAltResp = transpose(stdPlusIncorAltResp);
meanPlusIncorAltUnresp = transpose(meanPlusIncorAltUnresp);
stdPlusIncorAltUnresp = transpose(stdPlusIncorAltUnresp);


stdPlusIncorTable = table(meanPlusIncorAltResp,stdPlusIncorAltResp,meanPlusIncorAltUnresp,stdPlusIncorAltUnresp);

writetable(stdPlusIncorTable,'stdPlusIncorTable.csv')