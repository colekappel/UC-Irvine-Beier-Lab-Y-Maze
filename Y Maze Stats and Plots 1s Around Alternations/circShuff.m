function spikeRateMatx = circShuff(SPIKES,mouseName,times,iscpxStartFr,FR)
%% Correct the time stamps
%FR = 15;

timeToAdd = iscpxStartFr / FR;

SPIKES{:,1}=SPIKES{:,1} + timeToAdd; %SPIKES6025 unchanging after this

spikes = SPIKES; %spikes6025 changes for each time shift 


maxT = max(SPIKES{:,1});

cells = string(unique(spikes{:,2}));

%% find # spikes within 5s of the specified times
timeWindow = 1;

totalTime = length(times)*timeWindow*2;

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


spikeRateMatx(:,Ii) = spikeRate;

end

fileName = strcat('CircShuffData/spontAltCircShuff',mouseName);

save(fileName,"spikeRateMatx");
end