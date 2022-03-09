function play_hangman
global S

if isempty(S)==1
   S=0;
end

//  Picks a game based off difficulty selected (S)
switch S
    case 1
    disp('Easy')
    play_easy
    case 2
    disp('Medium')
    play_medium
    case 3 
    disp('Hard')
    play_hard
    otherwise
    disp('Please Select difficulty')
    set_difficulty
end
end
