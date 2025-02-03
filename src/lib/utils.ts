import { invalidateAll } from "$app/navigation";

export async function mutation<T>(action: Promise<T>) {
  const result = await action;
  await invalidateAll();
  return result;
}

export const dateFormatter = new Intl.DateTimeFormat("en-US", {
  dateStyle: "long",
});

export function dateDifferenceInMinutes(date1: Date, date2: Date) {
  const diffMs = date2.getTime() - date1.getTime();
  const diffMins = Math.round(diffMs / (1000 * 60));
  return diffMins;
}

// eslint-disable-next-line @typescript-eslint/no-unsafe-function-type
export function debounce(callback: Function, wait = 300) {
  let timeout: ReturnType<typeof setTimeout>;

  return (...args: unknown[]) => {
    clearTimeout(timeout);
    timeout = setTimeout(() => callback(...args), wait);
  };
}

export function arraymove(
  arr: Array<unknown>,
  fromIndex: number,
  toIndex: number,
) {
  var element = arr[fromIndex];
  arr.splice(fromIndex, 1);
  arr.splice(toIndex, 0, element);
}
