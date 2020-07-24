SELECT event_date,company_id,product_id FROM db_first.events_first
FULL OUTER JOIN
(
  SELECT event_date,company_id,product_id FROM db_first.events_remote
)
USING (event_date,company_id,product_id)
