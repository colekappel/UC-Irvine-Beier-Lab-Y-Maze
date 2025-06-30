clear

%% need to load in rMinus and rPlus

%save('CorVIncResponsiveness1sUnZScoredW6412_1stSesh_Correct','rPlus','rMinus',"responsivePlus","responsiveMinus");
cor_rMinus = load('CorVIncResponsiveness1sUnZScoredW6412_1stSesh_Correct.mat').rMinus;
cor_rPlus = load('CorVIncResponsiveness1sUnZScoredW6412_1stSesh_Correct.mat').rPlus;

%save('CorVIncResponsiveness1sUnZScoredW6412_1stSesh_Incorrect','rPlus','rMinus',"responsivePlus","responsiveMinus");
inc_rMinus = load('CorVIncResponsiveness1sUnZScoredW6412_1stSesh_Incorrect.mat').rMinus;
inc_rPlus = load('CorVIncResponsiveness1sUnZScoredW6412_1stSesh_Incorrect.mat').rPlus;


correctLmeMinus = load('CorrectAltsStats/lmeTables.mat').lme5xMinus(cor_rMinus,:);
correctLmePlus = load('CorrectAltsStats/lmeTables.mat').lme5xPlus(cor_rPlus,:);

incorrectLmeMinus = load('IncorrectAltsStats/lmeTables.mat').lme5xMinus(inc_rMinus,:);
incorrectLmePlus = load('IncorrectAltsStats/lmeTables.mat').lme5xPlus(inc_rPlus,:);


%% minus LME Model

minusLme = [correctLmeMinus;incorrectLmeMinus];

formulaMinus = 'spikeRate~correctOrIncorrect+(1|mouseID)';

lmeMinus= fitlme(minusLme,formulaMinus);

%% Plus LME Model

plusLme = [correctLmePlus;incorrectLmePlus];

formulaPlus = 'spikeRate~correctOrIncorrect+(1|mouseID)';

lmePlus= fitlme(plusLme,formulaPlus);

%% t test and ks tests
%
spikesCorrectMinus=correctLmeMinus{:,1};
spikesIncorrectMinus=incorrectLmeMinus{:,1};

spikesCorrectPlus=correctLmePlus{:,1};
spikesIncorrectPlus=incorrectLmePlus{:,1};

[~,pTtMinus] = ttest2(spikesCorrectMinus,spikesIncorrectMinus);
[~,pKsMinus] = kstest2(spikesCorrectMinus,spikesIncorrectMinus);

[~,pTtPlus] = ttest2(spikesCorrectPlus,spikesIncorrectPlus);
[~,pKsPlus] = kstest2(spikesCorrectPlus,spikesIncorrectPlus);
%{
%% cdf plots for minus
cdfplot(spikesIncorrectMinus);
hold on
cdfplot(spikesCorrectMinus);
title("5x- Correct vs Incorrect Alternations CDF Plot",'FontSize',14)
xlabel("Spike Rate",'FontSize',14);
ylabel("% of cells",'FontSize',14);
legend('Incorrect Alts','Correct Alts','FontSize',20,'Location','best')

figure;

%% cdf plots for plus
cdfplot(spikesIncorrectPlus);
hold on
cdfplot(spikesCorrectPlus);
title("5x+ Correct vs Incorrect Alternations CDF Plot",'FontSize',14)
xlabel("Spike Rate",'FontSize',14);
ylabel("% of cells",'FontSize',14);
legend('Incorrect Alts','Correct Alts','FontSize',20,'Location','best')
figure;
%
%
%% violin plot for minus
gg1 = repmat({'Incorrect'},length(spikesIncorrectMinus),1);
gg2= repmat({'Correct'},length(spikesCorrectMinus),1);
gg=[gg1;gg2];
xx=[spikesIncorrectMinus;spikesCorrectMinus];
violinplot(xx,gg,'ShowMean', true,'ShowBox',false,'GroupOrder',{'Incorrect','Correct'});
title('5x-: Incorrect vs Correct Alternations','FontSize',20)
ylabel('Event Rate','FontSize',14)

red=[255,0,0]/255;
blue =[0,0, 255]/255;
colors = [blue;red];
h = findobj(gca,'Tag','Box');
for j=1:length(h)
    patch(get(h(j),'XData'),get(h(j),'YData'),colors(j,:),'FaceAlpha',.5);
end
figure;

%% violin plot for plus
gg1 = repmat({'Incorrect'},length(spikesIncorrectPlus),1);
gg2= repmat({'Correct'},length(spikesCorrectPlus),1);
gg=[gg1;gg2];
xx=[spikesIncorrectPlus;spikesCorrectPlus];
violinplot(xx,gg,'ShowMean', true,'ShowBox',false,'GroupOrder',{'Incorrect','Correct'});
title('5x+: Incorrect vs Correct Alternations','FontSize',20)
ylabel('Event Rate','FontSize',14)

red=[255,0,0]/255;
blue =[0,0, 255]/255;
colors = [blue;red];
h = findobj(gca,'Tag','Box');
for j=1:length(h)
    patch(get(h(j),'XData'),get(h(j),'YData'),colors(j,:),'FaceAlpha',.5);
end
%}