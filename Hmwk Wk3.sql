

CREATE TABLE Groups
(
  idGroups int PRIMARY KEY,
  GroupName varchar(50) NOT NULL
);


INSERT INTO Groups ( idGroups, GroupName) VALUES (1, 'I.T.');
INSERT INTO Groups ( idGroups, GroupName) VALUES (2, 'Sales');
INSERT INTO Groups ( idGroups, GroupName) VALUES (3, 'Administration');
INSERT INTO Groups ( idGroups, GroupName) VALUES (4, 'Operations');


CREATE TABLE Employee
(
  idEmployee int PRIMARY KEY,
  EmployeeName varchar(50) NOT NULL,
  idGroups int references Groups(idGroups)
);


INSERT INTO Users (idEmployee, EmployeeName, idGroups) VALUES (1, 'Modesto', 1);
INSERT INTO Users (idEmployee, EmployeeName, idGroups) VALUES (2, 'Ayine', 1);

INSERT INTO Users (idEmployee, EmployeeName, idGroups) VALUES (3, 'Christopher', 2);
INSERT INTO Users (idEmployee, EmployeeName, idGroups) VALUES (4, 'Cheong woo', 2);

INSERT INTO Users (idEmployee, EmployeeName, idGroups) VALUES (5, 'Saulat', 3);
INSERT INTO Users (idEmployee, EmployeeName, idGroups) VALUES (6, 'Heidy', null);


CREATE TABLE Rooms
(
  idRooms int PRIMARY KEY,
  Room_Name varchar(50) NOT NULL
);


INSERT INTO Rooms (idRooms, Room_Name) VALUES (1, '101');
INSERT INTO Rooms (idRooms, Room_Name) VALUES (2, '102');
INSERT INTO Rooms (idRooms, Room_Name) VALUES (3, 'Auditorium A');
INSERT INTO Rooms (idRooms, Room_Name) VALUES (4, 'Auditorium B');


CREATE TABLE GroupRooms
(
  idGroups int references Groups(idGroups),
  idRooms int references Rooms(idRooms)
);


INSERT INTO GroupRooms (idGroups, idRooms) VALUES (1, 1);
INSERT INTO GroupRooms (idGroups, idRooms) VALUES (1, 2);

INSERT INTO GroupRooms (idGroups, idRooms) VALUES (2, 2);
INSERT INTO GroupRooms (idGroups, idRooms) VALUES (2, 3);


-- All groups, and the users in each group. A group should appear even if there are no users assigned to the group.

Select *, Employeename from Groups 
left join Employee  on idgroups = idgroups;


-- All rooms, and the groups assigned to each room. The rooms should appear even if no groups have been assigned to them.

Select *, Groupname from Rooms 
left join GroupRooms  on idRooms = idRooms
left join Groups  on idgroups = idgroups ;

-- A list of users, the groups that they belong to, and the rooms to which they are assigned. This should be sorted alphabetically by user, then by group, then by room.

Select idemployee, employeename, Groupname, Roomname from Employee
left join Groups  on idgroups = idgroups
left join GroupRooms on idgroups = idGroups
left join Rooms  on idrooms = idrooms
order by Employeename, Groupname, Roomname;