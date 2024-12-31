import { invalidateAll } from "$app/navigation";

export async function mutation<T>(action: Promise<T>) {
  const result = await action;
  await invalidateAll();
  return result;
}
