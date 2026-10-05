type Listener = () => void;

/**
 * Minimal external store for useSyncExternalStore.
 * The snapshot is replaced (never mutated) so React can compare by identity.
 */
class Store<T> {
  #listeners = new Set<Listener>();
  #snapshot: T;

  constructor(initial: T) {
    this.#snapshot = initial;
  }

  subscribe = (listener: Listener) => {
    this.#listeners.add(listener);
    return () => {
      this.#listeners.delete(listener);
    };
  };

  getSnapshot = () => this.#snapshot;

  protected setSnapshot(next: T) {
    this.#snapshot = next;
    this.#listeners.forEach((listener) => listener());
  }
}

export { Store };
