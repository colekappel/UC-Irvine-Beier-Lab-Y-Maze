clear

correct = load('CorVIncResponsiveness/Correct.mat');
incorrect = load('CorVIncResponsiveness/Incorrect.mat');

%% start with minus
minusCountCorAndIncResp =0;
minusCountCorRespIncNonResp =0;
minusCountCorNonRespIncResp=0;
minusCountCorAndIncNonResp=0;

for i = 1: height(correct.responsiveArrMinus)
    if ~isnan(correct.responsiveArrMinus(i,1)) &&...
            ~isnan(incorrect.responsiveArrMinus(i,1)) 
        minusCountCorAndIncResp = minusCountCorAndIncResp+1;

    elseif ~isnan(correct.responsiveArrMinus(i,1)) &&...
            isnan(incorrect.responsiveArrMinus(i,1)) 
        minusCountCorRespIncNonResp = minusCountCorRespIncNonResp+1;

         elseif isnan(correct.responsiveArrMinus(i,1)) &&...
            ~isnan(incorrect.responsiveArrMinus(i,1)) 
        minusCountCorNonRespIncResp = minusCountCorNonRespIncResp+1;

         elseif isnan(correct.responsiveArrMinus(i,1)) &&...
            isnan(incorrect.responsiveArrMinus(i,1)) 
        minusCountCorAndIncNonResp = minusCountCorAndIncNonResp+1;
    end

end

minusPctCorAndIncResp = minusCountCorAndIncResp/height(correct.responsiveArrMinus);
minusPctCorRespIncNonResp = minusCountCorRespIncNonResp/height(correct.responsiveArrMinus);
minusPctCorNonRespIncResp = minusCountCorNonRespIncResp/height(correct.responsiveArrMinus);
minusPctCorAndIncNonResp = minusCountCorAndIncNonResp/height(correct.responsiveArrMinus);

%t=tiledlayout(1,2);
%t.Title.FontSize=40;
%a=nexttile;
%a.Title.FontSize=40;
thePie = figure;
subplot(1,2,1)
piechart([minusPctCorAndIncResp,minusPctCorRespIncNonResp,minusPctCorNonRespIncResp,minusPctCorAndIncNonResp],...
    {'C:R, I:R', 'C:R, I:NR','   C:NR, I:R','C:NR, I:NR'},'FontSize',24,ExplodedWedges=[1]);
%'ColorOrder',[[0 0.447 0.741];[188 206 250]./255] , {'C:R,I:R', 'C:R, I:NR','C:NR, I:R','C:NR, I:NR'}
title('Ctrl')
%figure;
%% now do plus
%3

plusCountCorAndIncResp =0;
plusCountCorRespIncNonResp =0;
plusCountCorNonRespIncResp=0;
plusCountCorAndIncNonResp=0;

for i = 1: height(correct.responsiveArrPlus)
    if ~isnan(correct.responsiveArrPlus(i,1)) &&...
            ~isnan(incorrect.responsiveArrPlus(i,1)) 
        plusCountCorAndIncResp = plusCountCorAndIncResp+1;

    elseif ~isnan(correct.responsiveArrPlus(i,1)) &&...
            isnan(incorrect.responsiveArrPlus(i,1)) 
        plusCountCorRespIncNonResp = plusCountCorRespIncNonResp+1;

         elseif isnan(correct.responsiveArrPlus(i,1)) &&...
            ~isnan(incorrect.responsiveArrPlus(i,1)) 
        plusCountCorNonRespIncResp = plusCountCorNonRespIncResp+1;

         elseif isnan(correct.responsiveArrPlus(i,1)) &&...
            isnan(incorrect.responsiveArrPlus(i,1)) 
        plusCountCorAndIncNonResp = plusCountCorAndIncNonResp+1;
    end

end

plusPctCorAndIncResp = plusCountCorAndIncResp/height(correct.responsiveArrPlus);
plusPctCorRespIncNonResp = plusCountCorRespIncNonResp/height(correct.responsiveArrPlus);
plusPctCorNonRespIncResp = plusCountCorNonRespIncResp/height(correct.responsiveArrPlus);
plusPctCorAndIncNonResp = plusCountCorAndIncNonResp/height(correct.responsiveArrPlus);

%nexttile

subplot(1,2,2)
piechart([plusPctCorAndIncResp,plusPctCorRespIncNonResp,plusPctCorNonRespIncResp,plusPctCorAndIncNonResp],...
    {'C:R, I:R', 'C:R, I:NR','C:NR, I:R','C:NR, I:NR'},'FontSize',24);
%'ColorOrder',[[0 0.447 0.741];[188 206 250]./255] , {'C:R,I:R', 'C:R, I:NR','C:NR, I:R','C:NR, I:NR'}
title('5xFAD')

t.Title.FontSize=40;

saveas(thePie, 'pieChart.svg');

%}