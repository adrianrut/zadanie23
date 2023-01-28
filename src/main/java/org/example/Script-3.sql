-- 1. Tworzy tabelę pracownik(imie, nazwisko, wyplata, data urodzenia, stanowisko). W tabeli mogą być dodatkowe kolumny, które uznasz za niezbędne.


CREATE TABLE employee (
id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
salary DECIMAL(8,2) NOT NULL,
date_of_birth DATE NOT NULL,
job_position VARCHAR(50) NOT NULL
);

-- 2. Wstawia do tabeli co najmniej 6 pracowników

INSERT INTO employee (first_name, last_name, salary, date_of_birth, job_position)
VALUES ('Jarosław', 'Płucisz', 15000.43, '1961-10-13', 'Księgowy'),
('Andrzej', 'Krzywy', 5000.11, '1975-04-15', 'Cieśla'),
('Wilhem', 'Rutkowski', 20000.11, '1975-04-15', 'Szef'),
('Janusz', 'Bąk', 4500.13, '1960-03-24', 'Ochroniarz'),
('Stefan', 'Stefankiewicz', 4000.28, '1996-07-13', 'Ochroniarz'),
('Bożena', 'Karpińska', 6231.58, '1960-10-25', 'Sprzątaczka'),
('Michał', 'Kwiatkowski', 4100.28, '1996-07-13', 'Kasjer');

-- 3. Pobiera wszystkich pracowników i wyświetla ich w kolejności alfabetycznej po nazwisku

SELECT * FROM employee e ORDER BY last_name, first_name;  

-- 4. Pobiera pracowników na wybranym stanowisku

SELECT * FROM employee e WHERE job_position = 'Ochroniarz';

-- 5. Pobiera pracowników, którzy mają co najmniej 30 lat

SELECT * FROM employee e WHERE date_of_birth <= '1993-01-28';

-- 6. Zwiększa wypłatę pracowników na wybranym stanowisku o 10%

UPDATE employee SET salary = salary + salary * 0.10 WHERE job_position = 'Ochroniarz'; 

-- 7. Pobiera najmłodszego pracowników (uwzględnij przypadek, że może być kilku urodzonych tego samego dnia)
-- tutaj poległem

SELECT * FROM employee e  WHERE date_of_birth = (SELECT MAX(date_of_birth) FROM e ;

-- 8. Usuwa tabelę pracownik

DROP TABLE employee; 

-- 9.Tworzy tabelę stanowisko (nazwa stanowiska, opis, wypłata na danym stanowisku)

CREATE TABLE job_position (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(30) NOT NULL,
description VARCHAR(100) NOT NULL,
salary DECIMAL(10,2) NOT NULL
);

-- 10. Tworzy tabelę adres (ulica+numer domu/mieszkania, kod pocztowy, miejscowość)

CREATE TABLE address (
id INT AUTO_INCREMENT PRIMARY KEY,
street_and_number VARCHAR(50) NOT NULL,
postcode VARCHAR(6) NOT NULL,
city VARCHAR(30) NOT NULL
);

-- 11. Tworzy tabelę pracownik (imię, nazwisko) + relacje do tabeli stanowisko i adres

CREATE TABLE employee (
id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(30),
last_name VARCHAR(30),
job_position_id INT NOT NULL,
address_id INT NOT NULL,
FOREIGN KEY (job_position_id) REFERENCES job_position (id),
FOREIGN KEY (address_id) REFERENCES address (id)
);

-- 12. Dodaje dane testowe (w taki sposób, aby powstały pomiędzy nimi sensowne powiązania)

INSERT INTO job_position (name, description, salary)
VALUES ('Kierownik', 'Rządzi w firmie', 10000.00),
('Magazynier', 'Dbanie o efektywne działanie magazynu', 6000.00),
('Konserwator', 'Konserwacja maszyn', 7000.00);

INSERT INTO address (street_and_number, postcode, city)
VALUES ('Warszawska 45', '04-683', 'Warszawa'),
('Łodzka 95', '04-683', 'Warszawa'),
('Śląska', '03-435', 'Warszawa'),
('Kielecka 30', '25-400', 'Kielce');

INSERT INTO employee (first_name, last_name, job_position_id, address_id)
VALUES ('Jan', 'Kowalski', 1, 1),
('Andrzej', 'Krzywy', 2, 2),
('Jacek', 'Nowak', 3, 3),
('Michał', 'Wolski', 3, 4);

-- 13. Pobiera pełne informacje o pracowniku (imię, nazwisko, adres, stanowisko)
-- nie wiem dlaczego nie dodaje mi ostatniego pracownika

SELECT * FROM employee e JOIN job_position j ON e.id = j.id JOIN address a ON e.id = a.id ;

-- 14. Oblicza sumę wypłat dla wszystkich pracowników w firmie

-- 15. Pobiera pracowników mieszkających w lokalizacji z kodem pocztowym 90210 (albo innym, który będzie miał sens dla Twoich danych testowych)














