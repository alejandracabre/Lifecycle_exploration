SELECT
  created_at AS subscription_date,
  COUNT(meeting_report.customer_id) AS total_meetings,
  SUM(CASE
      WHEN (meeting_report.Meeting_date IS NULL) AND (customer_status.subscription_started IS NOT NULL) THEN 1
      ELSE NULL END) AS Paid_without_meeting,
  SUM(CASE
      WHEN (meeting_report.Meeting_date IS NOT NULL) AND (customer_status.subscription_started IS NOT NULL) THEN 1
      ELSE NULL END) AS Paid_with_meeting
FROM
  [durable-sound-186913:customer.customer_status] AS customer_status
LEFT JOIN
  [durable-sound-186913:customer.meeting_report] AS meeting_report
ON
  customer_status.customer_id = meeting_report.customer_id
GROUP BY
  subscription_date
customer_lifecycle
SELECT
  created_at AS subscription_date,
  COUNT(customer_status.customer_id) AS total_subscriptions,
  SUM(CASE WHEN(DATEDIFF( subscription_started, created_at) <= 30 ) THEN 1
      ELSE 0 END) AS trial,
  SUM(CASE WHEN(DATEDIFF( subscription_started, created_at) > 30 ) THEN 1
      ELSE 0 END) AS after_trial
FROM
  [durable-sound-186913:customer.customer_status] AS customer_status
WHERE
  customer_status.subscription_started IS NOT NULL
GROUP BY
  Subscription_date
