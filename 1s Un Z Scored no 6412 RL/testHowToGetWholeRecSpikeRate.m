clear

%% can put it in the getSpikesAroundAlts function once i write the code for it 
%{
spikes6025 = readtable('SpontAlt/spikes6025.csv');

spikeTimes = spikes6025{:,1};
totalTimeOfRec = max(spikeTimes) - min(spikeTimes);

cells = string(unique(spikes6025{:,2}));

numSpikesPerCell = zeros(height(cells),1);
for i = 1: height(cells)
    rows = find(cells(i)==spikes6025{:,2});
    numSpikesPerCell(i) = height(rows);
end

wholeErPerCell = numSpikesPerCell./ totalTimeOfRec;
%}