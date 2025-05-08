clear

load('All_AUCS.mat');
load('corAndIncLmes.mat');
corLmes = load('corLMEs.mat');
incLmes = load('incLMEs.mat');

%% load in the 5x+ correct turn responsive rows and Inc turn responsive rows
fiveXPlusCorRespRows = load('newRows1sUnZscoredNo6412.mat').rowsPlusCorRespIncNR;
fiveXPlusIncRespRows = load('newRows1sUnZscoredNo6412.mat').rowsPlusIncRespCorNR;

%% copy above for minus:
fiveXMinusCorRespRows = load('newRows1sUnZscoredNo6412.mat').rowsMinusCorRespIncNR;
fiveXMinusIncRespRows = load('newRows1sUnZscoredNo6412.mat').rowsMinusIncRespCorNR;

%% get mouse IDs for LME
lmeMinusCor = correctLmeMinus(fiveXMinusCorRespRows,[2,3,4]);
lmeMinusInc = incorrectLmeMinus(fiveXMinusIncRespRows,[2,3,4]);

lmePlusCor = correctLmePlus(fiveXPlusCorRespRows,[2,3,4]);
lmePlusInc = incorrectLmePlus(fiveXPlusIncRespRows,[2,3,4]);

%% now to build tables for minus cor, minus inc , plus cor , plus inc
%% and need to make separate ones for separate time windows

%% minus cor tables
lmeMinusCor_0to3 = [lmeMinusCor, table(AUC_MinusCorResp0to3,'VariableNames',"auc") ];
lmeMinusCor_neg1to0 = [lmeMinusCor, table(AUC_MinusCorRespneg1to0,'VariableNames',"auc") ];
lmeMinusCor_neg3toneg1 = [lmeMinusCor, table(AUC_MinusCorRespneg3toneg1,'VariableNames',"auc") ];

%% minus inc tables 
lmeMinusInc_0to3 = [lmeMinusInc, table(AUC_MinusIncResp0to3,'VariableNames',"auc") ];
lmeMinusInc_neg1to0 = [lmeMinusInc, table(AUC_MinusIncRespneg1to0,'VariableNames',"auc") ];
lmeMinusInc_neg3toneg1 = [lmeMinusInc, table(AUC_MinusIncRespneg3toneg1,'VariableNames',"auc") ];

%% plus cor tables
lmePlusCor_0to3 = [lmePlusCor, table(AUC_PlusCorResp0to3,'VariableNames',"auc") ];
lmePlusCor_neg1to0 = [lmePlusCor, table(AUC_PlusCorRespneg1to0,'VariableNames',"auc") ];
lmePlusCor_neg3toneg1 = [lmePlusCor, table(AUC_PlusCorRespneg3toneg1,'VariableNames',"auc") ];

%% plus inc tables
lmePlusInc_0to3 = [lmePlusInc, table(AUC_PlusIncResp0to3,'VariableNames',"auc") ];
lmePlusInc_neg1to0 = [lmePlusInc, table(AUC_PlusIncRespneg1to0,'VariableNames',"auc") ];
lmePlusInc_neg3toneg1 = [lmePlusInc, table(AUC_PlusIncRespneg3toneg1,'VariableNames',"auc") ];

%% lme formulas
lmeFormulaCorVInc = 'auc~correctOrIncorrect+(1|mouseID)';
lmeFormulaPlusVMinus = 'auc~plusOrMinus+(1|mouseID)';

%% first make tables for minus cor v inc
lmeMinusCorVInc_0to3 = [lmeMinusCor_0to3 ; lmeMinusInc_0to3];

the_lmeMinusCorVInc_0to3 = fitlme(lmeMinusCorVInc_0to3,lmeFormulaCorVInc);

lmeMinusCorVInc_neg1to0 =[lmeMinusCor_neg1to0 ; lmeMinusInc_neg1to0];

the_lmeMinusCorVInc_neg1to0 = fitlme(lmeMinusCorVInc_neg1to0,lmeFormulaCorVInc);


lmeMinusCorVInc_neg3toneg1 = [lmeMinusCor_neg3toneg1 ; lmeMinusInc_neg3toneg1];

the_lmeMinusCorVInc_neg3toneg1 = fitlme(lmeMinusCorVInc_neg3toneg1,lmeFormulaCorVInc);

%% same tables for plus
lmePlusCorVInc_0to3 = [lmePlusCor_0to3 ; lmePlusInc_0to3];

the_lmePlusCorVInc_0to3 = fitlme(lmePlusCorVInc_0to3,lmeFormulaCorVInc);

lmePlusCorVInc_neg1to0 =[lmePlusCor_neg1to0 ; lmePlusInc_neg1to0];

the_lmePlusCorVInc_neg1to0 = fitlme(lmePlusCorVInc_neg1to0,lmeFormulaCorVInc);


lmePlusCorVInc_neg3toneg1 = [lmePlusCor_neg3toneg1 ; lmePlusInc_neg3toneg1];

the_lmePlusCorVInc_neg3toneg1 = fitlme(lmePlusCorVInc_neg3toneg1,lmeFormulaCorVInc);

%% now tables for minus vs plus comparisons : first cor
lmePlusVMinusCor_0to3 = [lmeMinusCor_0to3  ; lmePlusCor_0to3];

the_lmePlusVMinusCor_0to3 = fitlme(lmePlusVMinusCor_0to3,lmeFormulaPlusVMinus);

lmePlusVMinusCor_neg1to0 = [lmeMinusCor_neg1to0 ; lmePlusCor_neg1to0 ];

the_lmePlusVMinusCor_neg1to0 = fitlme(lmePlusVMinusCor_neg1to0,lmeFormulaPlusVMinus);

lmePlusVMinusCor_neg3toneg1 = [lmeMinusCor_neg3toneg1 ; lmePlusCor_neg3toneg1 ];

the_lmePlusVMinusCor_neg3toneg1 = fitlme(lmePlusVMinusCor_neg3toneg1,lmeFormulaPlusVMinus);

%% now comparisons for 5x+ vs 5x- incorrect

lmePlusVMinusInc_0to3 = [lmeMinusInc_0to3  ; lmePlusInc_0to3];

the_lmePlusVMinusInc_0to3 = fitlme(lmePlusVMinusInc_0to3,lmeFormulaPlusVMinus);

lmePlusVMinusInc_neg1to0 = [lmeMinusInc_neg1to0 ; lmePlusInc_neg1to0 ];

the_lmePlusVMinusInc_neg1to0 = fitlme(lmePlusVMinusInc_neg1to0,lmeFormulaPlusVMinus);

lmePlusVMinusInc_neg3toneg1 = [lmeMinusInc_neg3toneg1 ; lmePlusInc_neg3toneg1 ];

the_lmePlusVMinusInc_neg3toneg1 = fitlme(lmePlusVMinusInc_neg3toneg1,lmeFormulaPlusVMinus);
