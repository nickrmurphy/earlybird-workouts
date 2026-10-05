// Vendored from the EB design system (https://claude.ai/artifact/B1VY2cEBafvGXCjk2Km1uH). Do not edit; re-sync from the artifact instead.
// Source: project/components/index.d.ts
// Local patch (upstream to EB): forwardRef components include React.RefAttributes,
// and RefObject props accept React 19's RefObject<T | null>.
// EB design system — window.EB. React components built on Base UI (@base-ui/react 1.8).
// Every component accepts className and style.
import type * as React from 'react';

type Base = { className?: string; style?: React.CSSProperties };

export interface DisplayProps extends Base, React.HTMLAttributes<HTMLHeadingElement> {
  /** 1 = 4.5rem hero, 2 = 3rem section head, 3 = 2rem small head. Default 1. */
  level?: 1 | 2 | 3;
  /** Element to render. Default h1/h2/h3 matching level. */
  as?: React.ElementType;
}
export declare const Display: React.ForwardRefExoticComponent<DisplayProps & React.RefAttributes<HTMLElement>>;
/** Alias of Display. */
export declare const Heading: typeof Display;

export interface TitleProps extends Base, React.HTMLAttributes<HTMLElement> {
  /** Default h3. */
  as?: React.ElementType;
}
export declare const Title: React.ForwardRefExoticComponent<TitleProps & React.RefAttributes<HTMLElement>>;

export interface ButtonProps extends Base, React.ButtonHTMLAttributes<HTMLButtonElement> {
  /** Default 'secondary' (outlined). */
  variant?: 'secondary' | 'primary' | 'ghost';
  /** 16px icon slot. */
  icon?: React.ReactNode;
  /** Default 'start'. */
  iconPosition?: 'start' | 'end';
  /** 40px circle showing only the icon; needs aria-label. */
  iconOnly?: boolean;
  /** Base UI render prop, e.g. render={<a href="#" />} with nativeButton={false}. */
  render?: React.ReactElement | ((props: object) => React.ReactElement);
  nativeButton?: boolean;
}
export declare const Button: React.ForwardRefExoticComponent<ButtonProps & React.RefAttributes<HTMLElement>>;

export interface ToggleButtonProps extends Base {
  /** Fill when pressed. Default 'neutral'. */
  tone?: 'neutral' | 'primary' | 'accent';
  pressed?: boolean;
  defaultPressed?: boolean;
  onPressedChange?: (pressed: boolean) => void;
  disabled?: boolean;
  'aria-label': string;
  /** The icon (18px SVG, currentColor). */
  children: React.ReactNode;
}
export declare const ToggleButton: React.ForwardRefExoticComponent<ToggleButtonProps & React.RefAttributes<HTMLElement>>;

export interface CardProps extends Base, React.HTMLAttributes<HTMLElement> {
  /** Default 'article'. */
  as?: React.ElementType;
  /** Muted fill + raised shadow. */
  raised?: boolean;
}
export interface CardImageProps extends Base {
  src?: string;
  alt?: string;
  /** CSS aspect-ratio. Default '16 / 10'. */
  ratio?: string;
  children?: React.ReactNode;
}
export interface CardTitleProps extends Base, React.HTMLAttributes<HTMLElement> {
  /** Default h3. */
  as?: React.ElementType;
}
export declare const Card: React.ForwardRefExoticComponent<CardProps & React.RefAttributes<HTMLElement>> & {
  Image: React.ForwardRefExoticComponent<CardImageProps & React.RefAttributes<HTMLElement>>;
  Header: React.ForwardRefExoticComponent<Base & React.HTMLAttributes<HTMLDivElement> & React.RefAttributes<HTMLElement>>;
  Title: React.ForwardRefExoticComponent<CardTitleProps & React.RefAttributes<HTMLElement>>;
  Content: React.ForwardRefExoticComponent<Base & React.HTMLAttributes<HTMLDivElement> & React.RefAttributes<HTMLElement>>;
};

export interface OverlayRootProps {
  open?: boolean;
  defaultOpen?: boolean;
  onOpenChange?: (open: boolean) => void;
  modal?: boolean;
  children?: React.ReactNode;
}
export interface OverlayButtonProps extends Base, React.ButtonHTMLAttributes<HTMLButtonElement> {
  /** Default 'secondary'. */
  variant?: 'secondary' | 'primary' | 'ghost';
  render?: React.ReactElement;
}
export interface OverlayContentProps extends Base {
  /** Show the round × close button. Default true. */
  showClose?: boolean;
  initialFocus?: boolean | React.RefObject<HTMLElement | null>;
  finalFocus?: boolean | React.RefObject<HTMLElement | null>;
  container?: HTMLElement | React.RefObject<HTMLElement | null>;
  children?: React.ReactNode;
}
type OverlayParts = {
  Trigger: React.ForwardRefExoticComponent<OverlayButtonProps & React.RefAttributes<HTMLElement>>;
  Content: React.ForwardRefExoticComponent<OverlayContentProps & React.RefAttributes<HTMLElement>>;
  Title: React.ForwardRefExoticComponent<Base & React.HTMLAttributes<HTMLHeadingElement> & React.RefAttributes<HTMLElement>>;
  Description: React.ForwardRefExoticComponent<Base & React.HTMLAttributes<HTMLParagraphElement> & React.RefAttributes<HTMLElement>>;
  Close: React.ForwardRefExoticComponent<OverlayButtonProps & React.RefAttributes<HTMLElement>>;
};
export type DialogProps = OverlayRootProps;
export declare const Dialog: React.FC<DialogProps> & OverlayParts;

export interface DrawerProps extends OverlayRootProps {
  /** Edge it slides from. Default 'right'. */
  side?: 'right' | 'left' | 'bottom';
}
export declare const Drawer: React.FC<DrawerProps> & OverlayParts;

export type MenuProps = OverlayRootProps;
export interface MenuContentProps extends Base {
  side?: 'top' | 'bottom' | 'left' | 'right';
  align?: 'start' | 'center' | 'end';
  /** Default 8. */
  sideOffset?: number;
  children?: React.ReactNode;
}
export interface MenuItemProps extends Base {
  icon?: React.ReactNode;
  tone?: 'danger';
  disabled?: boolean;
  onClick?: (event: React.MouseEvent) => void;
  closeOnClick?: boolean;
  children?: React.ReactNode;
}
export declare const Menu: React.FC<MenuProps> & {
  Trigger: React.ForwardRefExoticComponent<OverlayButtonProps & React.RefAttributes<HTMLElement>>;
  Content: React.ForwardRefExoticComponent<MenuContentProps & React.RefAttributes<HTMLElement>>;
  Item: React.ForwardRefExoticComponent<MenuItemProps & React.RefAttributes<HTMLElement>>;
  LinkItem: React.ForwardRefExoticComponent<Base & { href: string; icon?: React.ReactNode; children?: React.ReactNode } & React.RefAttributes<HTMLElement>>;
  Separator: React.ForwardRefExoticComponent<Base & React.RefAttributes<HTMLElement>>;
};

export interface FieldProps extends Base {
  name?: string;
  invalid?: boolean;
  disabled?: boolean;
  validate?: (value: unknown) => string | string[] | null;
  children?: React.ReactNode;
}
export declare const Field: React.ForwardRefExoticComponent<FieldProps & React.RefAttributes<HTMLElement>> & {
  Label: React.ForwardRefExoticComponent<Base & { children?: React.ReactNode } & React.RefAttributes<HTMLElement>>;
  Description: React.ForwardRefExoticComponent<Base & { children?: React.ReactNode } & React.RefAttributes<HTMLElement>>;
  Error: React.ForwardRefExoticComponent<Base & { match?: boolean | string; children?: React.ReactNode } & React.RefAttributes<HTMLElement>>;
};

export interface InputProps extends Base, Omit<React.InputHTMLAttributes<HTMLInputElement>, 'className' | 'style'> {}
export interface InputActionProps extends Base, React.ButtonHTMLAttributes<HTMLButtonElement> {
  /** Default 'ghost'. */
  variant?: 'ghost' | 'primary';
}
export declare const Input: React.ForwardRefExoticComponent<InputProps & React.RefAttributes<HTMLElement>> & {
  Group: React.ForwardRefExoticComponent<Base & { children?: React.ReactNode } & React.RefAttributes<HTMLElement>>;
  /** Decorative leading 16px icon. */
  Icon: React.ForwardRefExoticComponent<Base & { children?: React.ReactNode } & React.RefAttributes<HTMLElement>>;
  Action: React.ForwardRefExoticComponent<InputActionProps & React.RefAttributes<HTMLElement>>;
};
export interface TextareaProps extends Base, Omit<React.TextareaHTMLAttributes<HTMLTextAreaElement>, 'className' | 'style'> {
  /** Default 4. */
  rows?: number;
}
export declare const Textarea: React.ForwardRefExoticComponent<TextareaProps & React.RefAttributes<HTMLElement>>;

export interface Option<V = string> {
  label: string;
  value: V;
  disabled?: boolean;
}
export interface SelectProps<V = string> extends Base {
  items: Option<V>[];
  label?: React.ReactNode;
  /** Default 'Select…'. */
  placeholder?: string;
  value?: V | null;
  defaultValue?: V | null;
  onValueChange?: (value: V | null) => void;
  name?: string;
  disabled?: boolean;
  defaultOpen?: boolean;
  modal?: boolean;
}
export declare const Select: React.ForwardRefExoticComponent<SelectProps & React.RefAttributes<HTMLElement>>;

export interface ComboboxProps<V = string> extends Base {
  items: Option<V>[];
  label?: React.ReactNode;
  /** Default 'Search…'. */
  placeholder?: string;
  /** Shown when nothing matches. Default 'No matches.' */
  emptyText?: React.ReactNode;
  value?: Option<V> | null;
  defaultValue?: Option<V> | null;
  onValueChange?: (item: Option<V> | null) => void;
  name?: string;
  disabled?: boolean;
  defaultOpen?: boolean;
}
export declare const Combobox: React.ForwardRefExoticComponent<ComboboxProps & React.RefAttributes<HTMLElement>>;

export interface CheckboxProps extends Base {
  label?: React.ReactNode;
  checked?: boolean;
  defaultChecked?: boolean;
  onCheckedChange?: (checked: boolean) => void;
  indeterminate?: boolean;
  name?: string;
  value?: string;
  disabled?: boolean;
}
export declare const Checkbox: React.ForwardRefExoticComponent<CheckboxProps & React.RefAttributes<HTMLElement>>;

export interface RadioGroupProps extends Base {
  value?: string;
  defaultValue?: string;
  onValueChange?: (value: string) => void;
  name?: string;
  disabled?: boolean;
  'aria-label'?: string;
  'aria-labelledby'?: string;
  children?: React.ReactNode;
}
export declare const RadioGroup: React.ForwardRefExoticComponent<RadioGroupProps & React.RefAttributes<HTMLElement>>;
export interface RadioProps extends Base {
  value: string;
  label?: React.ReactNode;
  disabled?: boolean;
}
export declare const Radio: React.ForwardRefExoticComponent<RadioProps & React.RefAttributes<HTMLElement>>;

export interface SwitchProps extends Base {
  label?: React.ReactNode;
  checked?: boolean;
  defaultChecked?: boolean;
  onCheckedChange?: (checked: boolean) => void;
  name?: string;
  disabled?: boolean;
}
export declare const Switch: React.ForwardRefExoticComponent<SwitchProps & React.RefAttributes<HTMLElement>>;

export interface SegmentedOption {
  value: string;
  label?: React.ReactNode;
  icon?: React.ReactNode;
  /** Required for icon-only options. */
  ariaLabel?: string;
  disabled?: boolean;
}
export interface SegmentedControlProps extends Base {
  options: SegmentedOption[];
  value?: string;
  /** Default: the first option. Exactly one option is always selected. */
  defaultValue?: string;
  onValueChange?: (value: string) => void;
  'aria-label'?: string;
}
export declare const SegmentedControl: React.ForwardRefExoticComponent<SegmentedControlProps & React.RefAttributes<HTMLElement>>;

export interface TabBarProps extends Base, React.HTMLAttributes<HTMLElement> {
  /** Floating action slot: a primary icon-only Button or a ToggleButton. */
  action?: React.ReactNode;
  /** nav aria-label. Default 'Primary'. */
  label?: string;
}
export interface TabBarItemProps extends Base {
  /** Renders a link; without it, a button. */
  href?: string;
  /** Current page: aria-current="page" and the primary fill. */
  active?: boolean;
  icon?: React.ReactNode;
  onClick?: (event: React.MouseEvent) => void;
  children?: React.ReactNode;
}
export declare const TabBar: React.ForwardRefExoticComponent<TabBarProps & React.RefAttributes<HTMLElement>> & {
  Item: React.ForwardRefExoticComponent<TabBarItemProps & React.RefAttributes<HTMLElement>>;
};
