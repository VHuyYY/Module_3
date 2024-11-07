create database Ss3_Quan_li_sinh_vien;
use Ss3_Quan_li_sinh_vien;


CREATE TABLE class (
    ClassID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    ClassName VARCHAR(60) NOT NULL,
    StartDate DATETIME NOT NULL,
    Statuss BIT
);

CREATE TABLE student (
    StudentID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    StudentName VARCHAR(30) NOT NULL,
    Address VARCHAR(50),
    Phone VARCHAR(20),
    Statuss BIT,
    ClassID INT NOT NULL,
    FOREIGN KEY (ClassID)
        REFERENCES class (ClassID)
);

CREATE TABLE Subjects (
    SubID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    SubName VARCHAR(30) NOT NULL,
    Creadit TINYINT NOT NULL DEFAULT 1 CHECK (Creadit >= 1),
    Statuss BIT
);

CREATE TABLE Mark (
    MarkID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    SubID INT NOT NULL,
    StudentID INT NOT NULL,
    Mark FLOAT DEFAULT 0 CHECK (Mark BETWEEN 0 AND 100),
    UNIQUE (SubID , StudentID),
    FOREIGN KEY (SubID)
        REFERENCES Subjects (SubID),
    FOREIGN KEY (StudentID)
        REFERENCES student (StudentID)
);

INSERT INTO student (StudentName, Address, Phone, Statuss, ClassID)
VALUES 
    ('Hung Nguyen', '234 Elm St', '789-012-3456', 1, 1),
    ('Ha Tran', '456 Oak St', '123-456-7891', 1, 3),
    ('An Nguyen', '789 Maple St', '345-678-9013', 1, 2);

INSERT INTO class (ClassName, StartDate, Statuss)
VALUES 
    ('History 101', '2024-12-01 09:00:00', 1),
    ('Math 101', '2024-09-01 08:00:00', 1),
    ('Physics 102', '2024-09-01 09:00:00', 1);

INSERT INTO Subjects (SubName, Creadit, Statuss)
VALUES 
    ('Mathematics', 3, 1),
    ('Biology', 4, 1),
    ('Computer Science', 5, 1),
    ('Literature', 2, 1);

  INSERT INTO Mark (SubID, StudentID, Mark)
VALUES 
    (1, 1, 85.5),   
    (2, 1, 75.0),   
    (1, 2, 88.0),   
    (3, 2, 92.0),   
    (4, 3, 70.0);   

-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
SELECT * 
FROM student 
WHERE StudentName LIKE 'H%'; 	

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
SELECT * 
FROM class 
WHERE MONTH(StartDate) = 12;

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
SELECT * 
FROM Subjects 
WHERE Creadit BETWEEN 3 AND 5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
UPDATE student 
SET ClassID = 2 
WHERE StudentName = 'Hung Nguyen';

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần
SELECT s.StudentName, subj.SubName, m.Mark
FROM Mark m
JOIN student s ON m.StudentID = s.StudentID
JOIN Subjects subj ON m.SubID = subj.SubID
ORDER BY m.Mark DESC, s.StudentName ASC;