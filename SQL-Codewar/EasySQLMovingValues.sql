select
  length(name) as id,
  length(legs::varchar) as name,
  length(arms::varchar) as legs,
  length(characteristics) as arms,
  length(id::varchar) as characteristics
from
  monsters;
