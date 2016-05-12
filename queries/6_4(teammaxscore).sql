select t1.team,t1.score
FROM (
SELECT matches.teamid1 AS team, team1total as score from matches
UNION ALL
SELECT matches.teamid2 AS Team, team2total as score from matches
     ) t1
     
WHERE t1.score in(SELECT MAX(t2.score) AS score
              FROM (
             SELECT matches.teamid1 AS team, team1total as score from matches
                               UNION ALL
             SELECT matches.teamid2 AS Team, team2total as score from matches
                               )t2
)
