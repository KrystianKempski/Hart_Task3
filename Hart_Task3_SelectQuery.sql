SELECT w.WorkerName AS 'Pracownik' ,m.WorkerName AS 'Kierownik',b.BranchName AS 'Filia', wo.guardians AS 'Opiekunowie filii', w.DepartmentName AS 'Dzia³',w.PositionName AS 'Stanowisko'
FROM Workers w 
LEFT JOIN Workers m ON w.ManagerID = m.WorkerID
LEFT JOIN Branches b ON w.BranchID = b.BranchID
LEFT JOIN 
	(SELECT wo.BranchID, STRING_AGG(wo.WorkerName,', ') AS guardians
	FROM (
		SELECT DISTINCT  wo.BranchID, m.WorkerName 
		FROM Workers wo 
		INNER JOIN Workers m ON wo.BranchID = m.SupervisedBranchID
		) wo
	GROUP BY wo.BranchID) wo 
ON wo.BranchID = w.BranchID
