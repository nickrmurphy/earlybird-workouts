// Equipment type
export interface Equipment {
  id: string;
  key: string;
  name: string;
}

// Muscle type
export interface Muscle {
  id: string;
  key: string;
  name: string;
}

// Workout type
export interface Workout {
  id: string;
  name: string;
}

// Activity type
export interface Activity {
  id: string;
  startTime: string; // TEXT in SQLite, represents timestamp
  endTime: string | null;
  workoutId: string; // Foreign key to workout
  workoutName: string;
}

// Exercise type
export interface Exercise {
  id: string;
  key: string;
  name: string;
  equipmentId: string; // Foreign key to equipment
  instructions: string | null;
  force: string | null;
  level: string | null;
  mechanic: string | null;
  category: string | null;
}

// Weight and count unit types
export type WeightUnit = "lb" | "kg";
export type CountUnit = "rep" | "sec";

// ActivitySet type
export interface ActivitySet {
  id: string;
  workoutId: string;
  workoutName: string;
  exerciseId: string;
  exerciseName: string;
  weight: number;
  weightUnit: WeightUnit;
  count: number;
  countUnit: CountUnit;
  isComplete: 0 | 1; // SQLite boolean (0 = false, 1 = true)
  order: number;
  activityId: string; // Foreign key to activity
}

// ExerciseMuscle junction type
export interface ExerciseMuscle {
  id: string;
  exerciseId: string; // Foreign key to exercise
  muscleId: string; // Foreign key to muscle
  isPrimary: 0 | 1; // SQLite boolean (0 = false, 1 = true)
}

// WorkoutExercise type
export interface WorkoutExercise {
  id: string;
  workoutId: string; // Foreign key to workout
  exerciseId: string; // Foreign key to exercise
  sets: number;
  count: number;
  weight: number;
  weightUnit: WeightUnit;
  countUnit: CountUnit;
  order: number;
}

// Database schema type
export interface Database {
  equipment: Equipment;
  muscle: Muscle;
  workout: Workout;
  activity: Activity;
  exercise: Exercise;
  activitySet: ActivitySet;
  exerciseMuscle: ExerciseMuscle;
  workoutExercise: WorkoutExercise;
}
