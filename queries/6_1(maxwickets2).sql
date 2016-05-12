select pname, pwickets
from players t1
inner join
(
  select max(pwickets) Maxwickets
  from players
) t2
on t1.pwickets = t2.Maxwickets;
