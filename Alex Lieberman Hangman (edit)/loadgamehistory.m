function loadgamehistory
//  Loads stats.csv into a matrix and sets it as a global variable 
global gamehistory
gamehistory=importdata('stats.csv');