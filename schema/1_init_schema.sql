--
-- File generated with SQLiteStudio v3.4.4 on Mon Mar 10 21:26:21 2025
--
-- Text encoding used: UTF-8
--


-- Table: equipment
CREATE TABLE IF NOT EXISTS equipment (
    id   TEXT NOT NULL,
    key  TEXT NOT NULL,
    name TEXT NOT NULL,
    PRIMARY KEY (
        id
    )
);


-- Table: muscle
CREATE TABLE IF NOT EXISTS muscle (
    id   TEXT NOT NULL,
    key  TEXT NOT NULL,
    name TEXT NOT NULL,
    PRIMARY KEY (
        id
    )
);


-- Table: activity
CREATE TABLE IF NOT EXISTS activity (
    id          TEXT NOT NULL,
    startTime   TEXT DEFAULT CURRENT_TIMESTAMP
                     NOT NULL,
    endTime     TEXT DEFAULT NULL,
    workoutId   TEXT NOT NULL
                     REFERENCES workout (id) ON DELETE CASCADE,
    workoutName TEXT NOT NULL,
    PRIMARY KEY (
        id
    )
);


-- Table: activitySet
CREATE TABLE IF NOT EXISTS activitySet (
    id           TEXT    NOT NULL,
    workoutId    TEXT    NOT NULL,
    workoutName  TEXT    NOT NULL,
    exerciseId   TEXT    NOT NULL,
    exerciseName TEXT    NOT NULL,
    weight       NUMERIC NOT NULL
                         CHECK (weight >= 0),
    weightUnit   TEXT    NOT NULL
                         CHECK (weightUnit = 'lb' OR 
                                weightUnit = 'kg'),
    count        INTEGER NOT NULL
                         CHECK (count >= 0),
    countUnit    TEXT    NOT NULL
                         DEFAULT rep
                         CHECK (countUnit = 'rep' OR 
                                countUnit = 'sec'),
    isComplete   INTEGER NOT NULL
                         DEFAULT '0'
                         CHECK (isComplete = 0 OR 
                                isComplete = 1),
    [order]      INTEGER NOT NULL
                         CHECK ("order" >= 0),
    activityId   TEXT    NOT NULL
                         REFERENCES activity (id),
    PRIMARY KEY (
        id
    )
);


-- Table: exercise
CREATE TABLE IF NOT EXISTS exercise (
    id           TEXT NOT NULL,
    key          TEXT NOT NULL,
    name         TEXT NOT NULL,
    equipmentId  TEXT REFERENCES equipment (id) ON DELETE SET NULL
                      NOT NULL,
    instructions TEXT,
    force        TEXT,
    level        TEXT,
    mechanic     TEXT,
    category     TEXT,
    PRIMARY KEY (
        id
    )
);


-- Table: exerciseMuscle
CREATE TABLE IF NOT EXISTS exerciseMuscle (
    id         TEXT    NOT NULL,
    exerciseId TEXT    NOT NULL
                       REFERENCES exercise (id),
    muscleId   TEXT    NOT NULL
                       REFERENCES muscle (id),
    isPrimary  INTEGER NOT NULL
                       CHECK (isPrimary = 0 OR 
                              isPrimary = 1),
    PRIMARY KEY (
        id
    )
);


-- Table: workout
CREATE TABLE IF NOT EXISTS workout (
    id   TEXT NOT NULL,
    name TEXT NOT NULL,
    PRIMARY KEY (
        id
    )
);


-- Table: workoutExercise
CREATE TABLE IF NOT EXISTS workoutExercise (
    id         TEXT    NOT NULL,
    workoutId  TEXT    NOT NULL
                       REFERENCES workout (id) ON DELETE CASCADE,
    exerciseId TEXT    NOT NULL
                       REFERENCES exercise (id),
    sets       INTEGER NOT NULL
                       CHECK (sets >= 0),
    count      INTEGER NOT NULL
                       CHECK (count >= 0),
    weight     NUMERIC NOT NULL
                       CHECK (weight >= 0),
    weightUnit TEXT    NOT NULL
                       CHECK (weightUnit = 'lb' OR 
                              weightUnit = 'kg'),
    countUnit  TEXT    NOT NULL
                       DEFAULT rep
                       CHECK (countUnit = 'rep' OR 
                              countUnit = 'sec'),
    [order]    INTEGER NOT NULL
                       CHECK ("order" >= 0),
    PRIMARY KEY (
        id
    )
);
