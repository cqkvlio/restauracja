CREATE DATABASE wedkowanie;

USE wedkowanie;

CREATE TABLE Ryby(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nazwa TEXT NOT NULL,
    wystepowanie TEXT NOT NULL,
    styl_zycia INTEGER NOT NULL
);

INSERT INTO ryby (nazwa, wystepowanie, styl_zycia) VALUES
('Szczupak', 'stawy, rzeki', 1),
('Karp', 'stawy, jeziora', 2),
('Sandacz', 'stawy, jeziora, rzeki', 1),
('Okon', 'rzeki', 1),
('Sum', 'jeziora, rzeki', 1),
('Dorsz', 'morza, oceany', 1),
('Leszcz', 'jeziora', 2),
('Lin', 'jeziora', 2);

CREATE TABLE Okres_ochronny(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    Ryby_id INTEGER NOT NULL,
    FOREIGN KEY (Ryby_id)
    REFERENCES Ryby(id),
    od_miesiaca INTEGER NOT NULL,
    do_miesiaca INTEGER NOT NULL,
    wymiar_ochronny INTEGER NOT NULL
);

INSERT INTO okres_ochronny (Ryby_id, od_miesiaca, do_miesiaca, wymiar_ochronny) VALUES
(1, 1, 4, 50),
(2, 0, 0, 30),
(3, 1, 5, 50),
(4, 0, 0, 15),
(5, 11, 6, 70),
(6, 0, 0, 0),
(7, 0, 0, 0),
(8, 0, 0, 25);

CREATE TABLE Lowisko(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    Ryby_id INTEGER NOT NULL,
    FOREIGN KEY (Ryby_id)
    REFERENCES Ryby(id),
    akwen TEXT NOT NULL,
    wojewodztwo TEXT NOT NULL,
    rodzaj INTEGER NOT NULL
);

INSERT INTO lowisko (Ryby_id, akwen, wojewodztwo, rodzaj) VALUES
(2, 'Dubaj', 'Mazowieckie', 4),
(3, 'Zalew Szczeciński', 'Dolnoslaskie', 2),
(2, 'Jeziorko Rozowe', 'Kaszuby', 2),
(1, 'Dunaj', 'Slaskie', 3),
(2, 'paris', 'Podkarpackie', 5),
(7, 'Nil', 'Zachodniopomorskie', 3);