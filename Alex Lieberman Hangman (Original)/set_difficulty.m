function  set_difficulty()
% Allows S to be used as the same variable in play_hangman
global S

if isempty(S)==1
   S=0;
end

% Display
disp('1. Easy')
disp('2. Medium')
disp('3. Hard')
% Displays what difficulty the user chose previously 
fprintf('Difficulty:%d\n',S)
difficulty=input('What difficulty would you like?-');

% Sets difficulty based off input
switch difficulty
    case 1
    S=1;
    case 2
    S=2;
    case 3
    S=3;
    otherwise
    set_difficulty
end

hangman

end