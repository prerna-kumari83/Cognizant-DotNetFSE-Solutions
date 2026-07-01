-- ============================================
-- Exercise 5: Return Data from a Stored Procedure
-- Goal: Create a stored procedure that returns the
-- total number of employees in a department.
-- ============================================

-- Step 1 & 2: Define the stored procedure with a DepartmentID parameter
-- and count the employees in that department
CREATE PROCEDURE sp_GetEmployeeCountByDepartment
    @DepartmentID INT
AS
BEGIN
    SELECT
        D.DepartmentID,
        D.DepartmentName,
        COUNT(E.EmployeeID) AS TotalEmployees
    FROM Departments D
    LEFT JOIN Employees E
        ON D.DepartmentID = E.DepartmentID
    WHERE D.DepartmentID = @DepartmentID
    GROUP BY D.DepartmentID, D.DepartmentName;
END;
GO

-- Step 3: Execute the stored procedure to save/test it
EXEC sp_GetEmployeeCountByDepartment @DepartmentID = 3;  -- IT

-- Other departments to test
-- EXEC sp_GetEmployeeCountByDepartment @DepartmentID = 1;  -- HR
-- EXEC sp_GetEmployeeCountByDepartment @DepartmentID = 2;  -- Finance
-- EXEC sp_GetEmployeeCountByDepartment @DepartmentID = 4;  -- Marketing