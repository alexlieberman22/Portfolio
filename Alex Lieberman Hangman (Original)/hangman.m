%Alex lieberman
%Final project
%Hangman
%4/22/15
%Collaborated with Kirt Olsen, Matt Pechon and Sage Sherman 

function hangman
% Initaily loads the word list and stats.csv file
loadwordlist
loadgamehistory

% Displays the menu 
disp('Welcome to Hangman!')
disp('1. Play')
disp('2. Set Difficulty')
disp('3. View Stats')
disp('4. Reset Stats')
disp('5. Quit')
A= input('What do you want to do?-');

% Will choose a category based off the input 
switch A
    case 1
    play_hangman
    case 2
    set_difficulty;
    case 3
    view_stats
    case 4
    reset_stats
    case 5
    Quit
    otherwise
    hangman
end
end






