SELECT
  created_at AS subscription_date,
  customer_status.customer_id AS customer_id,
  subscription_started AS payment_date,
  COUNT(customer_status.customer_id) AS total_subscriptions,
  SUM(CASE WHEN(DATEDIFF( CURRENT_DATE(), created_at) <= 30 ) THEN 1
      ELSE 0 END) AS trial,
  SUM(CASE WHEN(DATEDIFF( CURRENT_DATE(), created_at) > 30 ) THEN 1
      ELSE 0 END) AS after_trial
FROM
  [durable-sound-186913:customer.customer_status] AS customer_status
LEFT JOIN
  [durable-sound-186913:customer.meeting_report] AS meeting_report
ON
  customer_status.customer_id = meeting_report.customer_id
GROUP BY
  subscription_date,
  payment_date,
  Customer_id
