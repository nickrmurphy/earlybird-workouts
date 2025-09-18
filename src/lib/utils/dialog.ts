interface ConfirmOptions {
  title?: string;
  kind?: 'info' | 'warning' | 'error';
  okLabel?: string;
}

/**
 * Cross-platform confirm dialog that uses Tauri dialog in native apps
 * and native browser confirm in web browsers
 */
export async function confirm(message: string, options: ConfirmOptions = {}): Promise<boolean> {
  // Check if we're running in a Tauri environment
  if (typeof window !== 'undefined' && '__TAURI__' in window) {
    try {
      const { confirm: tauriConfirm } = await import('@tauri-apps/plugin-dialog');
      return await tauriConfirm(message, options);
    } catch (error) {
      console.warn('Failed to load Tauri dialog, falling back to browser confirm:', error);
      // Fall back to browser confirm if Tauri import fails
      return window.confirm(`${options.title ? `${options.title}\n\n` : ''}${message}`);
    }
  }

  // Use native browser confirm for web
  return window.confirm(`${options.title ? `${options.title}\n\n` : ''}${message}`);
}