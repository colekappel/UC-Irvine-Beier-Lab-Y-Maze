clear 

%% spike rate matrices 5x+
spikeRates6025 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6025CorrectAlts.mat').spikeRateForWholeRec;
spikeRates6026 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6026CorrectAlts.mat').spikeRateForWholeRec;
spikeRates6027 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6027CorrectAlts.mat').spikeRateForWholeRec;
spikeRates6028 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6028CorrectAlts.mat').spikeRateForWholeRec;
spikeRates6029 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6029CorrectAlts.mat').spikeRateForWholeRec;

%% spike rate matrices 5x-
spikeRates6039 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6039CorrectAlts.mat').spikeRateForWholeRec;
spikeRates6041 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6041CorrectAlts.mat').spikeRateForWholeRec;

spikeRates6412 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6412CorrectAlts.mat').spikeRateForWholeRec;
spikeRates6416 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6416CorrectAlts.mat').spikeRateForWholeRec;
spikeRates6417 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6417CorrectAlts.mat').spikeRateForWholeRec;
spikeRates6431 = load('SpontAltSpikesAroundAlts/spikesAroundAlts6431CorrectAlts.mat').spikeRateForWholeRec;

%% violin plot for correct plus v minus
gg1 = repmat({'6025 5xFAD+'},length(spikeRates6025),1);
gg2 = repmat({'6026 5xFAD+'},length(spikeRates6026),1);
gg3 = repmat({'6027 5xFAD+'},length(spikeRates6027),1);
gg4 = repmat({'6028 5xFAD+'},length(spikeRates6028),1);
gg5 = repmat({'6029 5xFAD+'},length(spikeRates6029),1);

gg6 = repmat({'6039 5xFAD-'},length(spikeRates6039),1);
gg7 = repmat({'6041 5xFAD-'},length(spikeRates6041),1);
gg8 = repmat({'6412 5xFAD-'},length(spikeRates6412),1);
gg9 = repmat({'6416 5xFAD-'},length(spikeRates6416),1);
gg10 = repmat({'6417 5xFAD-'},length(spikeRates6417),1);
gg11 = repmat({'6431 5xFAD-'},length(spikeRates6431),1);

gg = [gg1;gg2;gg3;gg4;gg5;gg6;gg7;gg8;gg9;gg10;gg11];
xx = [spikeRates6025;spikeRates6026;spikeRates6027;...
    spikeRates6028;spikeRates6029;spikeRates6039;...
    spikeRates6041;spikeRates6412;spikeRates6416;...
    spikeRates6417;spikeRates6431];
violinplot(xx,gg,'ShowMean',true,'ShowBox',false,'GroupOrder',...
    {'6025 5xFAD+','6026 5xFAD+','6027 5xFAD+','6028 5xFAD+',...
    '6029 5xFAD+','6039 5xFAD-','6041 5xFAD-','6412 5xFAD-',...
    '6416 5xFAD-','6417 5xFAD-','6431 5xFAD-'});

ylabel('Spike Rate','FontSize',20)
title('Mouse by Mouse Violin Comparison','FontSize',24);

%function spikeRate = makeViolionForEachMouse(spikeRate, mouseName, num, plusOrMinus)

%{
%% 5x+ violins
makeViolionForEachMouse(spikeRates6025, '6025', 1, '5xFAD+',[1,0,0])
makeViolionForEachMouse(spikeRates6026, '6026', 2, '5xFAD+',[1,0,0])
makeViolionForEachMouse(spikeRates6027, '6027', 3, '5xFAD+',[1,0,0])
makeViolionForEachMouse(spikeRates6028, '6028', 4, '5xFAD+',[1,0,0])
makeViolionForEachMouse(spikeRates6029, '6029', 5, '5xFAD+',[1,0,0])

%%5x- violins
makeViolionForEachMouse(spikeRates6039, '6039', 6, '5xFAD-',[0,0,1])
makeViolionForEachMouse(spikeRates6041, '6041', 7, '5xFAD-',[0,0,1])
makeViolionForEachMouse(spikeRates6412, '6412', 8, '5xFAD-',[0,0,1])
makeViolionForEachMouse(spikeRates6416, '6416', 9, '5xFAD-',[0,0,1])
makeViolionForEachMouse(spikeRates6417, '6417', 10, '5xFAD-',[0,0,1])
makeViolionForEachMouse(spikeRates6431, '6431', 11, '5xFAD-',[0,0,1])
%}




%{
subplot(4,3,1)
%srComp = figure;
gg1 = repmat({'5xFAD+'},length(spikeRates6025),1);
gg=[gg1];
xx=[spikeRates6025];
violinplot(xx,gg,'ShowMean', true,'ShowBox',false,'GroupOrder',{'5xFAD+'});
title('Violin For Mouse: 6025','FontSize',20)
ylabel('Event Rate','FontSize',14)

% function: take in mouse number, spike rate matrix and number in subplot
%}