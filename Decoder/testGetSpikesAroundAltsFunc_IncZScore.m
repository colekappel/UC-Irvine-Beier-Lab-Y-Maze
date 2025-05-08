clear

%% this script will get a nx100 circularly shuffled matx for each mouse and it will
%% be saved in "SpontAltSpikesAroundAlts" in matlab folder
%% this also gets lme tables

%% iscpx start frames
startFrame6025 = 88;
startFrame6026 = 113;
startFrame6027 = 119;
startFrame6028 = 278;
startFrame6029 = 127;
startFrame6039 = 83;
startFrame6041 =151;

startFrame6412 = 166.35;
%startFrame6416 = 172.1;
%startFrame6412_2 = 113;
startFrame6416_2 = 422;

%% vvv need to put 6412_2 and 6416_2 here vvv
startFrame6417 = 597.4;
startFrame6431 = 262.39;

%% times around correct alternations 
times6025 = [52.67, 55.41, 113.47, 216.4, 228.53, 256.53, 310.74, 343.46, 378.13, 542.4];
times6026 = [41.01,46.74,54.27,115.47,134.4,210.54,250.21,269.81,308.14,324.21,339.81,396.61,443.87,459.41,522.19,678.53];
times6027 = [40.06,106,119.66,134.06,148,165.66,192.06,228.72,262.46,282.46,294.53,315.06,328.38,338.99,...
    354.93,368.86,389.52,461.86,537.98,564.99,590.05,597.06,642.45,657.86];
times6028 = [410,562.99,594.46];
times6029 = [40.86,52.93,60.67,77.33,86.59,98.06,123.14,134.67,148.46,300.19,332.26,342.74,420.19,440.86,468.32,616.32,668.32];
times6039 =[36.99,82.59,122.26,167.73,186.74,225.26,342.13,366.86,411.33,489.66,533.52,557.46,585.52,589.05,614.65]; %check this is right w desiree
times6041 = [44.38,58.86,113.18,161.86,225.25,238.38,257.58,265.86,328.32,350.19,376.59,388.05,430.59,468.45,...
    517.52,533.06,545.58,571.58,576.72,593.06,629.86,647.25,657.46];

%times6412 =[126.14, 135.55,147.25,165.97,173.82,196.31,220,278.15,382.26];
%times6416 =[55.43,69,106.89,112.07,121.83,182.5,229.68,245.56,413.64,445.14,482.6];
%times6412_2 = [51.79,99.78,159.64,188.44,245.07,309.37,316.81,331.85,345.3,...
%    349.25,381.12,391.11,410.19,448.5,456.23,482,511.73,541.69,553.75,...
%    583.08,612.72,632.27,683.14,705.33,730.3,767.67,809.66,826.28,...
%    848.43,967.33,979.84,992,1002];
times6416_2 = [49.32,55.21,59.24,77.25,86.19,95.11,103.48,109.48,127.44,...
    143.68,159.69,198.89,207.53,218.96,231.86,254.97,284.32,307.46,...
    323.78,373.12,386.71,449.14,501.6,519.41,559.37,640,657.48,675.5,...
    727.85,796.07,845.14,904.36,926.67];

times6417 =[68.22,87,440.22,504.74];
times6431 = [96.96,105.57,123.77,141,145.56,204.77,230.48,276.75,301.64,314.97,350,380,407.86,...
    458.59,525.77,677.72,756.83,778.44,907.17];
%% times around incorrect alternations - up to date w precise #s
times6025_inc = [24.8,36.13,183.79,437.14,490.93,589.86];
times6026_inc = [27.47,34.34,60.94,74.67,83.01,104.61,147.6,164.06,184.21,196.86,219.34,297.94,...
    360.8,369.81,416.27,429.73,546.86,566.34,576.13,647.79];
times6027_inc = [20.06,28.46,34.99,46.53,55.6,72.46,87.33,209.98,243.06,428.99,443.98,511.33,...
    550.93,681.05];
times6028_inc = [365.34,437.07,522.61];
times6029_inc = [29.2,112.67,171.73,198.59,218.4,231.6,243.87,273.39,364.86,380.19,519.66,...
    575.73,644.06,684.59];
times6039_inc = [314.8,460.59,512.53,525.79];
times6041_inc = [35.58,69.46,131.39,143.86,205.86,214.66,313.98,400.13,412.13,460.05,477.12,...
    491.79,499.31,565.25,611.86];

times6412_inc =[42.79,53.39,66.25,86.13,186.71,326.14,340.83];
%times6416_inc =[47.21,63.61,197.68,216.31,298.5,319.37,436.7,489.19];

%times6412_inc_2 =[28.86,43.88,115,121.92,133.52,147.5,174.68,202.18,...
%    216.48,229.55,256.37,281.86,324.69,419.41,431.21,470.65,524.17,...
%    571.52,596.61,604.14,643.2,757,778.71,794.46,833.07,864.73,...
%    934.82,947.21];
times6416_inc_2 = [39.96,65.68,72.07,119.14,167.11,327.08,360,402.36,...
    419.33,430.46,437.43,592.18,706,737.82,779.1,862,877,880.52,890.29];

times6417_inc =[57.86,77,112.29,124.41,163.78,180.72,202.55,252,372.17];
times6431_inc=[55.96,68.59,89.89,117.79,183.68,244.56,266.57,450.27,498.44,648,713,831.59,936.73];
%% 5x+ 
spikeRateMatx6025 = getSpikesAroundAltsZScore(readtable('SpontAlt/spikes6025.csv'),'6025IncorrectAlts',...
    times6025_inc,startFrame6025,-1,"6025",1,15);

spikeRateMatx6026 = getSpikesAroundAltsZScore(readtable('SpontAlt/spikes6026.csv'),'6026IncorrectAlts',...
    times6026_inc,startFrame6026,-1,"6026",1,15);

spikeRateMatx6027 = getSpikesAroundAltsZScore(readtable('SpontAlt/spikes6027.csv'),'6027IncorrectAlts',...
    times6027_inc,startFrame6027,-1,"6027",1,15);

spikeRateMatx6028 = getSpikesAroundAltsZScore(readtable('SpontAlt/spikes6028.csv'),'6028IncorrectAlts',...
    times6028_inc,startFrame6028,-1,"6028",1,15);

spikeRateMatx6029 = getSpikesAroundAltsZScore(readtable('SpontAlt/spikes6029.csv'),'6029IncorrectAlts',...
    times6029_inc,startFrame6029,-1,"6029",1,15);

%% 5x-
spikeRateMatx6039 = getSpikesAroundAltsZScore(readtable('SpontAlt/spikes6039.csv'),'6039IncorrectAlts',...
    times6039_inc,startFrame6039,-1,"6039",-1,15);

spikeRateMatx6041 = getSpikesAroundAltsZScore(readtable('SpontAlt/spikes6041.csv'),'6041IncorrectAlts',...
    times6041_inc,startFrame6041,-1,"6041",-1,15);

%% new 5x- mice 
spikeRateMatx6412 = getSpikesAroundAltsZScore(readtable('SpontAlt/events_6412_first.csv'),'6412IncorrectAlts',...
    times6412_inc,startFrame6412,1,"6412",-1,28.29);

spikeRateMatx6416 = getSpikesAroundAltsZScore(readtable('SpontAlt/events_6416_2nd.csv'),'6416IncorrectAlts',...
    times6416_inc_2,startFrame6416_2,1,"6416",-1,27.66);

spikeRateMatx6417 = getSpikesAroundAltsZScore(readtable('SpontAlt/events_6417_first.csv'),'6417IncorrectAlts',...
    times6417_inc,startFrame6417,1,"6417",-1,28.77);

spikeRateMatx6431 = getSpikesAroundAltsZScore(readtable('SpontAlt/events_6431.csv'),'6431IncorrectAlts',...
    times6431_inc,startFrame6431,1,"6431",-1,28.77);
