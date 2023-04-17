
% Script to create the stimuli for the experiment

targetPairs = {'AppleOrange', 'BedCouch', 'BeeWasp', 'BusTrain', 'CarBus', 'CarrotPotato', 'CatDog', 'ChickenPork',...
    'FootballRugby', 'GoldSilver', 'HouseApartment', 'MovieBook', 'RainSnow', 'TelevisionSmartphone', 'TshirtShirt',...
    'UniversitySchool', 'WaterMilk'};

lowercaseTargetPairs = {'appleorange', 'bedcouch', 'beewasp', 'bustrain', 'carbus', 'carrotpotato', 'catdog', 'chickenpork',...
    'footballrugby', 'goldsilver', 'houseapartment', 'moviebook', 'rainsnow', 'televisionsmartphone', 'tshirtshirt',...
    'universityschool', 'watermilk'};

numTargetPairs = length(targetPairs);
word2VecSequenceCSVs = cell(1, numTargetPairs);

for i = 1:numTargetPairs
    word2VecSequenceCSVs{i} = ['./EEGExperimentData/Word2VecSequencesEEG/', targetPairs{i}, '/', targetPairs{i}, '_SequencesCSV.csv'];
end

% Read in Word2Vec CSV data  
arrayOfTables = {1,length(word2VecSequenceCSVs)};
for i = 1:numTargetPairs
    
    arrayOfTables{i} = readtable(word2VecSequenceCSVs{i}, 'ReadVariableNames', false);

end

outputFileAcronym = {'AO', 'BC', 'BW', 'BT', 'CB', 'CP', 'CD', 'CHP', 'FR', 'GS', 'HA', 'MB', 'RS', 'TSP', 'TSS', 'US', 'WM'};

endOfTable = 22;
numberWords = 8;
fs = 48000;

for tableNum = 1:numTargetPairs
    
    disp(['Starting target pair ', targetPairs{tableNum}]);
    
    for columnNum = 7:endOfTable

        % Convert column in table to array so that the string words can be extracted from it 
        tableArray = table2array(arrayOfTables{tableNum}(:, columnNum)); 

        f1 = audioread(['./EEGExperimentData/RawRecordingFiles/WAV/', targetPairs{tableNum}, '/', lowercaseTargetPairs{tableNum}, '_', tableArray{1},'.wav']);
        f2 = audioread(['./EEGExperimentData/RawRecordingFiles/WAV/', targetPairs{tableNum}, '/', lowercaseTargetPairs{tableNum}, '_', tableArray{2},'.wav']);
        f3 = audioread(['./EEGExperimentData/RawRecordingFiles/WAV/', targetPairs{tableNum}, '/', lowercaseTargetPairs{tableNum}, '_', tableArray{3},'.wav']);
        f4 = audioread(['./EEGExperimentData/RawRecordingFiles/WAV/', targetPairs{tableNum}, '/', lowercaseTargetPairs{tableNum}, '_', tableArray{4},'.wav']);
        f5 = audioread(['./EEGExperimentData/RawRecordingFiles/WAV/', targetPairs{tableNum}, '/', lowercaseTargetPairs{tableNum}, '_', tableArray{5},'.wav']);
        f6 = audioread(['./EEGExperimentData/RawRecordingFiles/WAV/', targetPairs{tableNum}, '/', lowercaseTargetPairs{tableNum}, '_', tableArray{6},'.wav']);
        f7 = audioread(['./EEGExperimentData/RawRecordingFiles/WAV/', targetPairs{tableNum}, '/', lowercaseTargetPairs{tableNum}, '_', tableArray{7},'.wav']);
        f8 = audioread(['./EEGExperimentData/RawRecordingFiles/WAV/', targetPairs{tableNum}, '/', lowercaseTargetPairs{tableNum}, '_', tableArray{8},'.wav']);

        randNo = randNumber();

        combined = [zeros(round(fs*0.5),size(f1,2));f1;zeros(round(fs*randNo(1)),size(f1,2));
        f2;zeros(round(fs*randNo(2)),size(f1,2));f3;zeros(round(fs*randNo(3)),size(f1,2));
        f4;zeros(round(fs*randNo(4)),size(f1,2));f5;zeros(round(fs*randNo(5)),size(f1,2));
        f6;zeros(round(fs*randNo(6)),size(f1,2));f7;zeros(round(fs*randNo(7)),size(f1,2));
        f8;zeros(round(fs*randNo(8)),size(f1,2))];   

        if (columnNum < 15)
            meaningType = 'M1';  
        else
            meaningType = 'M2';
        end

        % Write final recordings to separate folders corresponding to the target pairs and one big folder
        
% %         filepathOut = ['./EEGExperimentData/CompletedRecordingsEEG/', targetPairs{tableNum}, '/',  outputFileAcronym{tableNum}, '_', meaningType, '_', num2str(columnNum - 6), '.wav'];
% %         audiowrite(filepathOut, combined, fs); 

% %         filepathOutAll = ['./EEGExperimentData/CompletedRecordingsEEG/AllRecordings/', outputFileAcronym{tableNum}, '_', meaningType, '_', num2str(columnNum - 6), '.wav'];
% %         audiowrite(filepathOutAll, combined, fs); 
        
    end
    
end









