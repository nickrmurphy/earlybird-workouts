--
-- File generated with SQLiteStudio v3.4.4 on Tue Dec 31 16:02:15 2024
--
-- Text encoding used: UTF-8
--

-- Table: equipment
CREATE TABLE IF NOT EXISTS equipment (
    id   INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT    UNIQUE ON CONFLICT IGNORE
);


-- Table: exercises
CREATE TABLE IF NOT EXISTS exercises (
    id                             INTEGER PRIMARY KEY AUTOINCREMENT,
    name                           TEXT    NOT NULL,
    difficulty                     TEXT,
    muscle_group_id                INTEGER REFERENCES muscle_groups (id) 
                                           NOT NULL,
    primary_muscle_id              INTEGER REFERENCES muscles (id) 
                                           NOT NULL,
    secondary_muscle_id            INTEGER REFERENCES muscles (id),
    tertiary_muscle_id             INTEGER REFERENCES muscles (id),
    primary_equipment_id           INTEGER REFERENCES equipment (id),
    secondary_equipment_id         INTEGER REFERENCES equipment (id),
    primary_equipment_count        INTEGER,
    secondary_equipment_count      INTEGER,
    single_or_double_arm           TEXT,
    continuous_or_alternating_arms TEXT,
    continuous_or_alternating_legs TEXT,
    body_region                    TEXT,
    force_type                     TEXT,
    mechanics                      TEXT,
    classification                 TEXT
);


-- Table: muscle_groups
CREATE TABLE IF NOT EXISTS muscle_groups (
    id   INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT    UNIQUE ON CONFLICT FAIL
);


-- Table: muscles
CREATE TABLE IF NOT EXISTS muscles (
    id   INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT    UNIQUE ON CONFLICT IGNORE
);


-- Table: workout_exercises
CREATE TABLE IF NOT EXISTS workout_exercises (
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    workout_id  INTEGER REFERENCES workouts (id) ON DELETE CASCADE
                        NOT NULL,
    exercise_id INTEGER REFERENCES exercises (id) ON DELETE RESTRICT,
    sets        INTEGER NOT NULL,
    reps        INTEGER,
    weight      REAL
);


-- Table: workout_history
CREATE TABLE IF NOT EXISTS workout_history (
    id         INTEGER PRIMARY KEY AUTOINCREMENT,
    workout_id         REFERENCES workouts (id),
    start_time NUMERIC NOT NULL
                       DEFAULT (CURRENT_TIMESTAMP),
    end_time   NUMERIC
);


-- Table: workout_history_sets
CREATE TABLE IF NOT EXISTS workout_history_sets (
    id                 INTEGER PRIMARY KEY AUTOINCREMENT,
    exercise_id        INTEGER REFERENCES exercises (id) 
                               NOT NULL,
    workout_history_id INTEGER REFERENCES workout_history (id) 
                               NOT NULL,
    reps               INTEGER NOT NULL,
    weight             REAL,
    is_complete        NUMERIC NOT NULL
                               DEFAULT (0) 
);


-- Table: workouts
CREATE TABLE IF NOT EXISTS workouts (
    id   INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT    NOT NULL
);
