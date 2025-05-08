clear 

%% Initial mice: 

% plus mice: 6025, 6026, 6027, 6028, 6029

% minus mice: 6039, 6041, 6412, 6416, 6417, 6431

plusAccMatxShuffle =cell(1,100);
minusAccMatxShuffle =cell(1,100);

for Ii = 1:100 % num circular shufflings

%% 6025 Correct: 
srEachTurn6025Cor = load('CircShuffDataZScore/spontAltCircShuff6025CorrectAlts.mat').srForEachTurnCircShuff{Ii};

%% 6025 Incorrect: 
srEachTurn6025Inc =  load('CircShuffDataZScore/spontAltCircShuff6025IncorrectAlts.mat').srForEachTurnCircShuff{Ii};

%% 6027 Correct: 
srEachTurn6027Cor = load('CircShuffDataZScore/spontAltCircShuff6027CorrectAlts.mat').srForEachTurnCircShuff{Ii};

%% 6027 Incorrect: 
srEachTurn6027Inc = load('CircShuffDataZScore/spontAltCircShuff6027IncorrectAlts.mat').srForEachTurnCircShuff{Ii};

%% 6041 Correct: 
srEachTurn6041Cor = load('CircShuffDataZScore/spontAltCircShuff6041CorrectAlts.mat').srForEachTurnCircShuff{Ii};

%% 6041 Incorrect: 
srEachTurn6041Inc = load('CircShuffDataZScore/spontAltCircShuff6041IncorrectAlts.mat').srForEachTurnCircShuff{Ii};

%% More mice: 

%% 6026 Correct: 
srEachTurn6026Cor = load('CircShuffDataZScore/spontAltCircShuff6026CorrectAlts.mat').srForEachTurnCircShuff{Ii};

%% 6026 Incorrect: 
srEachTurn6026Inc = load('CircShuffDataZScore/spontAltCircShuff6026IncorrectAlts.mat').srForEachTurnCircShuff{Ii};

%% 6028 Correct: 
srEachTurn6028Cor = load('CircShuffDataZScore/spontAltCircShuff6028CorrectAlts.mat').srForEachTurnCircShuff{Ii};

%% 6028 Incorrect: 
srEachTurn6028Inc = load('CircShuffDataZScore/spontAltCircShuff6028IncorrectAlts.mat').srForEachTurnCircShuff{Ii};

%% 6029 Correct: 
srEachTurn6029Cor = load('CircShuffDataZScore/spontAltCircShuff6029CorrectAlts.mat').srForEachTurnCircShuff{Ii};

%% 6029 Incorrect: 
srEachTurn6029Inc = load('CircShuffDataZScore/spontAltCircShuff6029IncorrectAlts.mat').srForEachTurnCircShuff{Ii};


%% 6039 Correct: 
srEachTurn6039Cor = load('CircShuffDataZScore/spontAltCircShuff6039CorrectAlts.mat').srForEachTurnCircShuff{Ii};

%% 6039 Incorrect: 
srEachTurn6039Inc = load('CircShuffDataZScore/spontAltCircShuff6039IncorrectAlts.mat').srForEachTurnCircShuff{Ii};

%% new mice to add: 6412, 6416, 6417, 6431

%% 6412 Correct
srEachTurn6412Cor = load('CircShuffDataZScore/spontAltCircShuff6412CorrectAlts.mat').srForEachTurnCircShuff{Ii};

%% 6412 Incorrect
srEachTurn6412Inc = load('CircShuffDataZScore/spontAltCircShuff6412IncorrectAlts.mat').srForEachTurnCircShuff{Ii};

%% 6416 Correct 
srEachTurn6416Cor = load('CircShuffDataZScore/spontAltCircShuff6416CorrectAlts.mat').srForEachTurnCircShuff{Ii};

%% 6416 Incorrect 
srEachTurn6416Inc = load('CircShuffDataZScore/spontAltCircShuff6416IncorrectAlts.mat').srForEachTurnCircShuff{Ii};

%% 6417 Correct 
srEachTurn6417Cor = load('CircShuffDataZScore/spontAltCircShuff6417CorrectAlts.mat').srForEachTurnCircShuff{Ii};

%% 6417 Incorrect 
srEachTurn6417Inc = load('CircShuffDataZScore/spontAltCircShuff6417IncorrectAlts.mat').srForEachTurnCircShuff{Ii};

%% 6431 Correct 
srEachTurn6431Cor = load('CircShuffDataZScore/spontAltCircShuff6431CorrectAlts.mat').srForEachTurnCircShuff{Ii};

%% 6431 Incorrect 
srEachTurn6431Inc = load('CircShuffDataZScore/spontAltCircShuff6431IncorrectAlts.mat').srForEachTurnCircShuff{Ii};

% want vectors of acc corrAcc and incAcc for plus and minus separately 
% plus mice: 6025, 6026, 6027, 6028, 6029

% minus mice: 6039, 6041, 6412, 6416, 6417, 6431

%% need to modify these so incorrect and correct have same num turns:

%% 6026 needs 16 inc
srEachTurn6026Inc(:,17:20)=[];
x6026 = [srEachTurn6026Cor, srEachTurn6026Inc];
labels6026=[ones(1,width(srEachTurn6026Cor)),zeros(1,width(srEachTurn6026Inc))];

%% 6027 needs 14 cor
srEachTurn6027Cor(:,15:24)=[];
x6027 = [srEachTurn6027Cor, srEachTurn6027Inc];
labels6027=[ones(1,width(srEachTurn6027Cor)),zeros(1,width(srEachTurn6027Inc))];

%% 6028 is good
x6028 = [srEachTurn6028Cor, srEachTurn6028Inc];
labels6028=[ones(1,width(srEachTurn6028Cor)),zeros(1,width(srEachTurn6028Inc))];

%% 6029 needs 14 correct 
srEachTurn6029Cor(:,15:17)=[];
x6029 = [srEachTurn6029Cor, srEachTurn6029Inc];
labels6029=[ones(1,width(srEachTurn6029Cor)),zeros(1,width(srEachTurn6029Inc))];

%% 6039 needs 4 correct 
srEachTurn6039Cor(:,5:15)=[];
x6039 = [srEachTurn6039Cor, srEachTurn6039Inc];
labels6039=[ones(1,width(srEachTurn6039Cor)),zeros(1,width(srEachTurn6039Inc))];

%% 6041 needs 15 correct
srEachTurn6041Cor(:,16:23)=[];
x6041 = [srEachTurn6041Cor, srEachTurn6041Inc];
labels6041=[ones(1,width(srEachTurn6041Cor)),zeros(1,width(srEachTurn6041Inc))];

%% 6412 needs 28 correct 
srEachTurn6412Cor(:,29:end)=[];
x6412 = [srEachTurn6412Cor, srEachTurn6412Inc];
labels6412=[ones(1,width(srEachTurn6412Cor)),zeros(1,width(srEachTurn6412Inc))];

%% 6416 needs 19 correct 
srEachTurn6416Cor(:,20:end)=[];
x6416 = [srEachTurn6416Cor, srEachTurn6416Inc];
labels6416 =[ones(1,width(srEachTurn6416Cor)),zeros(1,width(srEachTurn6416Inc))];

%% 6417 needs 4 incorrect
srEachTurn6417Inc(:,5:end)=[];
x6417 = [srEachTurn6417Cor, srEachTurn6417Inc];
labels6417 =[ones(1,width(srEachTurn6417Cor)),zeros(1,width(srEachTurn6417Inc))];

%% 6431 needs 13 correct
srEachTurn6431Cor(:,14:end)=[];
x6431 = [srEachTurn6431Cor, srEachTurn6431Inc];
labels6431 =[ones(1,width(srEachTurn6431Cor)),zeros(1,width(srEachTurn6431Inc))];

%% 6025 needs 6 correct
srEachTurn6025Cor(:,7:end)=[];
x6025 = [srEachTurn6025Cor, srEachTurn6025Inc];
labels6025 =[ones(1,width(srEachTurn6025Cor)),zeros(1,width(srEachTurn6025Inc))];

%% model for 6025
NUMneurons = height(srEachTurn6025Cor); % change to select diff nums of neurons

NumTests = 1; % dont change: (this was 100 to start but changing to 1 bc use all neurons

numLeave1outTests = 500;

accuracy6025=zeros(1,NumTests);
corrAccuracy6025 = zeros(1,NumTests);
incAccuracy6025 = zeros(1,NumTests);
for i = 1:NumTests

    %jj = randsample(1:height(x6025),NUMneurons);
    %model6025 = fitglm(transpose(x6025(jj,:)),labels6025,'Distribution','binomial');
    %predictions = round(predict(model6025,transpose(x6025(jj,:))));
    %accuracy6025(i) = (sum (predictions==transpose(labels6025)))/width(labels6025);
    acc=zeros(1,numLeave1outTests);
    corrAcc = zeros(1,numLeave1outTests);
    incAcc = zeros(1,numLeave1outTests);

    for k = 1:numLeave1outTests
        jj = randsample(1:height(x6025),NUMneurons); %get the 50 neurons
        ogMatx = transpose(x6025(jj,:));
        matxWo2Turns = ogMatx;
        
        %% select random turns to exclude
        firstTurn = randi([1 width(srEachTurn6025Inc)]);
        secondTurn = randi([width(srEachTurn6025Inc)+1 width(srEachTurn6025Inc)*2]);

        matxWo2Turns([firstTurn,secondTurn],:)=[];
        labels6025Wo2turns = labels6025;
        labels6025Wo2turns(:,[firstTurn,secondTurn])=[];
        model6025 = fitglm(matxWo2Turns,labels6025Wo2turns,'Distribution','binomial'); % fit model without 2 turns
        predictions = round(predict(model6025,transpose(x6025(jj,[firstTurn,secondTurn]))));
        acc(k) = (sum (predictions==transpose(labels6025([1,width(srEachTurn6025Inc)*2]))))/width(labels6025([firstTurn,secondTurn]));

        %% want another model for looking at only correct and incorrect turns 
        corrAcc(k) = predictions(1) == 1;
        incAcc(k) = predictions(2) == 0;

    end
    accuracy6025(i) = mean(acc);
    corrAccuracy6025(i) = mean(corrAcc);
    incAccuracy6025(i) = mean(incAcc);
end

%% model for 6026
NUMneurons = height(srEachTurn6026Cor); % change to select diff nums of neurons

NumTests = 1; % dont change: (this was 100 to start but changing to 1 bc use all neurons

numLeave1outTests = 500;

accuracy6026=zeros(1,NumTests);
corrAccuracy6026 = zeros(1,NumTests);
incAccuracy6026 = zeros(1,NumTests);
for i = 1:NumTests

    %jj = randsample(1:height(x6026),NUMneurons);
    %model6026 = fitglm(transpose(x6026(jj,:)),labels6026,'Distribution','binomial');
    %predictions = round(predict(model6026,transpose(x6026(jj,:))));
    %accuracy6026(i) = (sum (predictions==transpose(labels6026)))/width(labels6026);
    acc=zeros(1,numLeave1outTests);
    corrAcc = zeros(1,numLeave1outTests);
    incAcc = zeros(1,numLeave1outTests);
    for k = 1:numLeave1outTests
        jj = randsample(1:height(x6026),NUMneurons); %get the 50 neurons
        ogMatx = transpose(x6026(jj,:));
        matxWo2Turns = ogMatx;
        
        %% select random turns to exclude
        firstTurn = randi([1 width(srEachTurn6026Inc)]);
        secondTurn = randi([width(srEachTurn6026Inc)+1 width(srEachTurn6026Inc)*2]);

        matxWo2Turns([firstTurn,secondTurn],:)=[];
        labels6026Wo2turns = labels6026;
        labels6026Wo2turns(:,[firstTurn,secondTurn])=[];
        model6026 = fitglm(matxWo2Turns,labels6026Wo2turns,'Distribution','binomial'); % fit model without 2 turns
        predictions = round(predict(model6026,transpose(x6026(jj,[firstTurn,secondTurn]))));
        acc(k) = (sum (predictions==transpose(labels6026([1,width(srEachTurn6026Inc)*2]))))/width(labels6026([firstTurn,secondTurn]));

        %% want another model for looking at only correct and incorrect turns 
        corrAcc(k) = predictions(1) == 1;
        incAcc(k) = predictions(2) == 0;

    end
    accuracy6026(i) = mean(acc);
    corrAccuracy6026(i) = mean(corrAcc);
    incAccuracy6026(i) = mean(incAcc);
end

%% model for 6027
NUMneurons = height(srEachTurn6027Cor); % change to select diff nums of neurons

NumTests = 1; % dont change: (this was 100 to start but changing to 1 bc use all neurons

numLeave1outTests = 500;

accuracy6027=zeros(1,NumTests);
corrAccuracy6027 = zeros(1,NumTests);
incAccuracy6027 = zeros(1,NumTests);
for i = 1:NumTests

    %jj = randsample(1:height(x6027),NUMneurons);
    %model6027 = fitglm(transpose(x6027(jj,:)),labels6027,'Distribution','binomial');
    %predictions = round(predict(model6027,transpose(x6027(jj,:))));
    %accuracy6027(i) = (sum (predictions==transpose(labels6027)))/width(labels6027);
    acc=zeros(1,numLeave1outTests);
    corrAcc = zeros(1,numLeave1outTests);
    incAcc = zeros(1,numLeave1outTests);
    for k = 1:numLeave1outTests
        jj = randsample(1:height(x6027),NUMneurons); %get the 50 neurons
        ogMatx = transpose(x6027(jj,:));
        matxWo2Turns = ogMatx;
        
        %% select random turns to exclude
        firstTurn = randi([1 width(srEachTurn6027Inc)]);
        secondTurn = randi([width(srEachTurn6027Inc)+1 width(srEachTurn6027Inc)*2]);

        matxWo2Turns([firstTurn,secondTurn],:)=[];
        labels6027Wo2turns = labels6027;
        labels6027Wo2turns(:,[firstTurn,secondTurn])=[];
        model6027 = fitglm(matxWo2Turns,labels6027Wo2turns,'Distribution','binomial'); % fit model without 2 turns
        predictions = round(predict(model6027,transpose(x6027(jj,[firstTurn,secondTurn]))));
        acc(k) = (sum (predictions==transpose(labels6027([1,width(srEachTurn6027Inc)*2]))))/width(labels6027([firstTurn,secondTurn]));

        %% want another model for looking at only correct and incorrect turns 
        corrAcc(k) = predictions(1) == 1;
        incAcc(k) = predictions(2) == 0;

    end
    accuracy6027(i) = mean(acc);
    corrAccuracy6027(i) = mean(corrAcc);
    incAccuracy6027(i) = mean(incAcc);
end

%% model for 6028
NUMneurons = height(srEachTurn6028Cor); % change to select diff nums of neurons

NumTests = 1; % dont change: (this was 100 to start but changing to 1 bc use all neurons

numLeave1outTests = 500;

accuracy6028=zeros(1,NumTests);
corrAccuracy6028 = zeros(1,NumTests);
incAccuracy6028 = zeros(1,NumTests);
for i = 1:NumTests

    %jj = randsample(1:height(x6028),NUMneurons);
    %model6028 = fitglm(transpose(x6028(jj,:)),labels6028,'Distribution','binomial');
    %predictions = round(predict(model6028,transpose(x6028(jj,:))));
    %accuracy6028(i) = (sum (predictions==transpose(labels6028)))/width(labels6028);
    acc=zeros(1,numLeave1outTests);
    corrAcc = zeros(1,numLeave1outTests);
    incAcc = zeros(1,numLeave1outTests);
    for k = 1:numLeave1outTests
        jj = randsample(1:height(x6028),NUMneurons); %get the 50 neurons
        ogMatx = transpose(x6028(jj,:));
        matxWo2Turns = ogMatx;
        
        %% select random turns to exclude
        firstTurn = randi([1 width(srEachTurn6028Inc)]);
        secondTurn = randi([width(srEachTurn6028Inc)+1 width(srEachTurn6028Inc)*2]);

        matxWo2Turns([firstTurn,secondTurn],:)=[];
        labels6028Wo2turns = labels6028;
        labels6028Wo2turns(:,[firstTurn,secondTurn])=[];
        model6028 = fitglm(matxWo2Turns,labels6028Wo2turns,'Distribution','binomial'); % fit model without 2 turns
        predictions = round(predict(model6028,transpose(x6028(jj,[firstTurn,secondTurn]))));
        acc(k) = (sum (predictions==transpose(labels6028([1,width(srEachTurn6028Inc)*2]))))/width(labels6028([firstTurn,secondTurn]));

        %% want another model for looking at only correct and incorrect turns 
        corrAcc(k) = predictions(1) == 1;
        incAcc(k) = predictions(2) == 0;

    end
    accuracy6028(i) = mean(acc);
    corrAccuracy6028(i) = mean(corrAcc);
    incAccuracy6028(i) = mean(incAcc);
end


%% model for 6029
NUMneurons = height(srEachTurn6029Cor); % change to select diff nums of neurons

NumTests = 1; % dont change: (this was 100 to start but changing to 1 bc use all neurons

numLeave1outTests = 500;

accuracy6029=zeros(1,NumTests);
corrAccuracy6029 = zeros(1,NumTests);
incAccuracy6029 = zeros(1,NumTests);
for i = 1:NumTests

    %jj = randsample(1:height(x6029),NUMneurons);
    %model6029 = fitglm(transpose(x6029(jj,:)),labels6029,'Distribution','binomial');
    %predictions = round(predict(model6029,transpose(x6029(jj,:))));
    %accuracy6029(i) = (sum (predictions==transpose(labels6029)))/width(labels6029);
    acc=zeros(1,numLeave1outTests);
    corrAcc = zeros(1,numLeave1outTests);
    incAcc = zeros(1,numLeave1outTests);
    for k = 1:numLeave1outTests
        jj = randsample(1:height(x6029),NUMneurons); %get the 50 neurons
        ogMatx = transpose(x6029(jj,:));
        matxWo2Turns = ogMatx;
        
        %% select random turns to exclude
        firstTurn = randi([1 width(srEachTurn6029Inc)]);
        secondTurn = randi([width(srEachTurn6029Inc)+1 width(srEachTurn6029Inc)*2]);

        matxWo2Turns([firstTurn,secondTurn],:)=[];
        labels6029Wo2turns = labels6029;
        labels6029Wo2turns(:,[firstTurn,secondTurn])=[];
        model6029 = fitglm(matxWo2Turns,labels6029Wo2turns,'Distribution','binomial'); % fit model without 2 turns
        predictions = round(predict(model6029,transpose(x6029(jj,[firstTurn,secondTurn]))));
        acc(k) = (sum (predictions==transpose(labels6029([1,width(srEachTurn6029Inc)*2]))))/width(labels6029([firstTurn,secondTurn]));

        %% want another model for looking at only correct and incorrect turns 
        corrAcc(k) = predictions(1) == 1;
        incAcc(k) = predictions(2) == 0;

    end
    accuracy6029(i) = mean(acc);
    corrAccuracy6029(i) = mean(corrAcc);
    incAccuracy6029(i) = mean(incAcc);
end

%% model for 6039
NUMneurons = height(srEachTurn6039Cor); % change to select diff nums of neurons

NumTests = 1; % dont change: (this was 100 to start but changing to 1 bc use all neurons

numLeave1outTests = 500;

accuracy6039=zeros(1,NumTests);
corrAccuracy6039 = zeros(1,NumTests);
incAccuracy6039 = zeros(1,NumTests);
for i = 1:NumTests

    %jj = randsample(1:height(x6039),NUMneurons);
    %model6039 = fitglm(transpose(x6039(jj,:)),labels6039,'Distribution','binomial');
    %predictions = round(predict(model6039,transpose(x6039(jj,:))));
    %accuracy6039(i) = (sum (predictions==transpose(labels6039)))/width(labels6039);
    acc=zeros(1,numLeave1outTests);
    corrAcc = zeros(1,numLeave1outTests);
    incAcc = zeros(1,numLeave1outTests);
    for k = 1:numLeave1outTests
        jj = randsample(1:height(x6039),NUMneurons); %get the 50 neurons
        ogMatx = transpose(x6039(jj,:));
        matxWo2Turns = ogMatx;
        
        %% select random turns to exclude
        firstTurn = randi([1 width(srEachTurn6039Inc)]);
        secondTurn = randi([width(srEachTurn6039Inc)+1 width(srEachTurn6039Inc)*2]);

        matxWo2Turns([firstTurn,secondTurn],:)=[];
        labels6039Wo2turns = labels6039;
        labels6039Wo2turns(:,[firstTurn,secondTurn])=[];
        model6039 = fitglm(matxWo2Turns,labels6039Wo2turns,'Distribution','binomial'); % fit model without 2 turns
        predictions = round(predict(model6039,transpose(x6039(jj,[firstTurn,secondTurn]))));
        acc(k) = (sum (predictions==transpose(labels6039([1,width(srEachTurn6039Inc)*2]))))/width(labels6039([firstTurn,secondTurn]));

        %% want another model for looking at only correct and incorrect turns 
        corrAcc(k) = predictions(1) == 1;
        incAcc(k) = predictions(2) == 0;

    end
    accuracy6039(i) = mean(acc);
    corrAccuracy6039(i) = mean(corrAcc);
    incAccuracy6039(i) = mean(incAcc);
end


%% model for 6041
NUMneurons = height(srEachTurn6041Cor); % change to select diff nums of neurons

NumTests = 1; % dont change: (this was 100 to start but changing to 1 bc use all neurons

numLeave1outTests = 500;

accuracy6041=zeros(1,NumTests);
corrAccuracy6041 = zeros(1,NumTests);
incAccuracy6041 = zeros(1,NumTests);
for i = 1:NumTests

    %jj = randsample(1:height(x6041),NUMneurons);
    %model6041 = fitglm(transpose(x6041(jj,:)),labels6041,'Distribution','binomial');
    %predictions = round(predict(model6041,transpose(x6041(jj,:))));
    %accuracy6041(i) = (sum (predictions==transpose(labels6041)))/width(labels6041);
    acc=zeros(1,numLeave1outTests);
    corrAcc = zeros(1,numLeave1outTests);
    incAcc = zeros(1,numLeave1outTests);
    for k = 1:numLeave1outTests
        jj = randsample(1:height(x6041),NUMneurons); %get the 50 neurons
        ogMatx = transpose(x6041(jj,:));
        matxWo2Turns = ogMatx;
        
        %% select random turns to exclude
        firstTurn = randi([1 width(srEachTurn6041Inc)]);
        secondTurn = randi([width(srEachTurn6041Inc)+1 width(srEachTurn6041Inc)*2]);

        matxWo2Turns([firstTurn,secondTurn],:)=[];
        labels6041Wo2turns = labels6041;
        labels6041Wo2turns(:,[firstTurn,secondTurn])=[];
        model6041 = fitglm(matxWo2Turns,labels6041Wo2turns,'Distribution','binomial'); % fit model without 2 turns
        predictions = round(predict(model6041,transpose(x6041(jj,[firstTurn,secondTurn]))));
        acc(k) = (sum (predictions==transpose(labels6041([1,width(srEachTurn6041Inc)*2]))))/width(labels6041([firstTurn,secondTurn]));

        %% want another model for looking at only correct and incorrect turns 
        corrAcc(k) = predictions(1) == 1;
        incAcc(k) = predictions(2) == 0;

    end
    accuracy6041(i) = mean(acc);
    corrAccuracy6041(i) = mean(corrAcc);
    incAccuracy6041(i) = mean(incAcc);
end

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

%% model for 6416
NUMneurons = height(srEachTurn6416Cor); % change to select diff nums of neurons

NumTests = 1; % dont change: (this was 100 to start but changing to 1 bc use all neurons

numLeave1outTests = 500;

accuracy6416=zeros(1,NumTests);
corrAccuracy6416 = zeros(1,NumTests);
incAccuracy6416 = zeros(1,NumTests);
for i = 1:NumTests

    %jj = randsample(1:height(x6416),NUMneurons);
    %model6416 = fitglm(transpose(x6416(jj,:)),labels6416,'Distribution','binomial');
    %predictions = round(predict(model6416,transpose(x6416(jj,:))));
    %accuracy6416(i) = (sum (predictions==transpose(labels6416)))/width(labels6416);
    acc=zeros(1,numLeave1outTests);
    corrAcc = zeros(1,numLeave1outTests);
    incAcc = zeros(1,numLeave1outTests);
    for k = 1:numLeave1outTests
        jj = randsample(1:height(x6416),NUMneurons); %get the 50 neurons
        ogMatx = transpose(x6416(jj,:));
        matxWo2Turns = ogMatx;
        
        %% select random turns to exclude
        firstTurn = randi([1 width(srEachTurn6416Inc)]);
        secondTurn = randi([width(srEachTurn6416Inc)+1 width(srEachTurn6416Inc)*2]);

        matxWo2Turns([firstTurn,secondTurn],:)=[];
        labels6416Wo2turns = labels6416;
        labels6416Wo2turns(:,[firstTurn,secondTurn])=[];
        model6416 = fitglm(matxWo2Turns,labels6416Wo2turns,'Distribution','binomial'); % fit model without 2 turns
        predictions = round(predict(model6416,transpose(x6416(jj,[firstTurn,secondTurn]))));
        acc(k) = (sum (predictions==transpose(labels6416([1,width(srEachTurn6416Inc)*2]))))/width(labels6416([firstTurn,secondTurn]));

        %% want another model for looking at only correct and incorrect turns 
        corrAcc(k) = predictions(1) == 1;
        incAcc(k) = predictions(2) == 0;

    end
    accuracy6416(i) = mean(acc);
    corrAccuracy6416(i) = mean(corrAcc);
    incAccuracy6416(i) = mean(incAcc);
end

%% model for 6417
NUMneurons = height(srEachTurn6417Cor); % change to select diff nums of neurons

NumTests = 1; % dont change: (this was 100 to start but changing to 1 bc use all neurons

numLeave1outTests = 500;

accuracy6417=zeros(1,NumTests);
corrAccuracy6417 = zeros(1,NumTests);
incAccuracy6417 = zeros(1,NumTests);
for i = 1:NumTests

    %jj = randsample(1:height(x6417),NUMneurons);
    %model6417 = fitglm(transpose(x6417(jj,:)),labels6417,'Distribution','binomial');
    %predictions = round(predict(model6417,transpose(x6417(jj,:))));
    %accuracy6417(i) = (sum (predictions==transpose(labels6417)))/width(labels6417);
    acc=zeros(1,numLeave1outTests);
    corrAcc = zeros(1,numLeave1outTests);
    incAcc = zeros(1,numLeave1outTests);
    for k = 1:numLeave1outTests
        jj = randsample(1:height(x6417),NUMneurons); %get the 50 neurons
        ogMatx = transpose(x6417(jj,:));
        matxWo2Turns = ogMatx;
        
        %% select random turns to exclude
        firstTurn = randi([1 width(srEachTurn6417Inc)]);
        secondTurn = randi([width(srEachTurn6417Inc)+1 width(srEachTurn6417Inc)*2]);

        matxWo2Turns([firstTurn,secondTurn],:)=[];
        labels6417Wo2turns = labels6417;
        labels6417Wo2turns(:,[firstTurn,secondTurn])=[];
        model6417 = fitglm(matxWo2Turns,labels6417Wo2turns,'Distribution','binomial'); % fit model without 2 turns
        predictions = round(predict(model6417,transpose(x6417(jj,[firstTurn,secondTurn]))));
        acc(k) = (sum (predictions==transpose(labels6417([1,width(srEachTurn6417Inc)*2]))))/width(labels6417([firstTurn,secondTurn]));

        %% want another model for looking at only correct and incorrect turns 
        corrAcc(k) = predictions(1) == 1;
        incAcc(k) = predictions(2) == 0;

    end
    accuracy6417(i) = mean(acc);
    corrAccuracy6417(i) = mean(corrAcc);
    incAccuracy6417(i) = mean(incAcc);
end

%% model for 6431
NUMneurons = height(srEachTurn6431Cor); % change to select diff nums of neurons

NumTests = 1; % dont change: (this was 100 to start but changing to 1 bc use all neurons

numLeave1outTests = 500;

accuracy6431=zeros(1,NumTests);
corrAccuracy6431 = zeros(1,NumTests);
incAccuracy6431 = zeros(1,NumTests);
for i = 1:NumTests

    %jj = randsample(1:height(x6431),NUMneurons);
    %model6431 = fitglm(transpose(x6431(jj,:)),labels6431,'Distribution','binomial');
    %predictions = round(predict(model6431,transpose(x6431(jj,:))));
    %accuracy6431(i) = (sum (predictions==transpose(labels6431)))/width(labels6431);
    acc=zeros(1,numLeave1outTests);
    corrAcc = zeros(1,numLeave1outTests);
    incAcc = zeros(1,numLeave1outTests);
    for k = 1:numLeave1outTests
        jj = randsample(1:height(x6431),NUMneurons); %get the 50 neurons
        ogMatx = transpose(x6431(jj,:));
        matxWo2Turns = ogMatx;
        
        %% select random turns to exclude
        firstTurn = randi([1 width(srEachTurn6431Inc)]);
        secondTurn = randi([width(srEachTurn6431Inc)+1 width(srEachTurn6431Inc)*2]);

        matxWo2Turns([firstTurn,secondTurn],:)=[];
        labels6431Wo2turns = labels6431;
        labels6431Wo2turns(:,[firstTurn,secondTurn])=[];
        model6431 = fitglm(matxWo2Turns,labels6431Wo2turns,'Distribution','binomial'); % fit model without 2 turns
        predictions = round(predict(model6431,transpose(x6431(jj,[firstTurn,secondTurn]))));
        acc(k) = (sum (predictions==transpose(labels6431([1,width(srEachTurn6431Inc)*2]))))/width(labels6431([firstTurn,secondTurn]));

        %% want another model for looking at only correct and incorrect turns 
        corrAcc(k) = predictions(1) == 1;
        incAcc(k) = predictions(2) == 0;

    end
    accuracy6431(i) = mean(acc);
    corrAccuracy6431(i) = mean(corrAcc);
    incAccuracy6431(i) = mean(incAcc);
end


%save('AllMiceAccuracies')

%{
%% srComp = figure;
gg1 = repmat({'5xFAD-'},length(accuracy6041),1);
gg2= repmat({'5xFAD+'},length(accuracy6027),1);
gg3 = repmat({'5xFAD- Correct'},length(corrAccuracy6041),1);
gg4= repmat({'5xFAD+ Correct'},length(corrAccuracy6027),1);
gg5 = repmat({'5xFAD- Incorrect'},length(incAccuracy6041),1);
gg6= repmat({'5xFAD+ Incorrect'},length(incAccuracy6027),1);
%
%
gg=[gg1;gg2;gg3;gg4;gg5;gg6];
xx=[accuracy6041, accuracy6027,corrAccuracy6041,corrAccuracy6027,incAccuracy6041,incAccuracy6027];
violinplot(xx,gg,'ShowMean', true,'ShowBox',false,'GroupOrder',{'5xFAD-','5xFAD+','5xFAD- Correct',...
    '5xFAD+ Correct','5xFAD- Incorrect','5xFAD+ Incorrect'});
title(strcat({'5x+ vs 5x-: Accuracy of Model for 100 Shuffles of '},string(NUMneurons),' Random Neurons'),'FontSize',20);
ylabel('Accuracy','FontSize',14)

red=[255,0,0]/255;
blue =[0,0, 255]/255;
colors = [blue;red];
h = findobj(gca,'Tag','Box');
for j=1:length(h)
    patch(get(h(j),'XData'),get(h(j),'YData'),colors(j,:),'FaceAlpha',.5);
end
%}
%saveas(srComp,"srComp.svg")

p=ranksum(accuracy6027,accuracy6041);

%tableLabels = ["5x+";"5x-"];

accuracyCSV = array2table( [transpose(accuracy6027),transpose(accuracy6041)],...
    'VariableNames',{'5x+','5x-'});




writetable(accuracyCSV,strcat('N',string(NUMneurons),"accuracyCSV.csv"))

mean6027 = mean(accuracy6027); 

mean6041 = mean(accuracy6041); 

median6027 = median(accuracy6027); 

median6041 = median(accuracy6041); 

% want vectors of acc corrAcc and incAcc for plus and minus separately 
% plus mice: 6025, 6026, 6027, 6028, 6029

% minus mice: 6039, 6041, 6412, 6416, 6417, 6431

plusAcc = [ accuracy6025;accuracy6026;accuracy6027;accuracy6028;accuracy6029];
plusCorrAcc = [ corrAccuracy6025;corrAccuracy6026;corrAccuracy6027;...
    corrAccuracy6028;corrAccuracy6029];
plusIncAcc = [ incAccuracy6025;incAccuracy6026; incAccuracy6027;...
    incAccuracy6028; incAccuracy6029];

plusAccMatx = [plusAcc,plusCorrAcc,plusIncAcc];

minusAcc = [accuracy6039; accuracy6041;accuracy6412;accuracy6416;accuracy6417;...
    accuracy6431];
minusCorrAcc = [corrAccuracy6039; corrAccuracy6041; corrAccuracy6412;...
    corrAccuracy6416;corrAccuracy6417;corrAccuracy6431];
minusIncAcc = [incAccuracy6039; incAccuracy6041; incAccuracy6412;...
    incAccuracy6416; incAccuracy6417; incAccuracy6431];

minusAccMatx = [minusAcc,minusCorrAcc,minusIncAcc];

plusAccMatxShuffle(Ii)={plusAccMatx};
minusAccMatxShuffle(Ii)={minusAccMatx};

pPlusCorVInc=ranksum(plusCorrAcc,plusIncAcc);

xPA = ones(height(plusAcc),1);
xPCA = 2*ones(height(plusCorrAcc),1);
xPIA = 3*ones(height(plusIncAcc),1);

xPlus = [xPA,xPCA,xPIA];

xMA = 4*ones(height(minusAcc),1);
xMCA = 5*ones(height(minusCorrAcc),1);
xMIA = 6*ones(height(minusIncAcc),1);

xMinus = [xMA,xMCA, xMIA];

%{
plot(xPlus(1,:),plusAccMatx(1,:));
hold on 
plot(xPlus(2,:),plusAccMatx(2,:));
hold on 
plot(xPlus(3,:),plusAccMatx(3,:));
hold on 
plot(xPlus(4,:),plusAccMatx(4,:));
hold on 
plot(xPlus(5,:),plusAccMatx(5,:));
hold on 


plot(xMinus(1,:),minusAccMatx(1,:));
hold on 
plot(xMinus(2,:),minusAccMatx(2,:));
hold on 
plot(xMinus(3,:),minusAccMatx(3,:));
hold on 
plot(xMinus(4,:),minusAccMatx(4,:));
hold on 
plot(xMinus(5,:),minusAccMatx(5,:));
hold on 
plot(xMinus(6,:),minusAccMatx(6,:));

ylabel('Accuracy','FontSize',24);
title('Accuracy Scatterplot','FontSize',24);
xlim([0 7]);
figure;
%
plot(xPA,plusAcc,'o'); 
hold on 
plot(xPCA,plusCorrAcc,'o'); 
hold on 
plot(xPIA,plusIncAcc,'o'); 
hold on 
plot(xMA,minusAcc,'o'); 
hold on 
plot(xMCA,minusCorrAcc,'o'); 
hold on 
plot(xMIA,minusIncAcc,'o'); 
%}
ylabel('Accuracy','FontSize',24);
title('Accuracy Scatterplot','FontSize',24);
xlim([0 7]);
%}

meanPlusAcc = mean(plusAcc);
meanPlusCorrAcc = mean(plusCorrAcc);
meanPlusIncAcc = mean(plusIncAcc);
meanMinusAcc = mean(minusAcc);
meanMinusCorrAcc = mean(minusCorrAcc);
meanMinusIncAcc = mean(minusIncAcc);

%% save all variables from workspace after running
%save('allVariablesFromDecoderAnalysis');

disp(strcat(string(Ii/100),'% done'))

end
%}

% scatter plots for 10 and 50 neurons
%{
%% aic 
scatter(ones(1,length(aic6027)),aic6027)
hold on
scatter(2*ones(1,length(aic6041)),aic6041)
hold on 
%% aicc
scatter(3*ones(1,length(aicc6027)),aicc6027)
hold on 
scatter(4*ones(1,length(aicc6041)),aicc6041)
hold on 
%% bic 
scatter(5*ones(1,length(bic6027)),bic6027)
hold on 
scatter(6*ones(1,length(bic6041)),bic6041)
hold on 
%% caic
scatter(7*ones(1,length(caic6027)),caic6027)
hold on 
scatter(8*ones(1,length(caic6041)),caic6041)

title('Metrics Looking At 50 Neurons at a Time')
%}