// Vendored from the EB design system (https://claude.ai/artifact/B1VY2cEBafvGXCjk2Km1uH). Do not edit; re-sync from the artifact instead.
// Source: project/components/src/index.jsx
// EB design system: React components built on Base UI.
// Every component accepts className and style; styling lives in bundle.css (eb-* classes).
import * as React from 'react';
import { Button as BaseButton } from '@base-ui/react/button';
import { Dialog as BaseDialog } from '@base-ui/react/dialog';
import { Drawer as BaseDrawer } from '@base-ui/react/drawer';
import { Menu as BaseMenu } from '@base-ui/react/menu';
import { Input as BaseInput } from '@base-ui/react/input';
import { Field as BaseField } from '@base-ui/react/field';
import { Select as BaseSelect } from '@base-ui/react/select';
import { Combobox as BaseCombobox } from '@base-ui/react/combobox';
import { Checkbox as BaseCheckbox } from '@base-ui/react/checkbox';
import { RadioGroup as BaseRadioGroup } from '@base-ui/react/radio-group';
import { Radio as BaseRadio } from '@base-ui/react/radio';
import { Switch as BaseSwitch } from '@base-ui/react/switch';
import { Toggle as BaseToggle } from '@base-ui/react/toggle';

const cx = (...parts) => parts.filter(Boolean).join(' ');

// Internal glyphs (1.5px strokes, currentColor)
const svgProps = { width: 16, height: 16, viewBox: '0 0 16 16', fill: 'none', stroke: 'currentColor', strokeWidth: 1.5, strokeLinecap: 'round', strokeLinejoin: 'round', 'aria-hidden': true };
const CheckGlyph = () => <svg {...svgProps}><path d="m3 8.5 3.2 3.2L13 4.5" /></svg>;
const ChevronGlyph = () => <svg {...svgProps}><path d="m4 6 4 4 4-4" /></svg>;
const CloseGlyph = () => <svg {...svgProps}><path d="m4 4 8 8M12 4l-8 8" /></svg>;

/* ---------------- Typography ---------------- */

export const Display = React.forwardRef(function Display({ level = 1, as, className, ...rest }, ref) {
  const Tag = as || `h${level}`;
  return <Tag ref={ref} className={cx('eb-display', `eb-display--${level}`, className)} {...rest} />;
});
export const Heading = Display;

export const Title = React.forwardRef(function Title({ as: Tag = 'h3', className, ...rest }, ref) {
  return <Tag ref={ref} className={cx('eb-title', className)} {...rest} />;
});

/* ---------------- Button ---------------- */

export const Button = React.forwardRef(function Button(
  { variant = 'secondary', iconOnly = false, icon, iconPosition = 'start', className, children, ...rest },
  ref,
) {
  return (
    <BaseButton
      ref={ref}
      className={cx('eb-button', `eb-button--${variant}`, iconOnly && 'eb-button--icon-only', className)}
      {...rest}
    >
      {iconOnly ? (
        <span className="eb-button__icon">{icon || children}</span>
      ) : (
        <>
          {icon && iconPosition === 'start' && <span className="eb-button__icon">{icon}</span>}
          <span className="eb-button__label">{children}</span>
          {icon && iconPosition === 'end' && <span className="eb-button__icon">{icon}</span>}
        </>
      )}
    </BaseButton>
  );
});

/* ---------------- ToggleButton ---------------- */

export const ToggleButton = React.forwardRef(function ToggleButton({ tone = 'neutral', className, children, ...rest }, ref) {
  return (
    <BaseToggle ref={ref} className={cx('eb-toggle', `eb-toggle--${tone}`, className)} {...rest}>
      {children}
    </BaseToggle>
  );
});

/* ---------------- Card ---------------- */

const CardRoot = React.forwardRef(function Card({ as: Tag = 'article', raised = false, className, ...rest }, ref) {
  return <Tag ref={ref} className={cx('eb-card', raised && 'eb-card--raised', className)} {...rest} />;
});
const CardImage = React.forwardRef(function CardImage({ src, alt = '', ratio = '16 / 10', className, style, children, ...rest }, ref) {
  return (
    <div ref={ref} className={cx('eb-card__image', className)} style={{ aspectRatio: ratio, ...style }} {...rest}>
      {src ? <img src={src} alt={alt} /> : children}
    </div>
  );
});
const CardHeader = React.forwardRef(function CardHeader({ className, ...rest }, ref) {
  return <div ref={ref} className={cx('eb-card__header', className)} {...rest} />;
});
const CardTitle = React.forwardRef(function CardTitle({ as: Tag = 'h3', className, ...rest }, ref) {
  return <Tag ref={ref} className={cx('eb-card__title', className)} {...rest} />;
});
const CardContent = React.forwardRef(function CardContent({ className, ...rest }, ref) {
  return <div ref={ref} className={cx('eb-card__content', className)} {...rest} />;
});
export const Card = Object.assign(CardRoot, { Image: CardImage, Header: CardHeader, Title: CardTitle, Content: CardContent });
export { CardImage, CardHeader, CardTitle, CardContent };

/* ---------------- Dialog ---------------- */

function DialogRoot(props) {
  return <BaseDialog.Root {...props} />;
}
const DialogTrigger = React.forwardRef(function DialogTrigger({ variant = 'secondary', className, ...rest }, ref) {
  return <BaseDialog.Trigger ref={ref} className={cx('eb-button', `eb-button--${variant}`, className)} {...rest} />;
});
const DialogContent = React.forwardRef(function DialogContent({ className, style, children, showClose = true, container, ...rest }, ref) {
  return (
    <BaseDialog.Portal container={container}>
      <BaseDialog.Backdrop className="eb-scrim" />
      <BaseDialog.Popup ref={ref} className={cx('eb-dialog', className)} style={style} {...rest}>
        {showClose && (
          <BaseDialog.Close className="eb-overlay-close" aria-label="Close">
            <CloseGlyph />
          </BaseDialog.Close>
        )}
        {children}
      </BaseDialog.Popup>
    </BaseDialog.Portal>
  );
});
const DialogTitle = React.forwardRef(function DialogTitle({ className, ...rest }, ref) {
  return <BaseDialog.Title ref={ref} className={cx('eb-overlay-title', className)} {...rest} />;
});
const DialogDescription = React.forwardRef(function DialogDescription({ className, ...rest }, ref) {
  return <BaseDialog.Description ref={ref} className={cx('eb-overlay-description', className)} {...rest} />;
});
const DialogClose = React.forwardRef(function DialogClose({ variant = 'secondary', className, ...rest }, ref) {
  return <BaseDialog.Close ref={ref} className={cx('eb-button', `eb-button--${variant}`, className)} {...rest} />;
});
export const Dialog = Object.assign(DialogRoot, {
  Trigger: DialogTrigger, Content: DialogContent, Title: DialogTitle, Description: DialogDescription, Close: DialogClose,
});

/* ---------------- Drawer ---------------- */

const DrawerSideContext = React.createContext('right');
function DrawerRoot({ side = 'right', ...rest }) {
  const swipe = side === 'bottom' ? 'down' : side;
  return (
    <DrawerSideContext.Provider value={side}>
      <BaseDrawer.Root swipeDirection={swipe} {...rest} />
    </DrawerSideContext.Provider>
  );
}
const DrawerTrigger = React.forwardRef(function DrawerTrigger({ variant = 'secondary', className, ...rest }, ref) {
  return <BaseDrawer.Trigger ref={ref} className={cx('eb-button', `eb-button--${variant}`, className)} {...rest} />;
});
const DrawerContent = React.forwardRef(function DrawerContent({ className, style, children, showClose = true, container, ...rest }, ref) {
  const side = React.useContext(DrawerSideContext);
  return (
    <BaseDrawer.Portal container={container}>
      <BaseDrawer.Backdrop className="eb-scrim eb-scrim--drawer" />
      <BaseDrawer.Viewport className={cx('eb-drawer-viewport', `eb-drawer-viewport--${side}`)}>
        <BaseDrawer.Popup ref={ref} className={cx('eb-drawer', `eb-drawer--${side}`, className)} style={style} {...rest}>
          {showClose && (
            <BaseDrawer.Close className="eb-overlay-close" aria-label="Close">
              <CloseGlyph />
            </BaseDrawer.Close>
          )}
          <BaseDrawer.Content className="eb-drawer__content">{children}</BaseDrawer.Content>
        </BaseDrawer.Popup>
      </BaseDrawer.Viewport>
    </BaseDrawer.Portal>
  );
});
const DrawerTitle = React.forwardRef(function DrawerTitle({ className, ...rest }, ref) {
  return <BaseDrawer.Title ref={ref} className={cx('eb-overlay-title', className)} {...rest} />;
});
const DrawerDescription = React.forwardRef(function DrawerDescription({ className, ...rest }, ref) {
  return <BaseDrawer.Description ref={ref} className={cx('eb-overlay-description', className)} {...rest} />;
});
const DrawerClose = React.forwardRef(function DrawerClose({ variant = 'secondary', className, ...rest }, ref) {
  return <BaseDrawer.Close ref={ref} className={cx('eb-button', `eb-button--${variant}`, className)} {...rest} />;
});
export const Drawer = Object.assign(DrawerRoot, {
  Trigger: DrawerTrigger, Content: DrawerContent, Title: DrawerTitle, Description: DrawerDescription, Close: DrawerClose,
});

/* ---------------- Menu ---------------- */

function MenuRoot(props) {
  return <BaseMenu.Root {...props} />;
}
const MenuTrigger = React.forwardRef(function MenuTrigger({ variant = 'secondary', className, ...rest }, ref) {
  return <BaseMenu.Trigger ref={ref} className={cx('eb-button', `eb-button--${variant}`, className)} {...rest} />;
});
const MenuContent = React.forwardRef(function MenuContent({ className, style, side = 'bottom', align = 'start', sideOffset = 8, container, ...rest }, ref) {
  return (
    <BaseMenu.Portal container={container}>
      <BaseMenu.Positioner className="eb-positioner" side={side} align={align} sideOffset={sideOffset}>
        <BaseMenu.Popup ref={ref} className={cx('eb-popup', 'eb-menu', className)} style={style} {...rest} />
      </BaseMenu.Positioner>
    </BaseMenu.Portal>
  );
});
const MenuItem = React.forwardRef(function MenuItem({ className, icon, tone, children, ...rest }, ref) {
  return (
    <BaseMenu.Item ref={ref} className={cx('eb-option', tone === 'danger' && 'eb-option--danger', className)} {...rest}>
      {icon && <span className="eb-option__icon">{icon}</span>}
      <span>{children}</span>
    </BaseMenu.Item>
  );
});
const MenuLinkItem = React.forwardRef(function MenuLinkItem({ className, icon, children, ...rest }, ref) {
  return (
    <BaseMenu.LinkItem ref={ref} className={cx('eb-option', className)} {...rest}>
      {icon && <span className="eb-option__icon">{icon}</span>}
      <span>{children}</span>
    </BaseMenu.LinkItem>
  );
});
const MenuSeparator = React.forwardRef(function MenuSeparator({ className, ...rest }, ref) {
  return <BaseMenu.Separator ref={ref} className={cx('eb-separator', className)} {...rest} />;
});
export const Menu = Object.assign(MenuRoot, {
  Trigger: MenuTrigger, Content: MenuContent, Item: MenuItem, LinkItem: MenuLinkItem, Separator: MenuSeparator,
});

/* ---------------- Field (label / description / error) ---------------- */

const FieldRoot = React.forwardRef(function Field({ className, ...rest }, ref) {
  return <BaseField.Root ref={ref} className={cx('eb-field', className)} {...rest} />;
});
const FieldLabel = React.forwardRef(function FieldLabel({ className, ...rest }, ref) {
  return <BaseField.Label ref={ref} className={cx('eb-label', className)} {...rest} />;
});
const FieldDescription = React.forwardRef(function FieldDescription({ className, ...rest }, ref) {
  return <BaseField.Description ref={ref} className={cx('eb-field__description', className)} {...rest} />;
});
const FieldError = React.forwardRef(function FieldError({ className, ...rest }, ref) {
  return <BaseField.Error ref={ref} className={cx('eb-field__error', className)} {...rest} />;
});
export const Field = Object.assign(FieldRoot, { Label: FieldLabel, Description: FieldDescription, Error: FieldError });

/* ---------------- Input ---------------- */

const InputRoot = React.forwardRef(function Input({ className, ...rest }, ref) {
  return <BaseInput ref={ref} className={cx('eb-input', className)} {...rest} />;
});
const InputGroup = React.forwardRef(function InputGroup({ className, ...rest }, ref) {
  return <div ref={ref} className={cx('eb-input-group', className)} {...rest} />;
});
const InputIcon = React.forwardRef(function InputIcon({ className, ...rest }, ref) {
  return <span ref={ref} aria-hidden="true" className={cx('eb-input-group__icon', className)} {...rest} />;
});
const InputAction = React.forwardRef(function InputAction({ className, variant = 'ghost', ...rest }, ref) {
  return <BaseButton ref={ref} className={cx('eb-input-group__action', `eb-input-group__action--${variant}`, className)} {...rest} />;
});
export const Input = Object.assign(InputRoot, { Group: InputGroup, Icon: InputIcon, Action: InputAction });

export const Textarea = React.forwardRef(function Textarea({ className, rows = 4, ...rest }, ref) {
  return <BaseInput ref={ref} className={cx('eb-textarea', className)} render={<textarea rows={rows} />} {...rest} />;
});

/* ---------------- Select ---------------- */

export const Select = React.forwardRef(function Select(
  { items = [], label, placeholder = 'Select…', className, style, container, ...rest },
  ref,
) {
  return (
    <BaseSelect.Root items={items} {...rest}>
      <div className={cx('eb-field', className)} style={style}>
        {label && <BaseSelect.Label className="eb-label">{label}</BaseSelect.Label>}
        <BaseSelect.Trigger ref={ref} className="eb-select">
          <BaseSelect.Value className="eb-select__value" placeholder={placeholder} />
          <BaseSelect.Icon className="eb-select__icon"><ChevronGlyph /></BaseSelect.Icon>
        </BaseSelect.Trigger>
      </div>
      <BaseSelect.Portal container={container}>
        <BaseSelect.Positioner className="eb-positioner" sideOffset={8} alignItemWithTrigger={false}>
          <BaseSelect.Popup className="eb-popup eb-listbox">
            <BaseSelect.List>
              {items.map((item) => (
                <BaseSelect.Item key={String(item.value)} value={item.value} disabled={item.disabled} className="eb-option">
                  <BaseSelect.ItemText>{item.label}</BaseSelect.ItemText>
                  <BaseSelect.ItemIndicator className="eb-option__check"><CheckGlyph /></BaseSelect.ItemIndicator>
                </BaseSelect.Item>
              ))}
            </BaseSelect.List>
          </BaseSelect.Popup>
        </BaseSelect.Positioner>
      </BaseSelect.Portal>
    </BaseSelect.Root>
  );
});

/* ---------------- Combobox ---------------- */

export const Combobox = React.forwardRef(function Combobox(
  { items = [], label, placeholder = 'Search…', emptyText = 'No matches.', className, style, container, ...rest },
  ref,
) {
  const id = React.useId();
  return (
    <BaseCombobox.Root items={items} itemToStringLabel={(i) => (i && typeof i === 'object' ? i.label : String(i ?? ''))} {...rest}>
      <div className={cx('eb-field', className)} style={style}>
        {label && <label className="eb-label" htmlFor={id}>{label}</label>}
        <BaseCombobox.InputGroup className="eb-input-group">
          <BaseCombobox.Input ref={ref} id={id} placeholder={placeholder} className="eb-input" />
          <BaseCombobox.Trigger className="eb-input-group__action eb-input-group__action--ghost" aria-label="Show options">
            <ChevronGlyph />
          </BaseCombobox.Trigger>
        </BaseCombobox.InputGroup>
      </div>
      <BaseCombobox.Portal container={container}>
        <BaseCombobox.Positioner className="eb-positioner" sideOffset={8}>
          <BaseCombobox.Popup className="eb-popup eb-listbox">
            <BaseCombobox.Empty className="eb-listbox__empty">{emptyText}</BaseCombobox.Empty>
            <BaseCombobox.List>
              {(item) => (
                <BaseCombobox.Item key={String(item.value)} value={item} className="eb-option">
                  <span>{item.label}</span>
                  <BaseCombobox.ItemIndicator className="eb-option__check"><CheckGlyph /></BaseCombobox.ItemIndicator>
                </BaseCombobox.Item>
              )}
            </BaseCombobox.List>
          </BaseCombobox.Popup>
        </BaseCombobox.Positioner>
      </BaseCombobox.Portal>
    </BaseCombobox.Root>
  );
});

/* ---------------- Checkbox / Radio / Switch ---------------- */

export const Checkbox = React.forwardRef(function Checkbox({ label, className, style, ...rest }, ref) {
  return (
    <label className={cx('eb-choice', className)} style={style}>
      <BaseCheckbox.Root ref={ref} className="eb-checkbox" {...rest}>
        <BaseCheckbox.Indicator className="eb-checkbox__indicator"><CheckGlyph /></BaseCheckbox.Indicator>
      </BaseCheckbox.Root>
      {label && <span>{label}</span>}
    </label>
  );
});

export const RadioGroup = React.forwardRef(function RadioGroup({ className, ...rest }, ref) {
  return <BaseRadioGroup ref={ref} className={cx('eb-radio-group', className)} {...rest} />;
});

export const Radio = React.forwardRef(function Radio({ label, className, style, ...rest }, ref) {
  return (
    <label className={cx('eb-choice', className)} style={style}>
      <BaseRadio.Root ref={ref} className="eb-radio" {...rest}>
        <BaseRadio.Indicator className="eb-radio__indicator" />
      </BaseRadio.Root>
      {label && <span>{label}</span>}
    </label>
  );
});

export const Switch = React.forwardRef(function Switch({ label, className, style, ...rest }, ref) {
  return (
    <label className={cx('eb-choice', className)} style={style}>
      <BaseSwitch.Root ref={ref} className="eb-switch" {...rest}>
        <BaseSwitch.Thumb className="eb-switch__thumb" />
      </BaseSwitch.Root>
      {label && <span>{label}</span>}
    </label>
  );
});

/* ---------------- SegmentedControl ---------------- */

export const SegmentedControl = React.forwardRef(function SegmentedControl(
  { options = [], value, defaultValue, onValueChange, className, ...rest },
  ref,
) {
  const first = options[0] && options[0].value;
  return (
    <BaseRadioGroup
      ref={ref}
      className={cx('eb-segmented', className)}
      value={value}
      defaultValue={value === undefined ? (defaultValue ?? first) : undefined}
      onValueChange={onValueChange}
      {...rest}
    >
      {options.map((o) => (
        <BaseRadio.Root key={String(o.value)} value={o.value} disabled={o.disabled} className="eb-segmented__option" aria-label={o.ariaLabel}>
          {o.icon && <span className="eb-segmented__icon">{o.icon}</span>}
          {o.label != null && <span>{o.label}</span>}
        </BaseRadio.Root>
      ))}
    </BaseRadioGroup>
  );
});

/* ---------------- TabBar ---------------- */

const TabBarRoot = React.forwardRef(function TabBar({ action, label = 'Primary', className, children, ...rest }, ref) {
  return (
    <nav ref={ref} aria-label={label} className={cx('eb-tabbar', className)} {...rest}>
      <div className="eb-tabbar__items">{children}</div>
      {action && <div className="eb-tabbar__action">{action}</div>}
    </nav>
  );
});
const TabBarItem = React.forwardRef(function TabBarItem({ active = false, icon, href, className, children, ...rest }, ref) {
  const Tag = href ? 'a' : 'button';
  const extra = href ? { href } : { type: 'button' };
  return (
    <Tag
      ref={ref}
      className={cx('eb-tabbar__item', className)}
      aria-current={active ? 'page' : undefined}
      data-active={active ? '' : undefined}
      {...extra}
      {...rest}
    >
      {icon && <span className="eb-tabbar__icon">{icon}</span>}
      {children != null && <span>{children}</span>}
    </Tag>
  );
});
export const TabBar = Object.assign(TabBarRoot, { Item: TabBarItem });
