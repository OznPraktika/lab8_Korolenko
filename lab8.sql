CREATE TABLE IF NOT EXISTS Клиенты (
    ID_клиента SERIAL PRIMARY KEY,
    ФИО_клиента VARCHAR(255) NOT NULL,
    Серия_паспорта VARCHAR(10) NOT NULL,
    Номер_паспорта VARCHAR(10) NOT NULL,
    Контактный_номер VARCHAR(15) NOT NULL
);
CREATE TABLE IF NOT EXISTS Автомобили (
    ID_автомобиля SERIAL PRIMARY KEY,
    Модель_автомобиля VARCHAR(255) NOT NULL,
    Цвет_автомобиля VARCHAR(50) NOT NULL,
    Год_выпуска_автомобиля INT NOT NULL,
    Госномер_автомобиля VARCHAR(20) NOT NULL,
    Страховая_стоимость_автомобиля DECIMAL(10, 2) NOT NULL,
    Стоимость_одного_дня_проката DECIMAL(10, 2) NOT NULL
);

CREATE TABLE IF NOT EXISTS Прокат (
    ID_проката SERIAL PRIMARY KEY,
    ID_клиента INT REFERENCES Клиенты(ID_клиента) ON DELETE CASCADE,
    ID_автомобиля INT REFERENCES Автомобили(ID_автомобиля) ON DELETE CASCADE,
    Дата_начала_проката DATE NOT NULL,
    Количество_дней_проката INT NOT NULL,
    Общая_стоимость DECIMAL(10, 2) NOT NULL
);
CREATE TABLE IF NOT EXISTS Страхование (
    ID_страхования SERIAL PRIMARY KEY,
    ID_автомобиля INT REFERENCES Автомобили(ID_автомобиля) ON DELETE CASCADE,
    Номер_полиса VARCHAR(50) NOT NULL,
    Дата_начала_действия DATE NOT NULL,
    Дата_окончания_действия DATE NOT NULL,
    Страховая_сумма DECIMAL(10, 2) NOT NULL
);
CREATE TABLE IF NOT EXISTS Автомобили_Клиенты (
    ID SERIAL PRIMARY KEY,
    ID_клиента INT REFERENCES Клиенты(ID_клиента) ON DELETE CASCADE,
    ID_автомобиля INT REFERENCES Автомобили(ID_автомобиля) ON DELETE CASCADE
);