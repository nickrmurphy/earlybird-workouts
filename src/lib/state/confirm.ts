import { Store } from "./Store";

type ConfirmOptions = {
  title: string;
  okLabel?: string;
};

type ConfirmRequest = ConfirmOptions & {
  message: string;
  resolve: (confirmed: boolean) => void;
};

type ConfirmSnapshot = {
  open: boolean;
  /** Kept after closing so the dialog can animate out with its content */
  request?: ConfirmRequest;
};

class ConfirmStore extends Store<ConfirmSnapshot> {
  constructor() {
    super({ open: false });
  }

  open(request: ConfirmRequest) {
    // A newer request cancels one still open
    this.getSnapshot().request?.resolve(false);
    this.setSnapshot({ open: true, request });
  }

  answer(confirmed: boolean) {
    const { open, request } = this.getSnapshot();
    if (!open) return;
    request?.resolve(confirmed);
    this.setSnapshot({ open: false, request });
  }
}

const confirmStore = new ConfirmStore();

/**
 * Asks the user to confirm in an in-app dialog (rendered by ConfirmHost).
 * Native confirm() is unavailable in Tauri's iOS webview.
 */
function confirm(message: string, options: ConfirmOptions): Promise<boolean> {
  return new Promise((resolve) =>
    confirmStore.open({ ...options, message, resolve }),
  );
}

export { confirm, confirmStore };
export type { ConfirmOptions };
