select 
  id,
  COALESCE(nullif(name, ''), '[product name not found]') as name,
  COALESCE(nullif(card_name, ''), '[card name not found]') as card_name,
  price,
  card_number,
  transaction_date
  
  from eusales
  where 
    price is not null 
    and price > 50.00;
