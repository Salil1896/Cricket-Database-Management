SELECT t1.bowler,t1.wicketsum
FROM (
            select sum(bowling.wickets) AS wicketsum, bowling.bowler
            FROM bowling 
             GROUP BY bowling.bowler
     ) t1
WHERE t1.wicketsum in (SELECT MAX(t2.wicketsum) AS wicketsum
                          FROM (
                                 SELECT SUM(bowling.wickets) AS wicketsum, bowling.bowler
                                  FROM bowling 
                                 GROUP BY bowling.bowler
                               )t2
  )
