CREATE TABLE IF NOT EXISTS workout_history (
    id              PRIMARY KEY,
    workout_id      REFERENCES workouts (id),
    start_time REAL NOT NULL,
    end_time   REAL
);

CREATE TABLE IF NOT EXISTS workout_history_sets (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    exercise_id INTEGER REFERENCES exercises (id) NOT NULL, 
    workout_history_id INTEGER REFERENCES workout_history (id) NOT NULL, 
    reps INTEGER NOT NULL, 
    weight REAL, 
    is_complete INTEGER NOT NULL DEFAULT (0)
);
