/// <reference types="types/@girs/dbusmenugtk3-0.4/types/@girs/gtk-3.0/gtk-3.0-ambient.js" />
/// <reference types="types/@girs/gtk-3.0/gtk-3.0-ambient.js" />
import { type BaseProps, type Widget } from './widget.js';
import Gtk from 'gi://Gtk?version=3.0';
export type FixedProps<Attr = unknown, Self = Fixed<Attr>> = BaseProps<Self, Gtk.Fixed.ConstructorProperties, Attr>;
export declare function newFixed<Attr = unknown>(...props: ConstructorParameters<typeof Fixed<Attr>>): Fixed<Attr>;
export interface Fixed<Attr> extends Widget<Attr> {
}
export declare class Fixed<Attr> extends Gtk.Fixed {
    constructor(props?: FixedProps<Attr>);
}
export default Fixed;
