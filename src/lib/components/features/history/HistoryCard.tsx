import { Card } from "$lib/eb";
import { dateDifferenceInMinutes, dateFormatter } from "$lib/utils";
import { BarbellIcon, ClockIcon } from "@phosphor-icons/react";

type Props = {
  startTime: Date;
  endTime?: Date;
  workoutName?: string;
  tonnage: number;
};

export function HistoryCard({ startTime, endTime, workoutName, tonnage }: Props) {
  return (
    <Card>
      <Card.Header>
        {workoutName && <span className="text-muted-foreground">{workoutName}</span>}
        <Card.Title>
          <time dateTime={new Date(startTime).toISOString()}>
            {dateFormatter.format(new Date(startTime))}
          </time>
        </Card.Title>
      </Card.Header>
      <Card.Content className="flex items-center justify-between">
        <Stat icon={<BarbellIcon size={16} />}>{Math.round(tonnage).toLocaleString()} lbs</Stat>
        {endTime && (
          <Stat icon={<ClockIcon size={16} />}>
            {dateDifferenceInMinutes(startTime, endTime)} min
          </Stat>
        )}
      </Card.Content>
    </Card>
  );
}

function Stat({ icon, children }: { icon: React.ReactNode; children: React.ReactNode }) {
  return (
    <span className="flex items-center gap-2">
      {icon}
      <span className="text-foreground font-semibold">{children}</span>
    </span>
  );
}
