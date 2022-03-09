function view_stats
global gamehistory

//  Checks to see if any numbers being graphed in the stats.csv file are positive
A=any(gamehistory(1:3,2:3));

//  Title
figure('Name','Statistics','NumberTitle','off')
//  if the any of the numbers in the first pair on the marix are 
//  not both 0 graph the pie chart 
if A(1)~=0
    //  Will make a horizontal subplot
    subplot(1,3,1)
    pie(gamehistory(1,2:3))
    //  Adds a legend
    legend('victories','defeats','Location','NorthOutside')
    title('Easy')
end
//  if the any of the numbers in the second pair on the marix are 
//  not both 0 graph the pie chart
if A(2)~=0
    subplot(1,3,2)
    pie(gamehistory(2,2:3))
    legend('victories','defeats','Location','NorthOutside')
    title('Medium')
end
//  if the any of the numbers in the Third pair on the marix are 
//  not both 0 graph the pie chart
if A(3)~=0
    subplot(1,3,3)
    pie(gamehistory(3,2:3))
    legend('victories','defeats','Location','NorthOutside')
    title('Hard')
end
hangman;
end
