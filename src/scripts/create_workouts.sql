CREATE TABLE workouts (
    id   INTEGER PRIMARY KEY,
    name TEXT    NOT NULL
);

CREATE TABLE workout_exercises (
    id                  PRIMARY KEY,
    workout_id  INTEGER REFERENCES workouts (id) ON DELETE CASCADE
                        NOT NULL,
    exercise_id INTEGER REFERENCES exercises (id) ON DELETE RESTRICT,
    sets        INTEGER NOT NULL,
    reps        INTEGER,
    weight      NUMERIC
);

