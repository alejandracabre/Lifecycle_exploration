SELECT
  customer_status.created_at AS subscription_date,
  customer_status.customer_id AS customer_id,
  COUNT(customer_status.customer_id) AS total_subscriptions,
  subscription_started,
  SUM(CASE WHEN(subscription_started IS NOT NULL) THEN 1
      ELSE 0 END) AS paid,
  SUM(CASE WHEN(subscription_started IS NULL) THEN 1
      ELSE 0 END) AS free
FROM
  [durable-sound-186913:customer.customer_status] AS customer_status
GROUP BY
  subscription_date,
  customer_id,
  subscription_started
