/// <reference types="types/@girs/dbusmenugtk3-0.4/types/@girs/gtk-3.0/gtk-3.0-ambient" />
/// <reference types="types/@girs/gtk-3.0/gtk-3.0-ambient" />
/// <reference types="types/@girs/gio-2.0/gio-2.0-ambient" />
/// <reference types="types/@girs/gtk-3.0/types/@girs/gio-2.0/gio-2.0-ambient" />
/// <reference types="types/@girs/nm-1.0/types/@girs/gio-2.0/gio-2.0-ambient" />
import Gtk from 'gi://Gtk?version=3.0';
import Gio from 'gi://Gio';
type Args<Out = void, Err = void> = {
    cmd: string | string[];
    out?: (stdout: string) => Out;
    err?: (stderr: string) => Err;
};
export declare function subprocess(args: Args & {
    bind?: Gtk.Widget;
}): Gio.Subprocess;
export declare function subprocess(cmd: string | string[], out?: (stdout: string) => void, err?: (stderr: string) => void, bind?: Gtk.Widget): Gio.Subprocess;
export declare function exec<Out = string, Err = string>(args: Args<Out, Err>): Out | Err;
export declare function exec<Out = string, Err = string>(cmd: string | string[], out?: (stdout: string) => Out, err?: (stderr: string) => Err): Out | Err;
export declare function execAsync(cmd: string | string[]): Promise<string>;
export {};
