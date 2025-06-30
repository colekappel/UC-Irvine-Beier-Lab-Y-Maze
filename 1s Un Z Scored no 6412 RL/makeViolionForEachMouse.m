function [] = makeViolionForEachMouse(spikeRate, mouseName, num, plusOrMinus,rgb)
subplot(4,3,num)
%srComp = figure;
gg1 = repmat({plusOrMinus},length(spikeRate),1);
gg=gg1;
xx=spikeRate;
violinplot(xx,gg,'ShowMean', true,'ShowBox',false,'GroupOrder',{plusOrMinus},'ViolinColor',rgb);
title(strcat('Violin For Mouse:',{' '},mouseName),'FontSize',20)
ylabel('Event Rate','FontSize',14)
ylim([0 0.4])

%v(1).FaceColor = [0 1 0]; % Green

end