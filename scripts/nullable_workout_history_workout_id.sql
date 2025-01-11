CREATE TABLE sqlitestudio_temp_table AS SELECT *
                                          FROM workout_history;

DROP TABLE workout_history;

CREATE TABLE workout_history (
    id         INTEGER PRIMARY KEY AUTOINCREMENT,
    workout_id         REFERENCES workouts (id) ON DELETE SET NULL,
    start_time NUMERIC NOT NULL
                       DEFAULT (CURRENT_TIMESTAMP),
    end_time   NUMERIC
);

INSERT INTO workout_history (
                                id,
                                workout_id,
                                start_time,
                                end_time
                            )
                            SELECT id,
                                   workout_id,
                                   start_time,
                                   end_time
                              FROM sqlitestudio_temp_table;

DROP TABLE sqlitestudio_temp_table;
