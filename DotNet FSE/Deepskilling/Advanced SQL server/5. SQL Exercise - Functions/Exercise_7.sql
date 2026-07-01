-- ============================================
-- Exercise 7: Return Data from a Scalar Function
-- Goal: Return the annual salary for a specific
-- employee using fn_CalculateAnnualSalary.
-- ============================================

-- NOTE: This function is expected to already exist from an earlier
-- exercise (e.g. Exercise 6). Included here so this file can run
-- standalone. Skip this block if the function is already created.
CREATE FUNCTION fn_CalculateAnnualSalary (@EmployeeID INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @AnnualSalary DECIMAL(10,2);

    SELECT @AnnualSalary = Salary * 12
    FROM Employees
    WHERE EmployeeID = @EmployeeID;

    RETURN @AnnualSalary;
END;
GO

-- Step 1: Execute the function for EmployeeID = 1
SELECT dbo.fn_CalculateAnnualSalary(1) AS AnnualSalary;

-- Step 2: Verify the result
-- EmployeeID 1 = John Doe, Salary = 5000.00/month
-- Expected AnnualSalary = 5000.00 * 12 = 60000.00