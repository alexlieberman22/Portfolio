global wordlist
global gamehistory
global attempt

//  Randomly picks a word by comparing its size until its the right one 
Z=(1:9);
rng('shuffle');
while size(Z,2)>8
    word=wordlist(randi(58110,1));
    Z=char(word);  
end

//  Creates a line of blanks
N=size(Z,2);
blanks=repmat('_ ',1,N);

//  Initial states for various variables
Neg=word;
Cell={''};
attempt=6;

for i=1:42
        
      //   Displays an empty gallows initially
       if i==1
          dead_man
       end
      //   Displays the game
       fprintf('Hint:%s\n',blanks);
       fprintf('Used letters: {%s}\n',Cell{1});
       fprintf('%d attempt(s) remaining, Enter new guess: ',attempt);
      //   User makes a guess
       guess =input('','s');
      //   In case they put in a upper case number
       guess=lower(guess);
      //   Checks to see if the guess is the same as before
       if strfind(Cell{1},guess)~=0
          fprintf('Already used! Enter a new guess:')
          guess=input('','s');
       end
      //   (twice just to be safe)
       if strfind(Cell{1},guess)~=0
          fprintf('Your an idiot! Enter a new guess:')
          guess=input('','s');
       end
      //   Guess is stored in a cell array
       Cell{1}(i)=guess;
      //   The guessed letter replaces a blank if it's in a word 
      //   by using the strrep funtion twice 
       Neg=strrep(Neg,guess,'0');
       Neg=char(Neg);
       blanks=char(word);
          for j=1:N
              blanks=strrep(blanks,Neg(j),'_ ');
          end
    
      //   Checks to see if the guess was in the word
      //   if not an attempt is removed
       if strfind(char(word),guess)~=0
       else
          attempt=attempt-1;
       end
      //   Checks to see if all attempts have run out
       if attempt==0
          break
       end
       
       if strcmp(blanks,word)
         //   The player wins
         //   updates game history
          gamehistory(1,2)=gamehistory(1,2)+1;
          csvwrite('stats.csv',gamehistory);
          disp('You won!');
          disp(word);
          live_man;
          break
       end
      //   Displays new gallows
       dead_man;
end

if strcmp(blanks,word)==0
   //  The player loses
   //  updates game history
   gamehistory(1,3)=gamehistory(1,3)+1;
   csvwrite('stats.csv',gamehistory);
   disp('You lose!');
   disp(word);
   dead_man;
end
hangman;
