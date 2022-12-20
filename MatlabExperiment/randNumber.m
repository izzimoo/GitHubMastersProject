function [randNo]=randNumber()

    randNo = randi([1 9], 1, 8); % random number between 1-9
    randNo = (randNo - 5)/5; % subtract 5 and divide by 5 - range(-0.8 : 0.8)
    ISI = 1.0; %1 second so adding ISI*fs now adds a minimum of 800ms and a max of 1800ms
    randNo = randNo + ISI; %(-0.8 ... 0.8) + 1.0  = (0.8 ... 1.8) - minmax seconds 
    
% THIS IS THE OLD CODE:
% randNo = round(2-rand(1, 8)*2, 1);
% randNo = (randNo - 1)/5;
% ISI = 1.0; %1 second so adding ISI*fs now adds a minimum of 800ms and a max of 1200ms
% randNo = randNo + ISI; %(-0.2 ... 0.2) + 1.0  = (0.8 ... 1.2) - minmax seconds 
% 
% disp(randNo)
% 
% % you can now assume that every 1000ms there will be a word - the later you
% % answer the lower the score you will get -  more points for the quicker
% % they answer but higher penalty if they answer wrong. After each audio
% % they will see their score and how many points they gained at each
% % interval 

end
