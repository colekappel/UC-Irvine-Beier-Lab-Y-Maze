clear 

%% spike rate matrices 5x+
spikeRates6025 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6025CorrectAlts.mat').wholeErPerCell;
spikeRates6026 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6026CorrectAlts.mat').wholeErPerCell;
spikeRates6027 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6027CorrectAlts.mat').wholeErPerCell;
spikeRates6028 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6028CorrectAlts.mat').wholeErPerCell;
spikeRates6029 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6029CorrectAlts.mat').wholeErPerCell;

plusSpikeRatesWholeRec = [spikeRates6025;spikeRates6026;spikeRates6027;spikeRates6028;spikeRates6029];

%% spike rate matrices 5x-
spikeRates6039 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6039CorrectAlts.mat').wholeErPerCell;
spikeRates6041 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6041CorrectAlts.mat').wholeErPerCell;

spikeRates6412 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6412CorrectAlts.mat').wholeErPerCell;
spikeRates6416 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6416CorrectAlts.mat').wholeErPerCell;
spikeRates6417 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6417CorrectAlts.mat').wholeErPerCell;
spikeRates6431 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6431CorrectAlts.mat').wholeErPerCell;

minusSpikeRatesWholeRec = [spikeRates6039;spikeRates6041;spikeRates6412;spikeRates6416;spikeRates6417;spikeRates6431];

%% lme tables
%% lme 5x+
spikeRates6025 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6025CorrectAlts.mat').lmeTable;
spikeRates6026 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6026CorrectAlts.mat').lmeTable;
spikeRates6027 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6027CorrectAlts.mat').lmeTable;
spikeRates6028 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6028CorrectAlts.mat').lmeTable;
spikeRates6029 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6029CorrectAlts.mat').lmeTable;

plusLmeTable = [spikeRates6025;spikeRates6026;spikeRates6027;spikeRates6028;spikeRates6029];

%% lme 5x-
spikeRates6039 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6039CorrectAlts.mat').lmeTable;
spikeRates6041 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6041CorrectAlts.mat').lmeTable;

spikeRates6412 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6412CorrectAlts.mat').lmeTable;
spikeRates6416 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6416CorrectAlts.mat').lmeTable;
spikeRates6417 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6417CorrectAlts.mat').lmeTable;
spikeRates6431 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6431CorrectAlts.mat').lmeTable;

minusLmeTable = [spikeRates6039;spikeRates6041;spikeRates6412;spikeRates6416;spikeRates6417;spikeRates6431];

%% cdf plot
%% cdf plots for correct alts
cdfplot(minusSpikeRatesWholeRec);
hold on
cdfplot(plusSpikeRatesWholeRec);
title('5x+ vs 5x-: CDF for Whole Recording Spike Rate ','FontSize',14)
xlabel(" Spike Rate",'FontSize',14);
ylabel("% of cells",'FontSize',14);
legend('5xFAD-','5xFAD+','FontSize',20,'Location','best')


%% violin plot
srComp = figure;
gg1 = repmat({'5xFAD-'},length(minusSpikeRatesWholeRec),1);
gg2= repmat({'5xFAD+'},length(plusSpikeRatesWholeRec),1);
gg=[gg1;gg2];
xx=[minusSpikeRatesWholeRec;plusSpikeRatesWholeRec];
violinplot(xx,gg,'ShowMean', true,'ShowBox',false,'GroupOrder',{'5xFAD-','5xFAD+'});
title('5x+ vs 5x-:  Spike Rate Comparison for Whole Recording ','FontSize',20)
ylabel('Event Rate','FontSize',14)

red=[255,0,0]/255;
blue =[0,0, 255]/255;
colors = [blue;red];
h = findobj(gca,'Tag','Box');
for j=1:length(h)
    patch(get(h(j),'XData'),get(h(j),'YData'),colors(j,:),'FaceAlpha',.5);
end

%% stats
lmeAllMice=[plusLmeTable;minusLmeTable];

lmeFormulaPlusV_Minus = 'spikeRateForWholeRec~plusOrMinus+(1|mouseID)';

lmePlusVMinus_wholeRec= fitlme(lmeAllMice,lmeFormulaPlusV_Minus);

[~,pTtPlusVMinus_wholeRec] = ttest2(plusSpikeRatesWholeRec,minusSpikeRatesWholeRec);
[~,pKsPlusVMinus_wholeRec] = kstest2(plusSpikeRatesWholeRec,minusSpikeRatesWholeRec);

writetable(lmeAllMice,"lmeAllMice.csv");