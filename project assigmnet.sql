create temporary table employeidcntryid
SELECT employeeworkingcentres.EWC_EMPLOYEE_ID, workingcentre.WC_COUNTRY_ID
FROM employeeworkingcentres
INNER JOIN workingcentre ON employeeworkingcentres.EWC_WORKING_CENTRE_ID = workingcentre.WC_ID;
SELECT * FROM employeidcntryid;


UPDATE
 employees
SET EMP_COUNTRY_ORIGIN_ID =
 (SELECT
   employeidcntryid.WC_COUNTRY_ID
 FROM
 employeidcntryid 
 WHERE
 employeidcntryid.EWC_EMPLOYEE_ID = employees.EMP_ID )
WHERE employees.EMP_COUNTRY_ORIGIN_ID IS NULL;

SELECT EMP_ID, EMP_COUNTRY_ORIGIN_ID FROM employees;

Create temporary table final
SELECT employees.EMP_ID, countries.CTRY_NAME
FROM employees
INNER JOIN countries ON employees.EMP_COUNTRY_ORIGIN_ID = countries.CTRY_ID;
SELECT * FROM final;

SELECT
 CTRY_NAME AS COUNTRY,
 COUNT(*) AS Counts
FROM
 final
GROUP BY
 CTRY_NAME
ORDER BY Counts DESC;


