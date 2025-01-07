-- Create with defaults

CREATE TABLE sqlitestudio_temp_table AS SELECT *
                                          FROM workout_exercises;

DROP TABLE workout_exercises;

CREATE TABLE workout_exercises (
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    workout_id  INTEGER REFERENCES workouts (id) ON DELETE CASCADE
                        NOT NULL,
    exercise_id INTEGER REFERENCES exercises (id) ON DELETE RESTRICT,
    sets        INTEGER NOT NULL,
    reps        INTEGER,
    weight      REAL,
    position    REAL    NOT NULL
                        DEFAULT (0) 
);

INSERT INTO workout_exercises (
                                  id,
                                  workout_id,
                                  exercise_id,
                                  sets,
                                  reps,
                                  weight
                              )
                              SELECT id,
                                     workout_id,
                                     exercise_id,
                                     sets,
                                     reps,
                                     weight
                                FROM sqlitestudio_temp_table;

DROP TABLE sqlitestudio_temp_table;

-- Create trigger to update position

CREATE TRIGGER workout_exercises_inserted
         AFTER INSERT
            ON workout_exercises
BEGIN
    UPDATE workout_exercises
       SET position = (
               SELECT COUNT( * ) 
                FROM workout_exercises we
                WHERE we.workout_id = NEW.workout_id
                GROUP BY we.workout_id
           )
     WHERE id = NEW.id;
END;

CREATE TRIGGER workout_exercises_deleted
         AFTER DELETE
            ON workout_exercises
BEGIN
    UPDATE workout_exercises
       SET position = (position - 1) 
     WHERE position > OLD.position;
END;
