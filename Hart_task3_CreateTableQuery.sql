CREATE TABLE Branches (
	BranchID int NOT NULL PRIMARY KEY,
	BranchName varchar(255), 
);
CREATE TABLE Workers (
    WorkerID int NOT NULL PRIMARY KEY,
    WorkerName varchar(255),
    ManagerID int, 
	BranchID int, 
	DepartmentName varchar(255),
	SupervisedBranchID int,
	PostionName varchar(255), 
	constraint manager_fk1 foreign key (ManagerID) references Workers(WorkerID),
	constraint branch_fk2 foreign key (BranchID) references Branches(BranchID), 
	constraint supervisers_fk3 foreign key (SupervisedBranchID) references Workers(WorkerID)
);

