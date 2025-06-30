clear

%% doing this for Right Turns first
fileName = strcat('CorrectAltsStats/lmeTables');

%% 5x+: 6025, 6026, 6027, 6028, 6029
%% circular shuffle stuff: 5x+ 
circShuff6025 = load('CircShuffData/spontAltCircShuff6025CorrectAlts.mat').spikeRateMatx;
circShuff6026 = load('CircShuffData/spontAltCircShuff6026CorrectAlts.mat').spikeRateMatx;
circShuff6027 = load('CircShuffData/spontAltCircShuff6027CorrectAlts.mat').spikeRateMatx;
circShuff6028 = load('CircShuffData/spontAltCircShuff6028CorrectAlts.mat').spikeRateMatx;
circShuff6029 = load('CircShuffData/spontAltCircShuff6029CorrectAlts.mat').spikeRateMatx;

plusCircShuff = [circShuff6025;circShuff6026;circShuff6027;circShuff6028;circShuff6029];

%% spike rate matrices 5x+
spikeRates6025 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6025CorrectAlts.mat').spikeRate;
spikeRates6026 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6026CorrectAlts.mat').spikeRate;
spikeRates6027 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6027CorrectAlts.mat').spikeRate;
spikeRates6028 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6028CorrectAlts.mat').spikeRate;
spikeRates6029 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6029CorrectAlts.mat').spikeRate;

plusSpikeRates = [spikeRates6025;spikeRates6026;spikeRates6027;spikeRates6028;spikeRates6029];

%% lme tables 5x+ 
lme6025 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6025CorrectAlts.mat').lmeTable;
lme6026 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6026CorrectAlts.mat').lmeTable;
lme6027 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6027CorrectAlts.mat').lmeTable;
lme6028 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6028CorrectAlts.mat').lmeTable;
lme6029 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6029CorrectAlts.mat').lmeTable;

lme5xPlus = [lme6025;lme6026;lme6027;lme6028;lme6029];
%lme5xPlus.Properties.VariableNames([1])="spikeRateForCorrectAlts";
%writetable(lme5xPlus,"PlusCorrectAltSpikeRates.csv")

%% 5x-: 6039, 6041
%% circular shuffle stuff: 5x-
circShuff6039 = load('CircShuffData/spontAltCircShuff6039CorrectAlts.mat').spikeRateMatx;
circShuff6041 = load('CircShuffData/spontAltCircShuff6041CorrectAlts.mat').spikeRateMatx;

%circShuff6412 = load('CircShuffData/spontAltCircShuff6412CorrectAlts.mat').spikeRateMatx;
circShuff6416 = load('CircShuffData/spontAltCircShuff6416CorrectAlts.mat').spikeRateMatx;
circShuff6417 = load('CircShuffData/spontAltCircShuff6417CorrectAlts.mat').spikeRateMatx;
circShuff6431 = load('CircShuffData/spontAltCircShuff6431CorrectAlts.mat').spikeRateMatx;

minusCircShuff = [circShuff6039; circShuff6041;circShuff6416;circShuff6417;circShuff6431];

%% spike rate matrices 5x-
spikeRates6039 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6039CorrectAlts.mat').spikeRate;
spikeRates6041 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6041CorrectAlts.mat').spikeRate;

%spikeRates6412 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6412CorrectAlts.mat').spikeRate;
spikeRates6416 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6416CorrectAlts.mat').spikeRate;
spikeRates6417 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6417CorrectAlts.mat').spikeRate;
spikeRates6431 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6431CorrectAlts.mat').spikeRate;

minusSpikeRates = [spikeRates6039;spikeRates6041;spikeRates6416;spikeRates6417;spikeRates6431];

%% lme tables 5x-
lme6039 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6039CorrectAlts.mat').lmeTable;
lme6041 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6041CorrectAlts.mat').lmeTable;

%lme6412 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6412CorrectAlts.mat').lmeTable;
lme6416 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6416CorrectAlts.mat').lmeTable;
lme6417 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6417CorrectAlts.mat').lmeTable;
lme6431 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6431CorrectAlts.mat').lmeTable;

lme5xMinus = [lme6039;lme6041;lme6416;lme6417;lme6431];
%lme5xMinus.Properties.VariableNames([1])="spikeRateForCorrectAlts";
%writetable(lme5xMinus,"MinusCorrectAltSpikeRates.csv")

%% save 5x - and 5x+ lme tables
save(fileName,"lme5xPlus","lme5xMinus");

%% rest of code

responsivePlus = prctile(plusCircShuff,95,"all");
responsiveMinus = prctile(minusCircShuff,95,"all");

responsiveArrMinus = NaN(size(minusSpikeRates));
[rMinus,~] = find(minusSpikeRates >= responsiveMinus);
responsiveArrMinus(rMinus,:) = minusSpikeRates(rMinus,:);

pctResponsiveMinus = height(rMinus)/height(minusSpikeRates);
pctNonResponsiveMinus = 1-pctResponsiveMinus;

responsiveArrPlus = NaN(size(plusSpikeRates));
[rPlus,~] = find(plusSpikeRates >= responsivePlus); %5x+ correct alt responsive rows
responsiveArrPlus(rPlus,:) = plusSpikeRates(rPlus,:);

pctResponsivePlus = height(rPlus)/height(plusSpikeRates);
pctNonResponsivePlus = 1-pctResponsivePlus;


if max(plusSpikeRates)>=max(minusSpikeRates)
    theXLim = max(plusSpikeRates);
else
     theXLim = max(minusSpikeRates);
end

responsive5xMinStr = strcat('Responsive 5x- (',num2str(responsiveMinus,'%.4f'),')');
responsive5xPlusStr = strcat('Responsive 5x+ (',num2str(responsivePlus,'%.4f'),')');

%% stats for plus v minus correct alts
lmeAllMice=[lme5xPlus;lme5xMinus];

lmeFormulaPlusV_Minus = 'spikeRate~plusOrMinus+(1|mouseID)';

lmePlusVMinus_Correct= fitlme(lmeAllMice,lmeFormulaPlusV_Minus);

[~,pTtPlusVMinus_Correct] = ttest2(lme5xPlus{:,1},lme5xMinus{:,1});
[~,pKsPlusVMinus_Correct] = kstest2(lme5xPlus{:,1},lme5xMinus{:,1});

cdfCor = figure;
%
%% cdf plots for correct alts
cdfplot(lme5xMinus{:,1});
hold on
cdfplot(lme5xPlus{:,1});
title('5x+ vs 5x-: CDF for Right Turns ','FontSize',14)
xlabel(" Spike Rate",'FontSize',14);
ylabel("% of cells",'FontSize',14);
legend('5xFAD-','5xFAD+','FontSize',20,'Location','best')

saveas(cdfCor,"cdfCor.svg")
%
%
%% violin plot for correct plus v minus
srComp = figure;
gg1 = repmat({'5xFAD-'},length(lme5xMinus{:,1}),1);
gg2= repmat({'5xFAD+'},length(lme5xPlus{:,1}),1);
gg=[gg1;gg2];
xx=[lme5xMinus{:,1};lme5xPlus{:,1}];
violinplot(xx,gg,'ShowMean', true,'ShowBox',false,'GroupOrder',{'5xFAD-','5xFAD+'});
title('5x+ vs 5x-:  Spike Rate Comparison for Right Turns ','FontSize',20)
ylabel('Event Rate','FontSize',14)

red=[255,0,0]/255;
blue =[0,0, 255]/255;
colors = [blue;red];
h = findobj(gca,'Tag','Box');
for j=1:length(h)
    patch(get(h(j),'XData'),get(h(j),'YData'),colors(j,:),'FaceAlpha',.5);
end
saveas(srComp,"srComp.svg")
%
%
figure;
%% histograms
histogram(minusSpikeRates,'BinWidth',.025,'Normalization','probability','FaceAlpha',.1,'FaceColor', [0 0.447 0.741])
hold on 
histogram(responsiveArrMinus,'BinWidth',.025,'Normalization','probability','FaceAlpha',.7,'FaceColor', [0 0.447 0.741])
xlabel(' Spike Rate','FontSize',20)
ylabel('Probability','FontSize',20)
title(' Spike Rate Comparison Around Right Turns: All Mice Included','FontSize',24)
legend('5x-',responsive5xMinStr,'FontSize',20)
xlim([0, theXLim]);

figure;

histogram(plusSpikeRates,'BinWidth',.025,'Normalization','probability','FaceAlpha',.1,'FaceColor', [0.85 0.325 0.098])
hold on 
histogram(responsiveArrPlus,'BinWidth',.025,'Normalization','probability','FaceAlpha',.7,'FaceColor', [0.85 0.325 0.098])
xlabel(' Spike Rate','FontSize',20)
ylabel('Probability','FontSize',20)
title(' Spike Rate Comparison Around Right Turns: All Mice Included','FontSize',24)
legend('5x+',responsive5xPlusStr,'FontSize',20)
xlim([0, theXLim]);

%% pie chart
figure;
t=tiledlayout(1,2);
nexttile
piechart([pctResponsiveMinus,pctNonResponsiveMinus],{'Responsive', 'Non Responsive'},'ColorOrder',[[0 0.447 0.741];[188 206 250]./255],'FontSize',20);
title('5x Minus')
nexttile
piechart([pctResponsivePlus,pctNonResponsivePlus],{'Responsive', 'Non Responsive'},'ColorOrder',[[0.85 0.325 0.098];[250 216 188]./255],'FontSize',20);
title('5x Plus')
title(t,'Right Turns ','FontSize',32,'FontWeight','Bold')

%% violin plot
figure;
gg1 = repmat({'5xFAD-'},length(minusSpikeRates),1);
gg2= repmat({'5xFAD+'},length(plusSpikeRates),1);
gg=[gg1;gg2];
xx=[minusSpikeRates;plusSpikeRates];
violinplot(xx,gg,'GroupOrder',{'5xFAD-','5xFAD+'});
[~,pTtAroundAlts] = ttest2(minusSpikeRates, plusSpikeRates);
[~,pKsAroundAlts] = kstest2(minusSpikeRates, plusSpikeRates);
title(' Spike Rate Comparison for Right Turns','FontSize',20)
ylabel('Event Rate','FontSize',14)

red=[255,0,0]/255;
blue =[0,0, 255]/255;
colors = [blue;red];
h = findobj(gca,'Tag','Box');
for j=1:length(h)
    patch(get(h(j),'XData'),get(h(j),'YData'),colors(j,:),'FaceAlpha',.5);
end
%}

save('CorVIncResponsiveness/Correct',"responsiveArrMinus","responsiveArrPlus",...
    "rPlus","rMinus","responsivePlus","responsiveMinus");

MinusResponsiveness = zeros(height(responsiveArrMinus),1);
for i=1:height(responsiveArrMinus)
    if ~isnan(responsiveArrMinus(i,:))
        MinusResponsiveness(i,:) = 1; %responsive
    else
        MinusResponsiveness(i,:) = 0; %unresponsive
    end
end

PlusResponsiveness = zeros(height(responsiveArrPlus),1);
for i=1:height(responsiveArrPlus)
    if ~isnan(responsiveArrPlus(i,:))
        PlusResponsiveness(i,:) = 1; %responsive
    else
        PlusResponsiveness(i,:) = 0; %unresponsive
    end
end

lme5xPlus.Properties.VariableNames([1])="spikeRateForCorrectAlts";
lme5xPlus.("PlusResponsiveness (1 for Responsive) ") =  PlusResponsiveness;
writetable(lme5xPlus,"PlusCorrectAltSpikeRates.csv")

lme5xMinus.Properties.VariableNames([1])="spikeRateForCorrectAlts";
lme5xMinus.("MinusResponsiveness  (1 for Responsive) ") = MinusResponsiveness;
writetable(lme5xMinus,"MinusCorrectAltSpikeRates.csv")

save('CorrectAltsDataForViolins.mat',"lme5xPlus","rPlus")

save('ResponsiveRowsCorrect.mat',"rMinus","rPlus")