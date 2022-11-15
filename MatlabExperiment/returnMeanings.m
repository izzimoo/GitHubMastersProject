function [meaning1, meaning2]=returnMeanings(number)

    switch number
        case 1
            meaning1 = 'Car';
            meaning2 = 'Bus';
        case 2
            meaning1 = 'Apartment';
            meaning2 = 'House';
        case 3
            meaning1 = 'Lake';
            meaning2 = 'Sea';
        otherwise
            meaning1 = 'error';
            meaning2 = 'error';
    end

end