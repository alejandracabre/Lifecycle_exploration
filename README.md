# README

## Data exploration and tools

For the exercise it was created an instance in Google big Query in order to explore and crunch the data, and it was created a final dashboard in Google Data studio.
With this approach the dashboard will be updated automatically at the desired frequency.

### Data Quality test

* After the data exploration it was confirmed a 1:1 relation between both tables (Meeting report & Customer status) with each row having a unique customer_id.
* The meeting is one single event per user.
* I was explored the data using a data visualization exercise in Tableau in order to have a better understanding of the regular behavior as well as the outliers.

### Data Modeling: Queries

Four queries were required to address the business questions:
* all_subscriptions_lifecycle
* conversion_rate_meeting
* lifecycle_meeting
* Paid_vs_free

All queries are included in sql files, documentation folder.

## Results: Data story
Final results are presented in the data story "Lifecycle Exploration" in this repo. Context, caveats, findings, charts (also available in the documentation folder) and next step recommendations, are included.
