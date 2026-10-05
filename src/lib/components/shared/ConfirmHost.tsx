import { Button, Dialog } from "$lib/eb";
import { confirmStore } from "$lib/state";
import { useSyncExternalStore } from "react";

/** Renders requests from confirm(); mount once at the app root. */
export function ConfirmHost() {
  const { open, request } = useSyncExternalStore(confirmStore.subscribe, confirmStore.getSnapshot);

  return (
    <Dialog
      open={open}
      onOpenChange={(nextOpen) => {
        if (!nextOpen) confirmStore.answer(false);
      }}
    >
      <Dialog.Content showClose={false}>
        <Dialog.Title>{request?.title}</Dialog.Title>
        <Dialog.Description>{request?.message}</Dialog.Description>
        <div className="flex justify-end gap-3">
          <Dialog.Close>Cancel</Dialog.Close>
          <Button variant="primary" onClick={() => confirmStore.answer(true)}>
            {request?.okLabel ?? "OK"}
          </Button>
        </div>
      </Dialog.Content>
    </Dialog>
  );
}
