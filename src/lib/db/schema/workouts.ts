interface Workout {
  id: string;
  name: string;
}

interface WorkoutExercise {
  id: string;
  workoutId: string;
  exerciseId: string;
  name: string;
  sets: number;
  weight: number;
  count: number;
  order: number;
}

interface History {
  id: string;
  workoutId: string;
  workoutName: string;
  startTime: Date;
  endTime?: Date;
}

interface HistoryExercise {
  id: string;
  historyId: string;
  exerciseId: string;
  exerciseName: string;
}

interface HistorySet {
  id: string;
  historyId: string;
  historyExerciseId: string;
  exerciseId: string;
  count: number;
  weight: number;
  isSuccess: boolean;
}

export type { History, HistoryExercise, HistorySet, Workout, WorkoutExercise };
