INSERT INTO default.metrics (event_date, metric_id, value)
SELECT event_date, metric_id, value FROM db_computation.events
INNER JOIN
(
  SELECT metric_id FROM db_computation.metrics_metadata
)
USING (metric_id)
