function spikeRate = getSpikesAroundAlts(spikes,mouseName,times,iscpxStartFr,...
    correctVsIncorrect,mouseString,groupID,FR)
% spikeRate is average spike rate around alts

%% Correct the time stamps
%FR = 15;


timeToAdd = iscpxStartFr / FR;

spikes{:,1}=spikes{:,1} + timeToAdd;

%% get whole rec event rate

spikeTimes = spikes{:,1};
totalTimeOfRec = max(spikeTimes) - min(spikeTimes);

cells = string(unique(spikes{:,2}));

numSpikesPerCell = zeros(height(cells),1);
for i = 1: height(cells)
    rows = find(cells(i)==spikes{:,2});
    numSpikesPerCell(i) = height(rows);
end

wholeErPerCell = numSpikesPerCell./ totalTimeOfRec;

%% find # spikes within 5s of the specified times
timeWindow = 1;

totalTime = length(times)*timeWindow*2;


%% get a list of all rows that fall into those values then take the unique 
% values from those rows then just need the # of rows

rows=[];
for i= 1: length(times)
    [r,~]=find(times(i)-timeWindow<spikes{:,1} &spikes{:,1}<times(i)+timeWindow);
    rows = [rows;r];
end
rows = unique(rows);

vipSpikes = spikes(rows,:);

%cells = string(unique(spikes{:,2}));

%% first thing to do in z scoring: get ERi 
% need to break up recording into delta t time bins 
% and into specific cells too 
%for i =1:


%% now want # of spikes in those time ranges for each cell

vipCellSpikes =[];

for i = 1: height(cells)
    [r,~]=find(string(vipSpikes{:,2})==cells{i});
    vipCellSpikes=[vipCellSpikes;height(r)];
end

spikeRate = vipCellSpikes ./ totalTime;

fileName = strcat('SpontAltSpikesAroundAlts/spikesAroundAlts',mouseName);

%% want to make table for lme model
mouseID=[];
correctOrIncorrect=[];
plusOrMinus = [];
for i =1:length(spikeRate)
    mouseID(i,1)=mouseString;
    correctOrIncorrect(i,1)=correctVsIncorrect;
    plusOrMinus(i,1)=groupID;
end

%lmeTable = table(spikeRate,correctOrIncorrect,mouseID,plusOrMinus);

%% get spike rate for whole recording
timeSpentRecording= max(spikes{:,1})-min(spikes{:,1});
numSpikes=zeros(size(cells));
for i = 1:height(cells)
    [rows,~]=find(string(spikes{:,2}) == cells(i));
    numSpikes(i,1)=height(rows);
end
spikeRateForWholeRec = numSpikes./timeSpentRecording;

%lmeTable = table(spikeRate,correctOrIncorrect,mouseID,plusOrMinus,spikeRateForWholeRec,cells);

deltaT = 0.1; %the bin size around the alternations ( 0.1 second bins)
numberOfBins= timeWindow*2/deltaT;
binnedSpikeRateAroundAlts = zeros(height(cells),numberOfBins);
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


%% code to get av amp per cell and event rate: copy pasted from other program

spikeDataLength=height(spikes);
%totalTimeSpikesRecorded=max(spikes{:,1})-min(spikes{:,1});
%try for 1 cell first:
i=1;
avAmplitudeForEachCell = zeros(1,length(cells));
amplitudeArray=[];
spikesPerCell=zeros(1,length(cells));
cellNamesNew=unique(spikes(:,2));
numCells=height(cellNamesNew);
for p = 1:numCells
     z=1;
     a=0;
     %sumAmplitude=0;
     while ismember(cellNamesNew(p,1),spikes(i,2))
        %newTable(i,:)=spikes5507(i,:);
        amplitudeArray(z)=spikes{i,3};
        i=i+1;
        z=z+1;
        a=a+1;
        if i>spikeDataLength
            break
        end
     end
     spikesPerCell(p)=a;
     avAmplitudeForEachCell(p)=mean(amplitudeArray);
     amplitudeArray=[];
end
avAmplitudeForEachCell =transpose(avAmplitudeForEachCell);

lmeTable = table(spikeRate,correctOrIncorrect,mouseID,...
    plusOrMinus,spikeRateForWholeRec,cells,avAmplitudeForEachCell);

avSpikeRate = mean(spikeRate);
avSpikeRateForWholeRec = mean(spikeRateForWholeRec);
avAmplitudeForMouse = mean(avAmplitudeForEachCell);
correctOrIncorrect = correctOrIncorrect(1);
mouseID = mouseID(1);
plusOrMinus = plusOrMinus(1);
lmeTableAvPerMouse = table(avSpikeRate,correctOrIncorrect,mouseID,...
    plusOrMinus,avSpikeRateForWholeRec,avAmplitudeForMouse);


save(fileName,"spikeRate","avSpikeRate","lmeTable","spikeRateForWholeRec","avSpikeRateForWholeRec",...
    "spikes","binnedSpikeRateAroundAlts","wholeErPerCell","cells","lmeTableAvPerMouse");
end