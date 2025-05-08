clear
AccMatxShuffle_6412 =cell(1,100);

for Ii = 1:100 % num circular shufflings
%Ii = 1;
%% 6412 Correct
srEachTurn6412Cor = load('CircShuffDataZScore/spontAltCircShuff6412CorrectAlts.mat').srForEachTurnCircShuff{Ii};

%% 6412 Incorrect
srEachTurn6412Inc = load('CircShuffDataZScore/spontAltCircShuff6412IncorrectAlts.mat').srForEachTurnCircShuff{Ii};

%% 6412 cor needs 7 
srEachTurn6412Cor(:,8:end)=[];
x6412 = [srEachTurn6412Cor, srEachTurn6412Inc];
labels6412=[ones(1,width(srEachTurn6412Cor)),zeros(1,width(srEachTurn6412Inc))];


%% model for 6412
NUMneurons = height(srEachTurn6412Cor); % change to select diff nums of neurons

NumTests = 1; % dont change: (this was 100 to start but changing to 1 bc use all neurons

numLeave1outTests = 500;

accuracy6412=zeros(1,NumTests);
corrAccuracy6412 = zeros(1,NumTests);
incAccuracy6412 = zeros(1,NumTests);
for i = 1:NumTests

    %jj = randsample(1:height(x6412),NUMneurons);
    %model6412 = fitglm(transpose(x6412(jj,:)),labels6412,'Distribution','binomial');
    %predictions = round(predict(model6412,transpose(x6412(jj,:))));
    %accuracy6412(i) = (sum (predictions==transpose(labels6412)))/width(labels6412);
    acc=zeros(1,numLeave1outTests);
    corrAcc = zeros(1,numLeave1outTests);
    incAcc = zeros(1,numLeave1outTests);
    for k = 1:numLeave1outTests
        jj = randsample(1:height(x6412),NUMneurons); %get the 50 neurons
        ogMatx = transpose(x6412(jj,:));
        matxWo2Turns = ogMatx;
        
        %% select random turns to exclude
        firstTurn = randi([1 width(srEachTurn6412Inc)]);
        secondTurn = randi([width(srEachTurn6412Inc)+1 width(srEachTurn6412Inc)*2]);

        matxWo2Turns([firstTurn,secondTurn],:)=[];
        labels6412Wo2turns = labels6412;
        labels6412Wo2turns(:,[firstTurn,secondTurn])=[];
        model6412 = fitglm(matxWo2Turns,labels6412Wo2turns,'Distribution','binomial'); % fit model without 2 turns
        predictions = round(predict(model6412,transpose(x6412(jj,[firstTurn,secondTurn]))));
        acc(k) = (sum (predictions==transpose(labels6412([1,width(srEachTurn6412Inc)*2]))))/width(labels6412([firstTurn,secondTurn]));

        %% want another model for looking at only correct and incorrect turns 
        corrAcc(k) = predictions(1) == 1;
        incAcc(k) = predictions(2) == 0;

    end
    accuracy6412(i) = mean(acc);
    corrAccuracy6412(i) = mean(corrAcc);
    incAccuracy6412(i) = mean(incAcc);
end

AccMatx_6412 = [accuracy6412,corrAccuracy6412,incAccuracy6412];

AccMatxShuffle_6412(Ii)={AccMatx_6412};

disp(strcat(string(Ii),'% done'))

end