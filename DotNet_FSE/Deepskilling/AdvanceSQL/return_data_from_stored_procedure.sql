DELIMITER $$

CREATE PROCEDURE sp_GetEmployeeCountByDepartment(IN deptId INT)
BEGIN
    SELECT COUNT(*) AS TotalEmployees
    FROM Employees
    WHERE DepartmentID = deptId;
END$$

DELIMITER ;


CALL sp_GetEmployeeCountByDepartment(2);