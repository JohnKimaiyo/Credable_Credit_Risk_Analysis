-- lets remove null values from the disbursment table and extract 
SELECT TOP (1000) 
      [customer_id],
      [disb_date],
      [tenure],
      [account_num],
      [loan_amount],
      [loan_fee]
FROM [credable_customer_transactions].[dbo].[Disbursements$]
WHERE [customer_id] IS NOT NULL
  AND [disb_date] IS NOT NULL
  AND [tenure] IS NOT NULL
  AND [account_num] IS NOT NULL
  AND [loan_amount] IS NOT NULL
  AND [loan_fee] IS NOT NULL;


  -- lets remove null values from  the loan repayments table and extract 

   SELECT TOP (1000) 
      [date_time],
      [customer_id],
      [amount],
      [rep_month],
      [repayment_type]
FROM [credable_customer_transactions].[dbo].[Repayments$]
WHERE [date_time] IS NOT NULL
  AND [customer_id] IS NOT NULL
  AND [amount] IS NOT NULL
  AND [rep_month] IS NOT NULL
  AND [repayment_type] IS NOT NULL;

-- lets calculate the profit or loss  and extract it to perform forecasing
SELECT 
    d.customer_id,
    d.disb_date,
    d.account_num,
    d.loan_amount,
    d.loan_fee,
    ISNULL(SUM(r.amount), 0) AS total_repayments,
    (ISNULL(SUM(r.amount), 0) + d.loan_fee - d.loan_amount) AS profit_loss
FROM 
    [credable_customer_transactions].[dbo].[Disbursements$] d
LEFT JOIN 
    [credable_customer_transactions].[dbo].[Repayments$] r
    ON d.customer_id = r.customer_id
GROUP BY 
    d.customer_id,
    d.disb_date,
    d.account_num,
    d.loan_amount,
    d.loan_fee
ORDER BY 
    d.customer_id,
    d.disb_date;


