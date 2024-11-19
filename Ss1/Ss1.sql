create database Ss1;
use ss1;

-- Bảng Class có các trường lần lượt là id, name
CREATE TABLE class (
    id INT,
    name VARCHAR(50),
    PRIMARY KEY (id)
);
-- Bảng Teacher có các trường lần lượt là id, name, age, country
CREATE TABLE teacher (
    id INT,
    name VARCHAR(50),
    age INT,
    country VARCHAR(50),
    PRIMARY KEY (id)
);

SELECT 
    *
FROM
    class