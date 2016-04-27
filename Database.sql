DROP DATABASE IF EXISTS University;
CREATE DATABASE University;
USE University;


DROP TABLE IF EXISTS `Students`;
CREATE TABLE Students (SID SMALLINT PRIMARY KEY AUTO_INCREMENT, Name TINYTEXT, Email TINYTEXT, Registration_Date DATE, Phone_Number BIGINT, Address TEXT, Department SMALLINT);

DROP TABLE IF EXISTS `Courses`;
CREATE TABLE Courses (CID SMALLINT PRIMARY KEY AUTO_INCREMENT, Name TINYTEXT, Credits TINYINT, Instructor SMALLINT, Department SMALLINT);

DROP TABLE IF EXISTS `Academic_Info`;
CREATE TABLE Academic_Info (SID SMALLINT PRIMARY KEY, Credits_Earned TINYINT, GPA DECIMAL, Advisor SMALLINT);

DROP TABLE IF EXISTS `Department`;
CREATE TABLE Department (DID SMALLINT PRIMARY KEY AUTO_INCREMENT, Name TINYTEXT);

DROP TABLE IF EXISTS `Instructors`;
CREATE TABLE Instructors (IID SMALLINT PRIMARY KEY AUTO_INCREMENT, Name TINYTEXT, Email TINYTEXT, Department SMALLINT, Room SMALLINT);

DROP TABLE IF EXISTS `Courses_Taken`;
CREATE TABLE Courses_Taken (SID SMALLINT, CID SMALLINT, Final_Grade DECIMAL(8,2));



INSERT INTO Students VALUES (1,"Murat Koyuncu", "mk@uni.edu", '2016-09-11', 05336548965, "Ankara,Turkey" , 1);
INSERT INTO Students VALUES (2, "Anakin Skywalker", "as@uni.edu", '2014-09-19', 05312344878, "Naboo,Faraway" , 2);
INSERT INTO Students VALUES (3, "Harley Quinn", "hq@uni.edu", '2011-09-07', 05413752255, "Gotham,USA" , 5);
INSERT INTO Students VALUES (4, "Josh Framm", "jf@uni.edu", '2016-09-17', 05969843567, "California,USA" , 3);
INSERT INTO Students VALUES (5, "Bihter Ziyagil", "bz@uni.edu", '2015-08-11',05642389974 , "Istanbul,Turkey" , 4);
INSERT INTO Students VALUES (6, "Rosie Huntington", "rh@uni.edu", '2013-10-20',05333333333 , "London,UK" , 2);
INSERT INTO Students VALUES (7, "Snow White", "sw@uni.edu", '2011-09-20',05223649920 , "fairytale,Disney" , 4);
INSERT INTO Students VALUES (8, "Tyrion Lannister", "tl@uni.edu", '2015-04-24',05377077707 , "Casterly Rock,Westeros" , 1);



INSERT INTO Courses VALUES (1, "Chemistry 404", 3, 5, 5);
INSERT INTO Courses VALUES (2, "Java 212", 4, 1, 1);
INSERT INTO Courses VALUES (3, "Math 203", 4, 4, 3);
INSERT INTO Courses VALUES (4, "Literature 100", 3, 3, 4);
INSERT INTO Courses VALUES (5, "Physics 105", 3, 4, 3);
INSERT INTO Courses VALUES (6, "Alghorithms 221", 4, 1, 1);
INSERT INTO Courses VALUES (7, "English 102", 3, 2, 4);
INSERT INTO Courses VALUES (8, "History 106", 2, 6, 2);
INSERT INTO Courses VALUES (9, "Drama 101", 2, 3, 4);



INSERT INTO Instructors VALUES (1, "Eliot Alderson", "ea@uni.edu", 1, 217);
INSERT INTO Instructors VALUES (2, "Severus Snape", "ss@uni.edu", 2, 114);
INSERT INTO Instructors VALUES (3, "John Keathan", "jk@uni.edu", 4, 119);
INSERT INTO Instructors VALUES (4, "Albert Einstein", "ae@uni.edu", 3, 321);
INSERT INTO Instructors VALUES (5, "Walter White", "ww@uni.edu", 5, 021);
INSERT INTO Instructors VALUES (6, "Adolf Hitler", "ah@uni.edu", 2, 113);



INSERT INTO Department VALUES (1, "Engineering");
INSERT INTO Department VALUES (2, "Law");
INSERT INTO Department VALUES (3, "Basic Sciences");
INSERT INTO Department VALUES (4, "Art");
INSERT INTO Department VALUES (5, "Medical Sciences");



INSERT INTO Courses_Taken VALUES (1,3,1.5);
INSERT INTO Courses_Taken VALUES (1,2,3.0);
INSERT INTO Courses_Taken VALUES (1,8,2.0);
INSERT INTO Courses_Taken VALUES (2,5,4.0);
INSERT INTO Courses_Taken VALUES (2,8,3.5);
INSERT INTO Courses_Taken VALUES (2,9,2.5);
INSERT INTO Courses_Taken VALUES (3,1,4.0);
INSERT INTO Courses_Taken VALUES (3,7,1.5);
INSERT INTO Courses_Taken VALUES (4,1,2.0);
INSERT INTO Courses_Taken VALUES (4,3,1.5);
INSERT INTO Courses_Taken VALUES (4,5,1.0);
INSERT INTO Courses_Taken VALUES (5,4,3.5);
INSERT INTO Courses_Taken VALUES (5,9,4.0);
INSERT INTO Courses_Taken VALUES (6,4,3.0);
INSERT INTO Courses_Taken VALUES (6,7,2.0);
INSERT INTO Courses_Taken VALUES (6,8,4.0);
INSERT INTO Courses_Taken VALUES (7,4,4.0);
INSERT INTO Courses_Taken VALUES (7,9,3.0);
INSERT INTO Courses_Taken VALUES (8,2,3.5);
INSERT INTO Courses_Taken VALUES (8,3,4.0);
INSERT INTO Courses_Taken VALUES (8,5,4.0);
INSERT INTO Courses_Taken VALUES (8,6,4.0);
INSERT INTO Courses_Taken VALUES (8,7,4.0);


ALTER TABLE Students ADD FOREIGN KEY (Department) REFERENCES Department (DID);
ALTER TABLE Instructors ADD FOREIGN KEY (Department) REFERENCES Department (DID);
ALTER TABLE Courses_Taken ADD FOREIGN KEY (SID) REFERENCES Students (SID);
ALTER TABLE Courses_Taken ADD FOREIGN KEY (CID) REFERENCES Courses (CID);
ALTER TABLE Courses ADD FOREIGN KEY (Instructor) REFERENCES Instructors (IID);
ALTER TABLE Courses ADD FOREIGN KEY (Department) REFERENCES Department (DID);
ALTER TABLE Academic_Info ADD FOREIGN KEY (SID) REFERENCES Students (SID);
ALTER TABLE Academic_Info ADD FOREIGN KEY (Advisor) REFERENCES Instructors (IID);

