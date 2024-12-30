--
-- File generated with SQLiteStudio v3.4.4 on Mon Dec 30 09:56:33 2024
--
-- Text encoding used: UTF-8

-- Table: muscle_groups
CREATE TABLE IF NOT EXISTS muscle_groups (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT UNIQUE ON CONFLICT FAIL);
INSERT INTO muscle_groups (id, name) VALUES (1, 'Abdominals');
INSERT INTO muscle_groups (id, name) VALUES (2, 'Glutes');
INSERT INTO muscle_groups (id, name) VALUES (3, 'Chest');
INSERT INTO muscle_groups (id, name) VALUES (4, 'Shoulders');
INSERT INTO muscle_groups (id, name) VALUES (5, 'Back');
INSERT INTO muscle_groups (id, name) VALUES (6, 'Adductors');
INSERT INTO muscle_groups (id, name) VALUES (7, 'Biceps');
INSERT INTO muscle_groups (id, name) VALUES (8, 'Quadriceps');
INSERT INTO muscle_groups (id, name) VALUES (9, 'Hamstrings');
INSERT INTO muscle_groups (id, name) VALUES (10, 'Abductors');
INSERT INTO muscle_groups (id, name) VALUES (11, 'Trapezius');
INSERT INTO muscle_groups (id, name) VALUES (12, 'Triceps');
INSERT INTO muscle_groups (id, name) VALUES (13, 'Forearms');
INSERT INTO muscle_groups (id, name) VALUES (14, 'Calves');
INSERT INTO muscle_groups (id, name) VALUES (15, 'Shins');
INSERT INTO muscle_groups (id, name) VALUES (16, 'Hip Flexors');
INSERT INTO muscle_groups (id, name) VALUES (17, 'Trapezius ');
