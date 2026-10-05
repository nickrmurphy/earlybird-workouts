import { Button, Dialog, Input } from "$lib/eb";
import { useRef, useState, type FormEvent } from "react";

type Props = {
  open: boolean;
  onOpenChange: (open: boolean) => void;
  title: string;
  submitText: string;
  onSubmit: (value: string) => void;
  defaultValue?: string;
  placeholder?: string;
};

export function InputDialog({ open, onOpenChange, title, ...props }: Props) {
  const inputRef = useRef<HTMLInputElement>(null);

  return (
    <Dialog open={open} onOpenChange={onOpenChange}>
      <Dialog.Content initialFocus={inputRef}>
        <Dialog.Title>{title}</Dialog.Title>
        {/* Mounted only while open, so each open starts from defaultValue */}
        <InputDialogForm
          {...props}
          inputRef={inputRef}
          label={title}
          onDone={() => onOpenChange(false)}
        />
      </Dialog.Content>
    </Dialog>
  );
}

function InputDialogForm({
  submitText,
  onSubmit,
  defaultValue,
  placeholder,
  label,
  inputRef,
  onDone,
}: Omit<Props, "open" | "onOpenChange" | "title"> & {
  label: string;
  inputRef: React.RefObject<HTMLInputElement | null>;
  onDone: () => void;
}) {
  const [value, setValue] = useState(defaultValue ?? "");

  function handleSubmit(event: FormEvent) {
    event.preventDefault();
    onSubmit(value);
    onDone();
  }

  return (
    <form className="mt-4 flex flex-col gap-6" onSubmit={handleSubmit}>
      <Input
        ref={inputRef}
        aria-label={label}
        value={value}
        onChange={(event) => setValue(event.currentTarget.value)}
        placeholder={placeholder}
        minLength={1}
        enterKeyHint="done"
      />
      <div className="flex justify-end gap-3">
        <Dialog.Close>Cancel</Dialog.Close>
        <Button type="submit" variant="primary">
          {submitText}
        </Button>
      </div>
    </form>
  );
}
