-- Создание базы данных ресторана "Рататуй"
CREATE DATABASE dbRatatouille;

USE dbRatatouille;

--Создание таблицы продукты
CREATE TABLE Dishes (
	Id INT PRIMARY KEY IDENTITY(1,1),
    Name varchar(255) NOT NULL
);

--Создание таблицы категории
CREATE TABLE Categories (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(255) NOT NULL
);

--Создание таблицы связей продукты категории
CREATE TABLE DishesCategories (
    Id INT PRIMARY KEY IDENTITY(1,1),
    DishId INT,
    CategoryId INT,
    FOREIGN KEY (DishId) REFERENCES Dishes(Id),
    FOREIGN KEY (CategoryId) REFERENCES Categories(Id)
);

--Добавление данных в таблицу продукты
INSERT INTO Dishes (Name)
VALUES
    ('Spaghetti Bolognese'),
    ('Chicken Alfredo'),
    ('Beef Stroganoff'),
    ('Caesar Salad'),
    ('Pepperoni Pizza'),
    ('Sushi Roll'),
    ('Mushroom Risotto'),
    ('Grilled Salmon');

--Добавление данных в таблицу категории
INSERT INTO Categories (Name)
VALUES
    ('Italian Cuisine'),
    ('American Classics'),
    ('Russian Dishes'),
    ('Salads and Greens');

-- Утсановка связей между продуктами и категориями
INSERT INTO DishesCategories (DishId, CategoryId)
VALUES
    (1, 1),
    (2, 1),
    (3, 2),
    (4, 3),
    (5, 2),
    (4, 4);

-- Выборка имени продукта и имени категории
SELECT P.Name AS DishName, STRING_AGG(C.Name, ', ') AS CategoryNames
FROM Dishes AS P
LEFT JOIN DishesCategories AS PC ON P.Id = PC.DishId
LEFT JOIN Categories AS C ON PC.CategoryId = C.Id
GROUP BY P.Name;