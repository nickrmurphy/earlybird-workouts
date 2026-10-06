/** A light tap on supporting devices; call from a user gesture. */
export function haptic() {
  if ("vibrate" in navigator) {
    navigator.vibrate(10);
    return;
  }

  // iOS Safari has no Vibration API, but toggling a native switch plays a tap (iOS 18+)
  const label = document.createElement("label");
  label.ariaHidden = "true";
  label.style.display = "none";
  const input = document.createElement("input");
  input.type = "checkbox";
  input.setAttribute("switch", "");
  label.append(input);
  document.head.append(label);
  label.click();
  label.remove();
}
