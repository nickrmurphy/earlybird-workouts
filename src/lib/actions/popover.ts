import {
  computePosition,
  flip,
  offset,
  shift,
  type ComputePositionConfig,
} from "@floating-ui/dom";
import type { Action } from "svelte/action";

export const popover: Action<
  HTMLElement,
  {
    anchorElement: HTMLElement;
    placement?: ComputePositionConfig["placement"];
    onClickOutside?: () => void;
  }
> = (node, { anchorElement, placement = "bottom", onClickOutside }) => {
  const placeElement = (anchor: HTMLElement) =>
    computePosition(anchor, node, {
      placement,
      middleware: [flip(), shift({ padding: 8 }), offset(8)],
    }).then(({ x, y }) => {
      Object.assign(node.style, {
        left: `${x}px`,
        top: `${y}px`,
      });
    });

  const handleClick = (event: MouseEvent) => {
    if (
      node &&
      !node.contains(event.target as Node) &&
      !event.defaultPrevented
    ) {
      event.preventDefault();
      event.stopPropagation();
      onClickOutside?.();
    }
  };

  document.addEventListener("click", handleClick, true);

  placeElement(anchorElement);

  return {
    update: ({ anchorElement }) => {
      placeElement(anchorElement);
    },
    destroy() {
      document.removeEventListener("click", handleClick, true);
    },
  };
};
