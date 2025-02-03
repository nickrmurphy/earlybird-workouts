import { redirect } from "@sveltejs/kit";
import type { LayoutLoad } from "../$types";

export const prerender = false;

export const load: LayoutLoad = async ({ params }) => {
  if (!params.historyId || isNaN(parseInt(params.historyId))) {
    redirect(303, "/");
  }

  return { historyId: parseInt(params.historyId) };
};
