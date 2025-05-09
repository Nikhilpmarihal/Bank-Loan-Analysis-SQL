SELECT *
FROM bank_loan_data

SELECT COUNT(id) 
FROM bank_loan_data

SELECT COUNT(id) 
AS MTD_Total_Loan_Applications
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021 

SELECT COUNT(id) 
AS PMTD_Total_Loan_Applications
FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

SELECT COUNT(id) 
AS MTD_Total_Loan_Applications
FROM bank_loan_data

SELECT SUM(loan_amount) AS Total_Founded_Amount
FROM bank_loan_data

SELECT SUM(loan_amount) AS MTD_Total_Founded_Amount
FROM bank_loan_data
WHERE MONTH (issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT SUM(loan_amount) AS PMTD_Total_Founded_Amount
FROM bank_loan_data
WHERE MONTH (issue_date) = 11 AND YEAR(issue_date) = 2021

SELECT SUM(total_payment) AS MTD_Total_Amount_Received 
FROM bank_loan_data
WHERE MONTH (issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT SUM(total_payment) AS PMTD_Total_Amount_Received 
FROM bank_loan_data
WHERE MONTH (issue_date) = 11 AND YEAR(issue_date) = 2021

SELECT ROUND(AVG(int_rate) * 100, 2) AS MTD_Avg_Interest_Rate
FROM bank_loan_data
WHERE MONTH (issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT ROUND(AVG(int_rate) * 100, 2) AS PMTD_Avg_Interest_Rate
FROM bank_loan_data
WHERE MONTH (issue_date) = 11 AND YEAR(issue_date) = 2021

SELECT ROUND(AVG(dti) * 100 , 2) AS MTD_Avg_dti 
FROM bank_loan_data
WHERE MONTH (issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT ROUND(AVG(dti) * 100 , 2) AS PMTD_Avg_dti 
FROM bank_loan_data
WHERE MONTH (issue_date) = 11 AND YEAR(issue_date) = 2021

SELECT loan_status
FROM bank_loan_data

SELECT 
	(COUNT (CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END)*100)
	/
	COUNT(id) AS Good_Loan_percentage 
FROM bank_loan_data

SELECT COUNT(id) AS  Good_Loan_Applications
FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

SELECT SUM(loan_amount)AS  Good_Loan_Funded_Amount
FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'


SELECT SUM(total_payment)AS  Good_Loan_Funded_Amount
FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

SELECT  
    (COUNT(CASE WHEN loan_status = 'Charged off' THEN id END) * 100.0 /
	COUNT(id)) AS Bad_Loan_Percentage
FROM bank_loan_data

SELECT COUNT(id) AS Band_Loan_Applications 
FROM bank_loan_data
WHERE loan_status = 'Charged Off'


SELECT SUM(loan_amount) AS Band_Loan_Funded_Amount 
FROM bank_loan_data
WHERE loan_status = 'Charged Off'


SELECT SUM(total_payment) AS Band_Loan_Amount_Recieved
FROM bank_loan_data
WHERE loan_status = 'Charged Off'

SELECT
	loan_status,
	COUNT(id) AS Total_Loan_applications,
	SUM(total_payment) AS Total_Amount_Received,
	SUM(loan_amount) AS Total_Funded_Amount,
	AVG(int_rate * 100) AS Interst_Rate,
	AVG(dti * 100) AS DTI
FROM bank_loan_data
GROUP BY loan_status

SELECT
	MONTH(issue_date) AS Month_Number,
	DATENAME(MONTH, issue_date) AS Month_Name,
	COUNT(id) AS Total_Loan_Applications,
	SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
GROUP BY MONTH(issue_date) , DATENAME(MONTH , issue_date)
ORDER BY MONTH(issue_date)

SELECT
	address_state,
	COUNT(id) AS Total_Loan_Applications,
	SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
GROUP BY address_state
ORDER BY COUNT(id) DESC

SELECT
	term,
	COUNT(id) AS Total_Loan_Applications,
	SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
GROUP BY term
ORDER BY term

SELECT
	emp_length,
	COUNT(id) AS Total_Loan_Applications,
	SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
GROUP BY emp_length
ORDER BY COUNT(id) DESC

SELECT
	purpose,
	COUNT(id) AS Total_Loan_Applications,
	SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
GROUP BY purpose
ORDER BY COUNT(id) DESC


SELECT
	home_ownership,
	COUNT(id) AS Total_Loan_Applications,
	SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY COUNT(id) DESC






