INSERT INTO default.metrics (event_date, metric_id, value)
SELECT event_date, metric_id, value FROM default.events
INNER JOIN
(
  SELECT metric_id FROM default.metrics_metadata
)
USING (metric_id)
