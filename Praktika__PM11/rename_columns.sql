-- =====================================================
-- ПЕРЕИМЕНОВАНИЕ СТОЛБЦОВ НА РУССКИЕ НАЗВАНИЯ ЫЫЫЫЫ)
-- =====================================================

EXEC sp_rename 'Должности.id_должности', 'ID_Должности', 'COLUMN';
EXEC sp_rename 'Должности.наименование', 'Наименование', 'COLUMN';

EXEC sp_rename 'Сотрудники.id_сотрудника', 'ID_Сотрудника', 'COLUMN';
EXEC sp_rename 'Сотрудники.фио', 'ФИО', 'COLUMN';
EXEC sp_rename 'Сотрудники.дата_приема', 'Дата_Приема', 'COLUMN';
EXEC sp_rename 'Сотрудники.телефон', 'Телефон', 'COLUMN';
EXEC sp_rename 'Сотрудники.id_должности', 'ID_Должности', 'COLUMN';

EXEC sp_rename 'Поставщики.id_поставщика', 'ID_Поставщика', 'COLUMN';
EXEC sp_rename 'Поставщики.наименование', 'Наименование', 'COLUMN';
EXEC sp_rename 'Поставщики.контактный_телефон', 'Контактный_Телефон', 'COLUMN';
EXEC sp_rename 'Поставщики.адрес', 'Адрес', 'COLUMN';

EXEC sp_rename 'Ингредиенты.id_ингредиента', 'ID_Ингредиента', 'COLUMN';
EXEC sp_rename 'Ингредиенты.наименование', 'Наименование', 'COLUMN';
EXEC sp_rename 'Ингредиенты.единица_измерения', 'Единица_Измерения', 'COLUMN';
EXEC sp_rename 'Ингредиенты.текущий_остаток', 'Текущий_Остаток', 'COLUMN';
EXEC sp_rename 'Ингредиенты.минимальный_остаток', 'Минимальный_Остаток', 'COLUMN';
EXEC sp_rename 'Ингредиенты.себестоимость_за_единицу', 'Себестоимость_За_Единицу', 'COLUMN';

EXEC sp_rename 'Блюда.id_блюда', 'ID_Блюда', 'COLUMN';
EXEC sp_rename 'Блюда.наименование', 'Наименование', 'COLUMN';
EXEC sp_rename 'Блюда.время_приготовления_мин', 'Время_Приготовления_Мин', 'COLUMN';
EXEC sp_rename 'Блюда.цена_продажи', 'Цена_Продажи', 'COLUMN';

EXEC sp_rename 'Состав_блюд.id_состава', 'ID_Состава', 'COLUMN';
EXEC sp_rename 'Состав_блюд.id_блюда', 'ID_Блюда', 'COLUMN';
EXEC sp_rename 'Состав_блюд.id_ингредиента', 'ID_Ингредиента', 'COLUMN';
EXEC sp_rename 'Состав_блюд.необходимое_количество', 'Необходимое_Количество', 'COLUMN';

EXEC sp_rename 'Меню.id_меню', 'ID_Меню', 'COLUMN';
EXEC sp_rename 'Меню.дата_начала', 'Дата_Начала', 'COLUMN';
EXEC sp_rename 'Меню.дата_окончания', 'Дата_Окончания', 'COLUMN';
EXEC sp_rename 'Меню.наименование', 'Наименование', 'COLUMN';

EXEC sp_rename 'Состав_меню.id_состава_меню', 'ID_Состава_Меню', 'COLUMN';
EXEC sp_rename 'Состав_меню.id_меню', 'ID_Меню', 'COLUMN';
EXEC sp_rename 'Состав_меню.id_блюда', 'ID_Блюда', 'COLUMN';
EXEC sp_rename 'Состав_меню.цена_в_меню', 'Цена_В_Меню', 'COLUMN';

EXEC sp_rename 'Карты_лояльности.id_карты', 'ID_Карты', 'COLUMN';
EXEC sp_rename 'Карты_лояльности.номер_карты', 'Номер_Карты', 'COLUMN';
EXEC sp_rename 'Карты_лояльности.бонусный_баланс', 'Бонусный_Баланс', 'COLUMN';
EXEC sp_rename 'Карты_лояльности.дата_выдачи', 'Дата_Выдачи', 'COLUMN';

EXEC sp_rename 'Клиенты.id_клиента', 'ID_Клиента', 'COLUMN';
EXEC sp_rename 'Клиенты.имя', 'Имя', 'COLUMN';
EXEC sp_rename 'Клиенты.фамилия', 'Фамилия', 'COLUMN';
EXEC sp_rename 'Клиенты.телефон', 'Телефон', 'COLUMN';
EXEC sp_rename 'Клиенты.id_карты_лояльности', 'ID_Карты_Лояльности', 'COLUMN';

EXEC sp_rename 'Столы.id_стола', 'ID_Стола', 'COLUMN';
EXEC sp_rename 'Столы.номер_стола', 'Номер_Стола', 'COLUMN';
EXEC sp_rename 'Столы.вместимость', 'Вместимость', 'COLUMN';
EXEC sp_rename 'Столы.зона', 'Зона', 'COLUMN';

EXEC sp_rename 'Заказы.id_заказа', 'ID_Заказа', 'COLUMN';
EXEC sp_rename 'Заказы.id_клиента', 'ID_Клиента', 'COLUMN';
EXEC sp_rename 'Заказы.id_стола', 'ID_Стола', 'COLUMN';
EXEC sp_rename 'Заказы.id_сотрудника', 'ID_Сотрудника', 'COLUMN';
EXEC sp_rename 'Заказы.дата_время_заказа', 'Дата_Время_Заказа', 'COLUMN';
EXEC sp_rename 'Заказы.общая_сумма', 'Общая_Сумма', 'COLUMN';

EXEC sp_rename 'Позиции_заказов.id_позиции', 'ID_Позиции', 'COLUMN';
EXEC sp_rename 'Позиции_заказов.id_заказа', 'ID_Заказа', 'COLUMN';
EXEC sp_rename 'Позиции_заказов.id_блюда', 'ID_Блюда', 'COLUMN';
EXEC sp_rename 'Позиции_заказов.количество', 'Количество', 'COLUMN';
EXEC sp_rename 'Позиции_заказов.цена_позиции', 'Цена_Позиции', 'COLUMN';

EXEC sp_rename 'Способы_оплаты.id_способа_оплаты', 'ID_Способа_Оплаты', 'COLUMN';
EXEC sp_rename 'Способы_оплаты.наименование_способа', 'Наименование_Способа', 'COLUMN';

EXEC sp_rename 'Платежи.id_платежа', 'ID_Платежа', 'COLUMN';
EXEC sp_rename 'Платежи.id_заказа', 'ID_Заказа', 'COLUMN';
EXEC sp_rename 'Платежи.сумма', 'Сумма', 'COLUMN';
EXEC sp_rename 'Платежи.дата_время_платежа', 'Дата_Время_Платежа', 'COLUMN';
EXEC sp_rename 'Платежи.id_способа_оплаты', 'ID_Способа_Оплаты', 'COLUMN';

EXEC sp_rename 'Смены.id_смены', 'ID_Смены', 'COLUMN';
EXEC sp_rename 'Смены.наименование_смены', 'Наименование_Смены', 'COLUMN';
EXEC sp_rename 'Смены.время_начала', 'Время_Начала', 'COLUMN';
EXEC sp_rename 'Смены.время_окончания', 'Время_Окончания', 'COLUMN';

EXEC sp_rename 'График_смен.id_графика', 'ID_Графика', 'COLUMN';
EXEC sp_rename 'График_смен.id_сотрудника', 'ID_Сотрудника', 'COLUMN';
EXEC sp_rename 'График_смен.id_смены', 'ID_Смены', 'COLUMN';
EXEC sp_rename 'График_смен.дата_работы', 'Дата_Работы', 'COLUMN';

EXEC sp_rename 'Заказы_поставщикам.id_заказа_поставщику', 'ID_Заказа_Поставщику', 'COLUMN';
EXEC sp_rename 'Заказы_поставщикам.id_поставщика', 'ID_Поставщика', 'COLUMN';
EXEC sp_rename 'Заказы_поставщикам.id_сотрудника', 'ID_Сотрудника', 'COLUMN';
EXEC sp_rename 'Заказы_поставщикам.дата_заказа', 'Дата_Заказа', 'COLUMN';
EXEC sp_rename 'Заказы_поставщикам.ожидаемая_дата_поставки', 'Ожидаемая_Дата_Поставки', 'COLUMN';
EXEC sp_rename 'Заказы_поставщикам.статус', 'Статус', 'COLUMN';

EXEC sp_rename 'Позиции_поставок.id_позиции_поставки', 'ID_Позиции_Поставки', 'COLUMN';
EXEC sp_rename 'Позиции_поставок.id_заказа_поставщику', 'ID_Заказа_Поставщику', 'COLUMN';
EXEC sp_rename 'Позиции_поставок.id_ингредиента', 'ID_Ингредиента', 'COLUMN';
EXEC sp_rename 'Позиции_поставок.количество', 'Количество', 'COLUMN';
EXEC sp_rename 'Позиции_поставок.цена_за_единицу', 'Цена_За_Единицу', 'COLUMN';

EXEC sp_rename 'Журнал_статусов_заказов.id_записи', 'ID_Записи', 'COLUMN';
EXEC sp_rename 'Журнал_статусов_заказов.id_заказа', 'ID_Заказа', 'COLUMN';
EXEC sp_rename 'Журнал_статусов_заказов.статус', 'Статус', 'COLUMN';
EXEC sp_rename 'Журнал_статусов_заказов.дата_время_изменения', 'Дата_Время_Изменения', 'COLUMN';
EXEC sp_rename 'Журнал_статусов_заказов.id_сотрудника', 'ID_Сотрудника', 'COLUMN';

EXEC sp_rename 'Движения_склада.id_движения', 'ID_Движения', 'COLUMN';
EXEC sp_rename 'Движения_склада.id_ингредиента', 'ID_Ингредиента', 'COLUMN';
EXEC sp_rename 'Движения_склада.id_сотрудника', 'ID_Сотрудника', 'COLUMN';
EXEC sp_rename 'Движения_склада.тип_операции', 'Тип_Операции', 'COLUMN';
EXEC sp_rename 'Движения_склада.количество', 'Количество', 'COLUMN';
EXEC sp_rename 'Движения_склада.дата_время_операции', 'Дата_Время_Операции', 'COLUMN';
EXEC sp_rename 'Движения_склада.ссылка', 'Ссылка', 'COLUMN';