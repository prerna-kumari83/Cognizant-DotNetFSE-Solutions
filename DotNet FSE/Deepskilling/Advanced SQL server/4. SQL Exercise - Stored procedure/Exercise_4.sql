-- ============================================
-- Exercise 4: Execute a Stored Procedure
-- Goal: Execute the stored procedure to retrieve
-- employee details for a specific department.
-- ============================================

-- Step 1 & 2: Execute the stored procedure with a DepartmentID parameter
EXEC sp_GetEmployeesByDepartment @DepartmentID = 3;

-- Other departments to test

EXEC sp_GetEmployeesByDepartment @DepartmentID = 1;  -- HR
EXEC sp_GetEmployeesByDepartment @DepartmentID = 2;  -- Finance
EXEC sp_GetEmployeesByDepartment @DepartmentID = 4;  -- Marketing