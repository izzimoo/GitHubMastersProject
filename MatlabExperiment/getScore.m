function [scoreChange , newScore, approxWord] = getScore(trialNumber, reactionTime, keyPress, currScore)

    correctAnswer = getAnswer(trialNumber);
    approxWord = (reactionTime * 1000)/1600;  %There is a word approx every 1600 ms
        
    if keyPress == correctAnswer
        
        reactionWord = round(approxWord);
        
        if reactionWord == 0 || reactionWord == 1 % in case round goes below 1
              scoreChange = 10;
        elseif reactionWord == 2
              scoreChange = 8;
        elseif reactionWord == 3
              scoreChange = 7;  
        elseif reactionWord == 4
              scoreChange = 5;    
        elseif reactionWord == 5
              scoreChange = 3; 
        elseif reactionWord == 6
              scoreChange = 2;              
        elseif reactionWord == 7
              scoreChange = 1;             
        elseif reactionWord == 8 || reactionWord == 9 %in case round function goes above 8
              scoreChange = 0;            
        end
        
        newScore = currScore + scoreChange;

    else
        
        scoreChange = -7;
        newScore = currScore + scoreChange;

    end

end

% time decision made [6.7, 4.5, 6.8]
% Iterate through and convert to milliseconds, divide by 400ms to get 
% approximate word they are on and then:
%V 