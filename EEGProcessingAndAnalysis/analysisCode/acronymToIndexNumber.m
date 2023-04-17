% Function that takes in a sequence acronym such as US and returns an index number.
% Index number is used in the main code to read in the correct audio onset table.

function tableNumIndex = acronymToIndexNumber(acronym)

    switch acronym
        case 'AO'
            tableNumIndex = 1;
        case 'BC'
            tableNumIndex = 2;
        case 'BW'
            tableNumIndex = 3;
        case 'BT'
            tableNumIndex = 4;
        case 'CB'
            tableNumIndex = 5;
        case 'CP'
            tableNumIndex = 6;
        case 'CD'
            tableNumIndex = 7;
        case 'CHP'
            tableNumIndex = 8;
        case 'FR'
            tableNumIndex = 9;
        case 'GS'
            tableNumIndex = 10;                                                                                                                                                                                                                                                                                                                                                                                                                                       
        case 'HA'
            tableNumIndex = 11;
        case 'MB'
            tableNumIndex = 12;
        case 'TSS'
            tableNumIndex = 13;
        case 'US'
            tableNumIndex = 14;
        case 'WM'
            tableNumIndex = 15;
        case 'RS'
            tableNumIndex = 16;
        case 'TSP'
            tableNumIndex = 17;
      
    end
end