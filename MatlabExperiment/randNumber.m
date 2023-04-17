
% Generate normally distributed random numbers to insert silences between the audios in each stimulus sequence 

function [randNo]=randNumber()

    randNo = randi([1 9], 1, 8); % Random number between 1-9
    randNo = (randNo - 5)/5; % Subtract 5 and divide by 5 - range(-0.8 : 0.8)
    ISI = 1.0; % 1 second so adding ISI*fs now adds a minimum of 800ms and a max of 1800ms
    randNo = randNo + ISI; %(-0.8 ... 0.8) + 1.0  = (0.8s ... 1.8s) - minmax seconds 
   
end
