SELECT
  created_at AS payment_date,
  sum (CASE WHEN(Meeting_Date < created_at) THEN 1
      ELSE 0 END) AS before_subscription,
  sum (CASE
      WHEN (DATE(Meeting_Date) BETWEEN DATE(created_at) AND DATE(DATE_ADD(created_at, 30, "DAY"))) THEN 1
      ELSE 0 END) AS during_trial,
  sum (CASE WHEN(DATE(Meeting_Date) > DATE(DATE_ADD(created_at, 30, "DAY"))) THEN 1
      ELSE 0 END) AS after_trial
FROM
  [durable-sound-186913:customer.customer_status] AS customer_status
LEFT JOIN
  [durable-sound-186913:customer.meeting_report] AS meeting_report
ON
  customer_status.customer_id = meeting_report.customer_id
WHERE
  meeting_report.Meeting_date IS NOT NULL
GROUP BY
  payment_date
