clear

lme5xMinusCor_4mo = load('CorrectAlts_4months.mat').lme5xMinus;
lme5xPlusCor_4mo = load('CorrectAlts_4months.mat').lme5xPlus;

lme5xMinusCor_8mo = load('CorrectAlts_8months.mat').lme5xMinus;
lme5xPlusCor_8mo = load('CorrectAlts_8months.mat').lme5xPlus;

lme5xMinusInc_4mo = load('IncorrectAlts_4months.mat').lme5xMinus;
lme5xPlusInc_4mo = load('IncorrectAlts_4months.mat').lme5xPlus;

lme5xMinusInc_8mo = load('IncorrectAlts_8months.mat').lme5xMinus;
lme5xPlusInc_8mo = load('IncorrectAlts_8months.mat').lme5xPlus;



%% need to add age to tables: 9th column and -1 for 4 mo, +1 for 8 mo

lme5xMinusCor_4mo.age= int32(-1*ones(height(lme5xMinusCor_4mo),1));
lme5xPlusCor_4mo.age= int32(-1*ones(height(lme5xPlusCor_4mo),1));

lme5xMinusCor_8mo.age= int32(ones(height(lme5xMinusCor_8mo),1));
lme5xPlusCor_8mo.age= int32(ones(height(lme5xPlusCor_8mo),1));

lme5xMinusInc_4mo.age= -1*ones(height(lme5xMinusInc_4mo),1);
lme5xPlusInc_4mo.age= -1*ones(height(lme5xPlusInc_4mo),1);

lme5xMinusInc_8mo.age= ones(height(lme5xMinusInc_8mo),1);
lme5xPlusInc_8mo.age= ones(height(lme5xPlusInc_8mo),1);

%% need to stitch together tables for comparisons


minusCorTable = [lme5xMinusCor_4mo;lme5xMinusCor_8mo];

plusCorTable = [lme5xPlusCor_4mo;lme5xPlusCor_8mo];

minusIncTable = [lme5xMinusInc_4mo;lme5xMinusInc_8mo];

plusIncTable = [lme5xPlusInc_4mo;lme5xPlusInc_8mo];

%% now to make lme models

lmeFormula = 'spikeRate~age+(1|mouseID)';

lmeMinusCor = fitlme(minusCorTable,lmeFormula);
lmePlusCor = fitlme(plusCorTable,lmeFormula);
lmeMinusInc = fitlme(minusIncTable,lmeFormula);
lmePlusInc = fitlme(plusIncTable,lmeFormula);

mean4moCorMinus = mean(lme5xMinusCor_4mo{:,1});
mean8moCorMinus = mean(lme5xMinusCor_8mo{:,1});

mean4moCorPlus = mean(lme5xPlusCor_4mo{:,1});
mean8moCorPlus = mean(lme5xPlusCor_8mo{:,1});