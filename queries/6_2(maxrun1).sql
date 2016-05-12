SELECT t1.batsman,t1.runsum
FROM (
/*  this blocks finds the sum of runs of each players */
         select sum(batting.R) AS runsum, batting.batsman
        FROM batting 
        GROUP BY batting.batsman
     ) t1
WHERE t1.runsum in (SELECT MAX(t2.runsum) AS runsum
                          /*  here we find the maxsum */
                          FROM (
                          
                               select sum(batting.R) AS runsum, batting.batsman
                               FROM batting 
                               GROUP BY batting.batsman
                               )t2
					   )
