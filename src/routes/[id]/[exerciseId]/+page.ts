import type { PageLoad } from "./$types";

export const load: PageLoad = ({ params }) => {
  return {
    workoutId: params.id,
    exerciseId: params.exerciseId,
  };
};
