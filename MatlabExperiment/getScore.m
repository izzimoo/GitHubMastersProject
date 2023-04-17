
% Function to return the change in score and new score for the participant.

function [scoreChange, newScore] = getScore(trialNumber, reactionTime, keyPress, currScore)
    
    % Check if the answer given was correct
    correctAnswer = getAnswer(trialNumber);
    approxWord = (reactionTime * 1000)/1700;  % There is a word approx every 1600 ms
    
    % Approximation as to which word the participant was on when they made the decision
    reactionWord = round(approxWord);

    % If the participant gave a correct answer then output their change in score based on the word they made the decision on
    if keyPress == correctAnswer
                
        if reactionWord == 0 || reactionWord == 1 % in case round goes below 1
              scoreChange = 14;
        elseif reactionWord == 2
              scoreChange = 12;
        elseif reactionWord == 3
              scoreChange = 10;  
        elseif reactionWord == 4
              scoreChange = 8;    
        elseif reactionWord == 5
              scoreChange = 6; 
        elseif reactionWord == 6
              scoreChange = 4;              
        elseif reactionWord == 7
              scoreChange = 2;             
        elseif reactionWord == 8 || reactionWord == 9 % Round function may produce 9, means that the decision was on word 8
              scoreChange = 1;
        else
              scoreChange = -16; % Participant missed the trial i.e. didn't make a decision before the end of the stimulus
        end
        
        % Calculate the participants new score using their current score and score change value 
        newScore = currScore + scoreChange;

    % If the participant gave an incorrect answer then output their change in score based on the word they made the decision on
    else
        
        if reactionWord == 0 || reactionWord == 1 % in case round goes below 1
              scoreChange = -16;
        elseif reactionWord == 2
              scoreChange = -14;
        elseif reactionWord == 3
              scoreChange = -8;  
        elseif reactionWord == 4
              scoreChange = -6;    
        elseif reactionWord == 5
              scoreChange = -4; 
        elseif reactionWord == 6
              scoreChange = -2;              
        elseif reactionWord == 7
              scoreChange = -1;             
        elseif reactionWord == 8 || reactionWord == 9 % Round function may produce 9, means that the decision was on word 8
              scoreChange = 0;
        else
              scoreChange = -16; % Participant missed the trial i.e. didn't make a decision before the end of the stimulus
        end
        
        % Calculate the participants new score using their current score and score change value 
        newScore = currScore + scoreChange;

    end

end