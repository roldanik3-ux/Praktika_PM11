-- =====================================================
-- СОЗДАНИЕ ТАБЛИЦ ДЛЯ БАЗЫ ДАННЫХ "СТОЛОВАЯ"
-- =====================================================

-- 1. Должности
CREATE TABLE Должности (
    id_должности INT PRIMARY KEY IDENTITY(1,1),
    наименование NVARCHAR(50) NOT NULL
);

-- 2. Сотрудники
CREATE TABLE Сотрудники (
    id_сотрудника INT PRIMARY KEY IDENTITY(1,1),
    фио NVARCHAR(100) NOT NULL,
    дата_приема DATE NOT NULL,
    телефон NVARCHAR(20),
    id_должности INT,
    FOREIGN KEY (id_должности) REFERENCES Должности(id_должности)
);

-- 3. Поставщики
CREATE TABLE Поставщики (
    id_поставщика INT PRIMARY KEY IDENTITY(1,1),
    наименование NVARCHAR(150) NOT NULL,
    контактный_телефон NVARCHAR(20),
    адрес NVARCHAR(MAX)
);

-- 4. Ингредиенты
CREATE TABLE Ингредиенты (
    id_ингредиента INT PRIMARY KEY IDENTITY(1,1),
    наименование NVARCHAR(100) NOT NULL,
    единица_измерения NVARCHAR(20) NOT NULL,
    текущий_остаток DECIMAL(12,3) NOT NULL DEFAULT 0,
    минимальный_остаток DECIMAL(12,3) NOT NULL,
    себестоимость_за_единицу DECIMAL(10,2) NOT NULL
);

-- 5. Блюда
CREATE TABLE Блюда (
    id_блюда INT PRIMARY KEY IDENTITY(1,1),
    наименование NVARCHAR(100) NOT NULL,
    время_приготовления_мин INT NOT NULL,
    цена_продажи DECIMAL(10,2) NOT NULL
);

-- 6. Состав_блюд
CREATE TABLE Состав_блюд (
    id_состава INT PRIMARY KEY IDENTITY(1,1),
    id_блюда INT NOT NULL,
    id_ингредиента INT NOT NULL,
    необходимое_количество DECIMAL(10,3) NOT NULL,
    FOREIGN KEY (id_блюда) REFERENCES Блюда(id_блюда),
    FOREIGN KEY (id_ингредиента) REFERENCES Ингредиенты(id_ингредиента)
);

-- 7. Меню
CREATE TABLE Меню (
    id_меню INT PRIMARY KEY IDENTITY(1,1),
    дата_начала DATE NOT NULL,
    дата_окончания DATE,
    наименование NVARCHAR(100) NOT NULL
);

-- 8. Состав_меню
CREATE TABLE Состав_меню (
    id_состава_меню INT PRIMARY KEY IDENTITY(1,1),
    id_меню INT NOT NULL,
    id_блюда INT NOT NULL,
    цена_в_меню DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_меню) REFERENCES Меню(id_меню),
    FOREIGN KEY (id_блюда) REFERENCES Блюда(id_блюда)
);

-- 9. Карты_лояльности
CREATE TABLE Карты_лояльности (
    id_карты INT PRIMARY KEY IDENTITY(1,1),
    номер_карты NVARCHAR(20) UNIQUE NOT NULL,
    бонусный_баланс DECIMAL(10,2) NOT NULL DEFAULT 0,
    дата_выдачи DATE NOT NULL
);

-- 10. Клиенты
CREATE TABLE Клиенты (
    id_клиента INT PRIMARY KEY IDENTITY(1,1),
    имя NVARCHAR(50) NOT NULL,
    фамилия NVARCHAR(50) NOT NULL,
    телефон NVARCHAR(20),
    id_карты_лояльности INT UNIQUE,
    FOREIGN KEY (id_карты_лояльности) REFERENCES Карты_лояльности(id_карты)
);

-- 11. Столы
CREATE TABLE Столы (
    id_стола INT PRIMARY KEY IDENTITY(1,1),
    номер_стола INT UNIQUE NOT NULL,
    вместимость INT NOT NULL,
    зона NVARCHAR(50)
);

-- 12. Заказы
CREATE TABLE Заказы (
    id_заказа INT PRIMARY KEY IDENTITY(1,1),
    id_клиента INT,
    id_стола INT NOT NULL,
    id_сотрудника INT NOT NULL,
    дата_время_заказа DATETIME2 NOT NULL DEFAULT GETDATE(),
    общая_сумма DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_клиента) REFERENCES Клиенты(id_клиента),
    FOREIGN KEY (id_стола) REFERENCES Столы(id_стола),
    FOREIGN KEY (id_сотрудника) REFERENCES Сотрудники(id_сотрудника)
);

-- 13. Позиции_заказов
CREATE TABLE Позиции_заказов (
    id_позиции INT PRIMARY KEY IDENTITY(1,1),
    id_заказа INT NOT NULL,
    id_блюда INT NOT NULL,
    количество INT NOT NULL,
    цена_позиции DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_заказа) REFERENCES Заказы(id_заказа),
    FOREIGN KEY (id_блюда) REFERENCES Блюда(id_блюда)
);

-- 14. Способы_оплаты
CREATE TABLE Способы_оплаты (
    id_способа_оплаты INT PRIMARY KEY IDENTITY(1,1),
    наименование_способа NVARCHAR(30) NOT NULL
);

-- 15. Платежи
CREATE TABLE Платежи (
    id_платежа INT PRIMARY KEY IDENTITY(1,1),
    id_заказа INT NOT NULL,
    сумма DECIMAL(10,2) NOT NULL,
    дата_время_платежа DATETIME2 NOT NULL DEFAULT GETDATE(),
    id_способа_оплаты INT NOT NULL,
    FOREIGN KEY (id_заказа) REFERENCES Заказы(id_заказа),
    FOREIGN KEY (id_способа_оплаты) REFERENCES Способы_оплаты(id_способа_оплаты)
);

-- 16. Смены
CREATE TABLE Смены (
    id_смены INT PRIMARY KEY IDENTITY(1,1),
    наименование_смены NVARCHAR(20) NOT NULL,
    время_начала TIME NOT NULL,
    время_окончания TIME NOT NULL
);

-- 17. График_смен
CREATE TABLE График_смен (
    id_графика INT PRIMARY KEY IDENTITY(1,1),
    id_сотрудника INT NOT NULL,
    id_смены INT NOT NULL,
    дата_работы DATE NOT NULL,
    FOREIGN KEY (id_сотрудника) REFERENCES Сотрудники(id_сотрудника),
    FOREIGN KEY (id_смены) REFERENCES Смены(id_смены)
);

-- 18. Заказы_поставщикам
CREATE TABLE Заказы_поставщикам (
    id_заказа_поставщику INT PRIMARY KEY IDENTITY(1,1),
    id_поставщика INT NOT NULL,
    id_сотрудника INT NOT NULL,
    дата_заказа DATE NOT NULL,
    ожидаемая_дата_поставки DATE,
    статус NVARCHAR(30) DEFAULT 'pending',
    FOREIGN KEY (id_поставщика) REFERENCES Поставщики(id_поставщика),
    FOREIGN KEY (id_сотрудника) REFERENCES Сотрудники(id_сотрудника)
);

-- 19. Позиции_поставок
CREATE TABLE Позиции_поставок (
    id_позиции_поставки INT PRIMARY KEY IDENTITY(1,1),
    id_заказа_поставщику INT NOT NULL,
    id_ингредиента INT NOT NULL,
    количество DECIMAL(12,3) NOT NULL,
    цена_за_единицу DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_заказа_поставщику) REFERENCES Заказы_поставщикам(id_заказа_поставщику),
    FOREIGN KEY (id_ингредиента) REFERENCES Ингредиенты(id_ингредиента)
);

-- 20. Журнал_статусов_заказов
CREATE TABLE Журнал_статусов_заказов (
    id_записи INT PRIMARY KEY IDENTITY(1,1),
    id_заказа INT NOT NULL,
    статус NVARCHAR(30) NOT NULL,
    дата_время_изменения DATETIME2 NOT NULL DEFAULT GETDATE(),
    id_сотрудника INT NOT NULL,
    FOREIGN KEY (id_заказа) REFERENCES Заказы(id_заказа),
    FOREIGN KEY (id_сотрудника) REFERENCES Сотрудники(id_сотрудника)
);

-- 21. Движения_склада
CREATE TABLE Движения_склада (
    id_движения INT PRIMARY KEY IDENTITY(1,1),
    id_ингредиента INT NOT NULL,
    id_сотрудника INT NOT NULL,
    тип_операции NVARCHAR(20) NOT NULL,
    количество DECIMAL(12,3) NOT NULL,
    дата_время_операции DATETIME2 NOT NULL DEFAULT GETDATE(),
    ссылка NVARCHAR(MAX),
    FOREIGN KEY (id_ингредиента) REFERENCES Ингредиенты(id_ингредиента),
    FOREIGN KEY (id_сотрудника) REFERENCES Сотрудники(id_сотрудника)
);