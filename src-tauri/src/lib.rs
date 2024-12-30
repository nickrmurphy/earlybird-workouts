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
            description: "create_muscles",
            sql: include_str!("../../src/scripts/create_muscles.sql"),
            kind: MigrationKind::Up,
        },
        Migration {
            version: 2,
            description: "create_muscle_groups",
            sql: include_str!("../../src/scripts/create_muscle_groups.sql"),
            kind: MigrationKind::Up,
        },
        Migration {
            version: 3,
            description: "create_equipment",
            sql: include_str!("../../src/scripts/create_equipment.sql"),
            kind: MigrationKind::Up,
        },
        Migration {
            version: 4,
            description: "create_exercises",
            sql: include_str!("../../src/scripts/create_exercises.sql"),
            kind: MigrationKind::Up,
        },
    ];

    tauri::Builder::default()
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
