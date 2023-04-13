
CREATE VIEW TESTE AS
SELECT SO.id,
SO.datetime_execution_budget_approved = CASE
WHEN LE.title = 'Orçamento aprovado' AND SO.datetime_execution_budget_approved = '' THEN LE.created_at
WHEN LE.title = 'Orçamento aprovado pelo pagador' AND SO.datetime_execution_budget_approved = '' THEN LE.created_at
ELSE SO.datetime_execution_budget_approved
END,
datetime_approved_cancelled = CASE
WHEN LE.title = 'Aprovação cancelada' THEN LE.created_at
ELSE SO.datetime_execution_budget_approved
END,
LE.created_at AS datetime_first_budget_approved,
COUNT(DISTINCT CAST(SO.datetime_execution_budget_approved AS DATE) BETWEEN '2022-01-01' AND '2022-01-31') AS sum_approved_01,
COUNT(DISTINCT CAST(SO.datetime_execution_budget_approved AS DATE) BETWEEN '2022-02-01' AND '2022-02-28') AS sum_approved_02,
COUNT(DISTINCT CAST(SO.datetime_execution_budget_approved AS DATE) BETWEEN '2022-03-01' AND '2022-03-31') AS sum_approved_03,
COUNT(DISTINCT CAST(SO.datetime_execution_budget_approved AS DATE) BETWEEN '2022-04-01' AND '2022-04-30') AS sum_approved_04,
COUNT(DISTINCT CAST(SO.datetime_execution_budget_approved AS DATE) BETWEEN '2022-05-01' AND '2022-05-31') AS sum_approved_05,
COUNT(DISTINCT CAST(SO.datetime_execution_budget_approved AS DATE) BETWEEN '2022-06-01' AND '2022-06-30') AS sum_approved_06,
COUNT(DISTINCT CAST(SO.datetime_execution_budget_approved AS DATE) BETWEEN '2022-07-01' AND '2022-07-31') AS sum_approved_07,
COUNT(DISTINCT CAST(SO.datetime_execution_budget_approved AS DATE) BETWEEN '2022-08-01' AND '2022-08-31') AS sum_approved_08,
COUNT(DISTINCT CAST(SO.datetime_execution_budget_approved AS DATE) BETWEEN '2022-09-01' AND '2022-09-30') AS sum_approved_09,
COUNT(DISTINCT CAST(SO.datetime_execution_budget_approved AS DATE) BETWEEN '2022-10-01' AND '2022-10-31') AS sum_approved_10,
COUNT(DISTINCT CAST(SO.datetime_execution_budget_approved AS DATE) BETWEEN '2022-11-01' AND '2022-11-30') AS sum_approved_11,
COUNT(DISTINCT CAST(SO.datetime_execution_budget_approved AS DATE) BETWEEN '2022-12-01' AND '2022-12-31') AS sum_approved_12,
COUNT(DISTINCT CAST(datetime_approved_cancelled AS DATE) BETWEEN '2022-01-01' AND '2022-01-31') AS sum_cancelled_01,
COUNT(DISTINCT CAST(datetime_approved_cancelled AS DATE) BETWEEN '2022-02-01' AND '2022-02-28') AS sum_cancelled_02,
COUNT(DISTINCT CAST(datetime_approved_cancelled AS DATE) BETWEEN '2022-03-01' AND '2022-03-31') AS sum_cancelled_03,
COUNT(DISTINCT CAST(datetime_approved_cancelled AS DATE) BETWEEN '2022-04-01' AND '2022-04-30') AS sum_cancelled_04,
COUNT(DISTINCT CAST(datetime_approved_cancelled AS DATE) BETWEEN '2022-05-01' AND '2022-05-31') AS sum_cancelled_05,
COUNT(DISTINCT CAST(datetime_approved_cancelled AS DATE) BETWEEN '2022-06-01' AND '2022-06-30') AS sum_cancelled_06,
COUNT(DISTINCT CAST(datetime_approved_cancelled AS DATE) BETWEEN '2022-07-01' AND '2022-07-31') AS sum_cancelled_07,
COUNT(DISTINCT CAST(datetime_approved_cancelled AS DATE) BETWEEN '2022-08-01' AND '2022-08-31') AS sum_cancelled_08,
COUNT(DISTINCT CAST(datetime_approved_cancelled AS DATE) BETWEEN '2022-09-01' AND '2022-09-30') AS sum_cancelled_09,
COUNT(DISTINCT CAST(datetime_approved_cancelled AS DATE) BETWEEN '2022-10-01' AND '2022-10-31') AS sum_cancelled_10,
COUNT(DISTINCT CAST(datetime_approved_cancelled AS DATE) BETWEEN '2022-11-01' AND '2022-11-30') AS sum_cancelled_11,
COUNT(DISTINCT CAST(datetime_approved_cancelled AS DATE) BETWEEN '2022-12-01' AND '2022-12-31') AS sum_cancelled_12
FROM service_order SO
INNER JOIN log_event LE ON SO.id = LE.service_order_id;

