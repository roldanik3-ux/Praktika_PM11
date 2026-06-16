-- =====================================================
-- ВСТАВКА 100 ЗАПИСЕЙ В КАЖДУЮ ТАБЛИЦУ
-- =====================================================

-- 1. Должности (100 записей)
DECLARE @i INT = 1;
WHILE @i <= 100
BEGIN
    INSERT INTO Должности (наименование) VALUES ('Должность_' + CAST(@i AS VARCHAR));
    SET @i = @i + 1;
END;

-- 2. Сотрудники (100 записей)
SET @i = 1;
WHILE @i <= 100
BEGIN
    INSERT INTO Сотрудники (фио, дата_приема, телефон, id_должности) 
    VALUES ('Сотрудник_' + CAST(@i AS VARCHAR), 
            DATEADD(DAY, @i, '2023-01-01'), 
            '+7916123456' + RIGHT('00' + CAST(@i AS VARCHAR), 2), 
            1 + (@i % 10));
    SET @i = @i + 1;
END;

-- 3. Поставщики (100 записей)
SET @i = 1;
WHILE @i <= 100
BEGIN
    INSERT INTO Поставщики (наименование, контактный_телефон, адрес) 
    VALUES ('Поставщик_' + CAST(@i AS VARCHAR), 
            '+7495123456' + RIGHT('00' + CAST(@i AS VARCHAR), 2), 
            'Москва, ул. Поставщиков, д.' + CAST(@i AS VARCHAR));
    SET @i = @i + 1;
END;

-- 4. Ингредиенты (100 записей)
SET @i = 1;
WHILE @i <= 100
BEGIN
    INSERT INTO Ингредиенты (наименование, единица_измерения, текущий_остаток, минимальный_остаток, себестоимость_за_единицу) 
    VALUES ('Ингредиент_' + CAST(@i AS VARCHAR), 
            CASE WHEN @i % 3 = 0 THEN 'кг' WHEN @i % 3 = 1 THEN 'л' ELSE 'шт' END,
            @i * 5 + 50, 
            @i % 20 + 5, 
            @i * 2 + 10);
    SET @i = @i + 1;
END;

-- 5. Блюда (100 записей)
SET @i = 1;
WHILE @i <= 100
BEGIN
    INSERT INTO Блюда (наименование, время_приготовления_мин, цена_продажи) 
    VALUES ('Блюдо_' + CAST(@i AS VARCHAR), 
            @i % 40 + 5, 
            @i * 3 + 50);
    SET @i = @i + 1;
END;

-- 6. Состав_блюд (100 записей)
SET @i = 1;
WHILE @i <= 100
BEGIN
    INSERT INTO Состав_блюд (id_блюда, id_ингредиента, необходимое_количество) 
    VALUES (@i, @i, @i * 0.1 + 0.1);
    SET @i = @i + 1;
END;

-- 7. Меню (100 записей)
SET @i = 1;
WHILE @i <= 100
BEGIN
    INSERT INTO Меню (дата_начала, дата_окончания, наименование) 
    VALUES (DATEADD(DAY, @i, '2025-06-01'), NULL, 'Меню_' + CAST(@i AS VARCHAR));
    SET @i = @i + 1;
END;

-- 8. Состав_меню (100 записей)
SET @i = 1;
WHILE @i <= 100
BEGIN
    INSERT INTO Состав_меню (id_меню, id_блюда, цена_в_меню) 
    VALUES ((@i % 10) + 1, @i, @i * 3 + 50);
    SET @i = @i + 1;
END;

-- 9. Карты_лояльности (100 записей)
SET @i = 1;
WHILE @i <= 100
BEGIN
    INSERT INTO Карты_лояльности (номер_карты, бонусный_баланс, дата_выдачи) 
    VALUES ('9000' + RIGHT('0000' + CAST(@i AS VARCHAR), 6), @i * 5, '2024-01-01');
    SET @i = @i + 1;
END;

-- 10. Клиенты (100 записей)
SET @i = 1;
WHILE @i <= 100
BEGIN
    INSERT INTO Клиенты (имя, фамилия, телефон, id_карты_лояльности) 
    VALUES ('Имя_' + CAST(@i AS VARCHAR), 
            'Фамилия_' + CAST(@i AS VARCHAR), 
            '+7916' + RIGHT('000000' + CAST(@i AS VARCHAR), 7), 
            @i);
    SET @i = @i + 1;
END;

-- 11. Столы (100 записей)
SET @i = 1;
WHILE @i <= 100
BEGIN
    INSERT INTO Столы (номер_стола, вместимость, зона) 
    VALUES (@i, 2 + (@i % 6), 
            CASE WHEN @i % 3 = 0 THEN 'Зал 1' WHEN @i % 3 = 1 THEN 'Зал 2' ELSE 'Веранда' END);
    SET @i = @i + 1;
END;

-- 12. Заказы (100 записей)
SET @i = 1;
WHILE @i <= 100
BEGIN
    INSERT INTO Заказы (id_клиента, id_стола, id_сотрудника, дата_время_заказа, общая_сумма) 
    VALUES (@i, @i, 1 + (@i % 10), 
            DATEADD(MINUTE, @i, '2025-06-10 10:00:00'), 
            100 + @i * 5);
    SET @i = @i + 1;
END;

-- 13. Позиции_заказов (100 записей)
SET @i = 1;
WHILE @i <= 100
BEGIN
    INSERT INTO Позиции_заказов (id_заказа, id_блюда, количество, цена_позиции) 
    VALUES (@i, 1 + (@i % 100), 1 + (@i % 5), 50 + @i * 3);
    SET @i = @i + 1;
END;

-- 14. Способы_оплаты (100 записей)
SET @i = 1;
WHILE @i <= 100
BEGIN
    INSERT INTO Способы_оплаты (наименование_способа) 
    VALUES (CASE WHEN @i % 4 = 0 THEN 'Наличные' WHEN @i % 4 = 1 THEN 'Карта' WHEN @i % 4 = 2 THEN 'Бонусы' ELSE 'QR-код' END);
    SET @i = @i + 1;
END;

-- 15. Платежи (100 записей)
SET @i = 1;
WHILE @i <= 100
BEGIN
    INSERT INTO Платежи (id_заказа, сумма, дата_время_платежа, id_способа_оплаты) 
    VALUES (@i, 100 + @i * 5, 
            DATEADD(MINUTE, @i + 5, '2025-06-10 10:00:00'), 
            1 + (@i % 100));
    SET @i = @i + 1;
END;

-- 16. Смены (100 записей)
SET @i = 1;
WHILE @i <= 100
BEGIN
    INSERT INTO Смены (наименование_смены, время_начала, время_окончания) 
    VALUES ('Смена_' + CAST(@i AS VARCHAR), 
            '08:00:00', 
            '16:00:00');
    SET @i = @i + 1;
END;

-- 17. График_смен (100 записей)
SET @i = 1;
WHILE @i <= 100
BEGIN
    INSERT INTO График_смен (id_сотрудника, id_смены, дата_работы) 
    VALUES (@i, 1 + (@i % 100), DATEADD(DAY, @i, '2025-06-01'));
    SET @i = @i + 1;
END;

-- 18. Заказы_поставщикам (100 записей)
SET @i = 1;
WHILE @i <= 100
BEGIN
    INSERT INTO Заказы_поставщикам (id_поставщика, id_сотрудника, дата_заказа, ожидаемая_дата_поставки, статус) 
    VALUES (1 + (@i % 100), 1 + (@i % 100), 
            DATEADD(DAY, @i, '2025-06-01'), 
            DATEADD(DAY, @i + 5, '2025-06-01'), 
            CASE WHEN @i % 5 = 0 THEN 'pending' WHEN @i % 5 = 1 THEN 'delivered' ELSE 'completed' END);
    SET @i = @i + 1;
END;

-- 19. Позиции_поставок (100 записей)
SET @i = 1;
WHILE @i <= 100
BEGIN
    INSERT INTO Позиции_поставок (id_заказа_поставщику, id_ингредиента, количество, цена_за_единицу) 
    VALUES (1 + (@i % 100), 1 + (@i % 100), 10 + @i, 10 + @i * 2);
    SET @i = @i + 1;
END;

-- 20. Журнал_статусов_заказов (100 записей)
SET @i = 1;
WHILE @i <= 100
BEGIN
    INSERT INTO Журнал_статусов_заказов (id_заказа, статус, дата_время_изменения, id_сотрудника) 
    VALUES (1 + (@i % 100), 
            CASE WHEN @i % 5 = 0 THEN 'created' WHEN @i % 5 = 1 THEN 'cooking' WHEN @i % 5 = 2 THEN 'ready' WHEN @i % 5 = 3 THEN 'served' ELSE 'closed' END,
            DATEADD(MINUTE, @i, '2025-06-10 10:00:00'), 
            1 + (@i % 10));
    SET @i = @i + 1;
END;

-- 21. Движения_склада (100 записей)
SET @i = 1;
WHILE @i <= 100
BEGIN
    INSERT INTO Движения_склада (id_ингредиента, id_сотрудника, тип_операции, количество, дата_время_операции, ссылка) 
    VALUES (1 + (@i % 100), 1 + (@i % 100), 
            CASE WHEN @i % 3 = 0 THEN 'incoming' WHEN @i % 3 = 1 THEN 'write_off' ELSE 'waste' END,
            5 + @i, 
            DATEADD(HOUR, @i, '2025-06-01 08:00:00'), 
            'Док_' + CAST(@i AS VARCHAR));
    SET @i = @i + 1;
END;