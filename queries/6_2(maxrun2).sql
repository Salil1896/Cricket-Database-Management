select pname, prun
from players t1
inner join
(
  select max(prun) Maxrun
  from players
) t2
on t1.prun = t2.Maxrun;
