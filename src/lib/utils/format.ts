const dateFormatter = new Intl.DateTimeFormat("en-US", {
  dateStyle: "long",
});

function dateDifferenceInMinutes(date1: Date, date2: Date) {
  const diffMs = date2.getTime() - date1.getTime();
  const diffMins = Math.round(diffMs / (1000 * 60));
  return diffMins;
}

export { dateDifferenceInMinutes, dateFormatter };
