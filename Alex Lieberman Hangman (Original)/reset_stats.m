function reset_stats
% rewrites the stats.csv file to its origenal form
gamehistory=[1,0,0;2,0,0;3,0,0];
csvwrite('stats.csv',gamehistory);
% clears all charts
clf;
hangman;