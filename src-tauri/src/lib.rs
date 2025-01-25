use tauri_plugin_sql::{Migration, MigrationKind};

// Learn more about Tauri commands at https://tauri.app/develop/calling-rust/
#[tauri::command]
fn greet(name: &str) -> String {
    format!("Hello, {}! You've been greeted from Rust!", name)
}

#[cfg_attr(mobile, tauri::mobile_entry_point)]
pub fn run() {
    let migrations = vec![
        // Define your migrations here
        Migration {
            version: 1,
            description: "init_schema",
            sql: include_str!("../../scripts/init_schema.sql"),
            kind: MigrationKind::Up,
        },
        Migration {
            version: 2,
            description: "seed_data",
            sql: include_str!("../../scripts/seed_data.sql"),
            kind: MigrationKind::Up,
        },
        Migration {
            version: 3,
            description: "add_workout_exercises_position",
            sql: include_str!("../../scripts/add_exercises_position.sql"),
            kind: MigrationKind::Up,
        },
        Migration {
            version: 4,
            description: "nullable_workout_history_workout_id",
            sql: include_str!("../../scripts/nullable_workout_history_workout_id.sql"),
            kind: MigrationKind::Up,
        },
        Migration {
            version: 5,
            description: "reset_data",
            sql: include_str!("../../scripts/reset_data.sql"),
            kind: MigrationKind::Up,
        },
        Migration {
            version: 6,
            description: "new_exercise_schema",
            sql: include_str!("../../scripts/init_workouts_db.sql"),
            kind: MigrationKind::Up,
        },
    ];

    tauri::Builder::default()
        .plugin(tauri_plugin_dialog::init())
        .plugin(tauri_plugin_haptics::init())
        .plugin(
            tauri_plugin_sql::Builder::new()
                .add_migrations("sqlite:earlybirdworkouts.db", migrations)
                .build(),
        )
        .plugin(tauri_plugin_opener::init())
        .invoke_handler(tauri::generate_handler![greet])
        .run(tauri::generate_context!())
        .expect("error while running tauri application");
}
