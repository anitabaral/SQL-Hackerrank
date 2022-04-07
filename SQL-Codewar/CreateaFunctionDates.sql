create function agecalculator(age date)
returns int
as $$
  begin
  return date_part('YEAR', AGE(age));
  end; $$
language plpgsql;
