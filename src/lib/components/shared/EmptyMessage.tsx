import { Card } from "$lib/eb";

type Props = {
  header?: string;
  message?: string;
};

export function EmptyMessage({ header, message }: Props) {
  return (
    <Card className="text-center">
      <Card.Header>
        <Card.Title>{header}</Card.Title>
      </Card.Header>
      <Card.Content>{message}</Card.Content>
    </Card>
  );
}
