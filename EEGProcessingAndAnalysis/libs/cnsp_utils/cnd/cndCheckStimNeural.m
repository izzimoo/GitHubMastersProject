function [stim,neural] = cndCheckStimNeural(stim,neural)
%CNDCHECKSTIMNEURAL Checks that stimulus and neural data in CND format have
%                   consistend length, sampling freq, and number of trials
%   CND = CNDCHECKSTIMNEURAL(CND,TYPE)
%
%       'stim'   -- stimulus data in the Continuous-event Neural Data
%                   format (CND)
%       'neural' -- neural data in the Continuous-event Neural Data
%                   format (CND)
%
%   Author: Giovanni Di Liberto
%   Last update: 23 June 2022
%   Copyright 2022 Di Liberto Lab, Trinity College Dublin

    if isempty(stim) || isempty(stim.data)
        disp('The stim CND structure is empty or not a cell array')
        return
    elseif ~iscell(stim.data)
        disp('The stim CND.data structure is not a cell array')
        return
    end
    
    if isempty(neural) || isempty(neural.data)
        disp('The neural CND structure is empty or not a cell array')
        return
    elseif ~iscell(neural.data)
        disp('The neural CND.data structure is not a cell array')
        return
    end
    
    if neural.fs ~= stim.fs
        disp('Error: EEG and STIM have different sampling frequency')
        return
    end
    if length(neural.data) ~= length(stim.data)
        disp('Error: EEG.data and STIM.data have different number of trials')
        return
    end
    for tr = 1:length(stim.data)
        envLen = size(stim.data{tr},1);
        eegLen = size(neural.data{tr},1);
        minLen = min(envLen,eegLen);
        stim.data{tr} = double(stim.data{tr}(1:minLen,:));
        neural.data{tr} = double(neural.data{tr}(1:minLen,:));
    end
end
