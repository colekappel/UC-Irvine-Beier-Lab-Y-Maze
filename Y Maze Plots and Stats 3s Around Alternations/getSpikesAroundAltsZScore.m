function spikeRate = getSpikesAroundAltsZScore(spikes,mouseName,times,iscpxStartFr,...
    correctVsIncorrect,mouseString,groupID,FR)
% spikeRate is average spike rate around alts

%% Correct the time stamps
%FR = 15;

timeToAdd = iscpxStartFr / FR;

spikes{:,1}=spikes{:,1} + timeToAdd;

%% find # spikes within 5s of the specified times
timeWindow = 3; % changed for new program

totalTime = length(times)*timeWindow*2;


%% get a list of all rows that fall into those values then take the unique 
% values from those rows then just need the # of rows

rows=[];
for i= 1: length(times)
    [r,~]=find(times(i)-timeWindow<spikes{:,1} & spikes{:,1}<times(i)+timeWindow);
    rows = [rows;r];
end
rows = unique(rows);

vipSpikes = spikes(rows,:);

cells = string(unique(spikes{:,2}));

%% now want # of spikes in those time ranges for each cell

vipCellSpikes =[];

for i = 1: height(cells)
    [r,~]=find(string(vipSpikes{:,2})==cells{i});
    vipCellSpikes=[vipCellSpikes;height(r)];
end

spikeRate = vipCellSpikes ./ totalTime;

fileName = strcat('SpontAltSpikesAroundAltsZScore/spikesAroundAlts',mouseName);

%% get spike rate for whole recording
timeSpentRecording= max(spikes{:,1})-min(spikes{:,1});
numSpikes=zeros(size(cells));
for i = 1:height(cells)
    [rows,~]=find(string(spikes{:,2}) == cells(i));
    numSpikes(i,1)=height(rows);
end
spikeRateForWholeRec = numSpikes./timeSpentRecording;

deltaT = 0.1; %the bin size around the alternations ( 0.1 second bins)
numberOfBins= timeWindow*2/deltaT;
binnedSpikeRateAroundAlts = zeros(height(cells),numberOfBins);

%% first thing to do in z scoring: get ERi 
% need to break up recording into delta t time bins 
% and into specific cells too 
%for i =1: height(cells)

%end

% first I should initialize an array to be # cells x total time / delta t #s
% have to get total time of recording which is max(spikes{:,1})
% rowArray = linspace(1,ceil(max(spikes{:,1})),ceil(max(spikes{:,1})));
timeBin = timeWindow*2;
numCols = ceil(max(spikes{:,1})/timeBin); % not sure if right
numRows = height(cells);
spikeArrayDeltaT = zeros(numRows,numCols);

%% try it for the first cell first (once works loop thru all cells)
%i = 1;
for i =1: height(cells)
cellName = cells(i);
rr = find(spikes{:,2}==cellName);
for j = 1:length(rr)
    % now need to figure where to add it to in the array: 
    % i think should be ceil( spikes{rr,2} /timeBin)
    spikeArrayDeltaT(i,ceil( spikes{j,3} /timeBin))=spikeArrayDeltaT(i,ceil( spikes{j,3} /timeBin))+1;
end
end

spikeArrayDeltaT = spikeArrayDeltaT./timeBin;
stdArray = std(spikeArrayDeltaT,0,2); % std for each cell 

zScoreSR_aroundAlts = zeros(length(stdArray),1);

for i = 1:length(zScoreSR_aroundAlts)
    zScoreSR_aroundAlts(i) = (spikeRate(i)-spikeRateForWholeRec(i))/stdArray(i);
end

spikeRate = zScoreSR_aroundAlts;

%% want to make table for lme model
mouseID=[];
correctOrIncorrect=[];
plusOrMinus = [];
for i =1:length(spikeRate)
    mouseID(i,1)=mouseString;
    correctOrIncorrect(i,1)=correctVsIncorrect;
    plusOrMinus(i,1)=groupID;
end

lmeTable = table(spikeRate,correctOrIncorrect,mouseID,plusOrMinus);



% so i think in the new batch of programs ill set spikeRate equal to
% zScoreSR_aroundAlts so then it will be easy to rerun everything

% ^ i think thats right but double check and then also have to loop
% thru all cells
% get the spike times for the cell to put in time bin


% now I just need to add the spikes from each cell to the time points in the 
% spikeArrayDeltaT array then I can use that to get the std of each cell 
% this is like the [ER1, ... , ER v] from the whiteboard

%% new code from 7/12 to get z scored sr for each turn
%% looks at sr calculated by spikes 1s b4 and after turns
srForEachTurn=zeros(height(cells),length(times));

for cellNum = 1:height(cells)
for i = 1:length(times)
    [Rr,~]=find(times(i)-timeWindow<spikes{:,1} & spikes{:,1}<times(i)+timeWindow...
     & spikes{:,2} ==cells(cellNum));
    srForEachTurn(cellNum,i)= (height(Rr)/2 - spikeRateForWholeRec(cellNum))/ stdArray(cellNum) ;
end
end



%% now want to change to loop thru cells
for bb = 1:length(cells)

for zz = 1: length(times);
cellToLookAt = cells(bb);
%firstAlternation = 55; % change to times(zz) where zz is index

cellNumber= bb; % eventually will change to loop this too

rowsToLookAt = find(vipSpikes{:,2}==string(cellToLookAt) & ...
    times(zz)-timeWindow<vipSpikes{:,1} & times(zz)+timeWindow>vipSpikes{:,1});

%% want to add the value to that bin
for jj = 1:length(rowsToLookAt)
% access time of spike: vipSpikes{jj,Time_s_}
    timeOfSpike= vipSpikes{rowsToLookAt(jj),1};
    binToAddTo = ceil( ( timeOfSpike- (times(zz) - timeWindow) )/deltaT );
    binnedSpikeRateAroundAlts(cellNumber,binToAddTo)= binnedSpikeRateAroundAlts(cellNumber,binToAddTo) +1;
end
end
end
binnedSpikeRateAroundAlts = binnedSpikeRateAroundAlts./deltaT;
%
%% z scoring binned spike rates: first calculate std w delta T = 0.1

timeBin = deltaT;
numCols = ceil(max(spikes{:,1})/timeBin); % not sure if right
numRows = height(cells);
spikeArrayDeltaT2 = zeros(numRows,numCols);

%% try it for the first cell first (once works loop thru all cells)
%i = 1;
%j=1;

for i =1: height(cells)
cellName = cells(i);
rr = find(spikes{:,2}==cellName);
for j = 1:length(rr)
    % now need to figure where to add it to in the array: 
    % i think should be ceil( spikes{rr,2} /timeBin)
    spikeArrayDeltaT2(i,round( spikes{j,3} /timeBin))=spikeArrayDeltaT2(i,round( spikes{j,3} /timeBin))+1;
end
end

spikeArrayDeltaT2 = spikeArrayDeltaT2./timeBin;
stdArray2 = std(spikeArrayDeltaT2,0,2); % std for each cell 
%
%% need to z score these binned spike rates around alts: 
twentyBinZScore = zeros(length(stdArray2),width(binnedSpikeRateAroundAlts));
for j =1:width(binnedSpikeRateAroundAlts)
for i = 1:length(stdArray2)
    twentyBinZScore(i,j) = (binnedSpikeRateAroundAlts(i,j)-spikeRateForWholeRec(i))/stdArray2(i);
end
end
binnedSpikeRateAroundAlts = twentyBinZScore;

save(fileName,"spikeRate","lmeTable","spikeRateForWholeRec","spikes","binnedSpikeRateAroundAlts","srForEachTurn");
end