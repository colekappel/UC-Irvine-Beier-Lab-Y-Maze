function spikeRateMatx = circShuffZScore(SPIKES,mouseName,times,iscpxStartFr,FR)
%% Correct the time stamps
%FR = 15;

timeToAdd = iscpxStartFr / FR;

SPIKES{:,1}=SPIKES{:,1} + timeToAdd; %SPIKES6025 unchanging after this

spikes = SPIKES; %spikes6025 changes for each time shift 


maxT = max(SPIKES{:,1});

cells = string(unique(spikes{:,2}));

%% find # spikes within 5s of the specified times
timeWindow = 3;

totalTime = length(times)*timeWindow*2;

%% get spike rate for whole recording
timeSpentRecording= max(SPIKES{:,1})-min(SPIKES{:,1});
numSpikes=zeros(size(cells));
for i = 1:height(cells)
    [rows,~]=find(string(SPIKES{:,2}) == cells(i));
    numSpikes(i,1)=height(rows);
end
spikeRateForWholeRec = numSpikes./timeSpentRecording;

%% get std array for z scoring:
timeBin = timeWindow*2;
numCols = ceil(max(SPIKES{:,1})/timeBin); 
numRows = height(cells);
spikeArrayDeltaT = zeros(numRows,numCols);

for i =1: height(cells)
cellName = cells(i);
rr = find(SPIKES{:,2}==cellName);
for j = 1:length(rr)
    % now need to figure where to add it to in the array: 
    % i think should be ceil( spikes{rr,2} /timeBin)
    spikeArrayDeltaT(i,round( SPIKES{j,3} /timeBin))=spikeArrayDeltaT(i,round( SPIKES{j,3} /timeBin))+1;
end
end

spikeArrayDeltaT = spikeArrayDeltaT./timeBin;
stdArray = std(spikeArrayDeltaT,0,2); % std for each cell 

srForEachTurnCircShuff = {};

%% circular shuffling: add delta t to spike times
spikeRateMatx = zeros(height(cells),100); %fills up w 100 random shuffle spike rates
for Ii = 1: 100 % 100 iterations of diff time stamps

deltaT_ = rand* maxT; %rand range is 0 to 1

spikes{:,1}=SPIKES{:,1} + deltaT_; 

% also shift values greater than max to amount over max, use find

[r,~]= find(spikes{:,1} > maxT);
spikes{r,1}=spikes{r,1}- maxT;

%% get a list of all rows that fall into those values then take the unique 
% values from those rows then just need the # of rows

rows=[];
for i= 1: length(times)
    [r,~]=find(times(i)-timeWindow<spikes{:,1} &spikes{:,1}<times(i)+timeWindow);
    rows = [rows;r];
end
rows = unique(rows);

vipSpikes = spikes(rows,:);

%% now want # of spikes in those time ranges for each cell

vipCellSpikes =[];

for i = 1: height(cells)
    [r,~]=find(string(vipSpikes{:,2})==cells{i});
    vipCellSpikes=[vipCellSpikes;height(r)];
end

spikeRate = vipCellSpikes ./ totalTime;

%% need to z score spikeRate:

zScoreSR_aroundAlts = zeros(length(stdArray),1);

for i = 1:length(zScoreSR_aroundAlts)
    zScoreSR_aroundAlts(i) = (spikeRate(i)-spikeRateForWholeRec(i))/stdArray(i);
end

spikeRate = zScoreSR_aroundAlts; % set spikeRate = to z score

spikeRateMatx(:,Ii) = spikeRate; % this is indexing by the column and for all cells

%% also get spike rate around each turn

%% vv bc we need std array - not too sure what it does
%{
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
%}
%% main code for sr for each turn 
srForEachTurn=zeros(height(cells),length(times));

for cellNum = 1:height(cells)
for i = 1:length(times)
    [Rr,~]=find(times(i)-timeWindow<spikes{:,1} & spikes{:,1}<times(i)+timeWindow...
     & spikes{:,2} ==cells(cellNum));
    srForEachTurn(cellNum,i)= (height(Rr)/2 - spikeRateForWholeRec(cellNum))/ stdArray(cellNum) ;
end
end

srForEachTurnCircShuff(Ii) = {srForEachTurn};

end

fileName = strcat('CircShuffDataZScore/spontAltCircShuff',mouseName);

save(fileName,"spikeRateMatx","srForEachTurnCircShuff");

disp(fileName);
end