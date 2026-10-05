type Props = {
  instructions: string[];
};

export function InstructionsList({ instructions }: Props) {
  return (
    <ol className="flex flex-col gap-3 text-base leading-relaxed">
      {instructions.map((instruction, idx) => (
        <li key={idx} className="flex gap-3">
          <span className="text-accent font-semibold tabular-nums">{idx + 1}.</span>
          <span>{instruction}</span>
        </li>
      ))}
    </ol>
  );
}
