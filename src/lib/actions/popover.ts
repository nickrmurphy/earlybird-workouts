import {
  computePosition,
  flip,
  offset,
  shift,
  type ComputePositionConfig,
} from "@floating-ui/dom";
import type { Action } from "svelte/action";

export const popover: Action<
  HTMLDivElement,
  { anchorElement: HTMLElement; placement?: ComputePositionConfig["placement"] }
> = (node, { anchorElement, placement = "bottom" }) => {
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

  placeElement(anchorElement);

  return {
    update: ({ anchorElement }) => {
      placeElement(anchorElement);
    },
  };
};
