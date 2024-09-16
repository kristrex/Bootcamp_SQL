CREATE TABLE graph 
(
    point1 VARCHAR(1) NOT NULL,
    point2 VARCHAR(1) NOT NULL,
    cost INT NOT NULL
);


INSERT INTO graph (point1, point2, cost)
VALUES 
('A', 'B', 10),
('B', 'A', 10),
('A', 'D', 20),
('D', 'A', 20),
('A', 'C', 15),
('C', 'A', 15),
('B', 'C', 35),
('C', 'B', 35),
('D', 'B', 25),
('B', 'D', 25),
('D', 'C', 30),
('C', 'D', 30)