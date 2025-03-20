-- lets remove null values from the disbursment table
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


  -- lets remove null values from  the loan repayments table

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



