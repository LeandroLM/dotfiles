# dotfiles

## bin/wayland-xclip-bridge

Bridges the Wayland clipboard to X11 so XWayland apps can read it.

Wayland-native apps (Firefox, etc.) write to the Wayland clipboard. XWayland apps like FreeRapid Downloader use Java's X11 clipboard API and never see those changes. This script polls the Wayland clipboard every 300ms and syncs new text content to the X11 `CLIPBOARD` selection via `xclip -loops 0`, which keeps xclip alive as a child process to serve unlimited reads.

**Dependencies:** `wl-paste` (wl-clipboard), `xclip`

**Setup:** add to Hyprland autostart:

```
exec-once = wayland-xclip-bridge
```

---

## freerapid/

Patched files and install script for [FreeRapid Downloader](http://wordrider.net/freerapid/) to work on JDK 26 + Wayland/Hyprland.

### Install

Everything is bundled — no download needed.

```bash
bash freerapid/install.sh
```

Then add the clipboard bridge to Hyprland autostart (if not already):

```
exec-once = wayland-xclip-bridge
```

Log out and back in (or run `wayland-xclip-bridge &` in a terminal).

### What the install script does

- Extracts FreeRapid to `~/.local/share/FreeRapid/`
- Replaces `frd.jar` with the patched version (see below)
- Disables `ICOReader-1.04.jar` (see below)
- Copies plugins to `~/.FRD/plugins/`
- Copies `wayland-xclip-bridge` to `~/.local/bin/`
- Creates a `.desktop` entry

### Patches

**frd.jar** — bytecode patch on `ClipboardMonitorManager` fixing a null comparison bug that prevented clipboard URL detection from triggering the Add Links dialog on Wayland.

**lib/ICOReader-1.04.jar.disabled** — renamed from `ICOReader-1.04.jar`. The `ICOReaderSpi` class is incompatible with JDK 26 and crashes `IIORegistry` on startup, which cascades into the plugin system failing to initialise.

### Plugins

- **fileboom.frp** — handles `fboom.me` and `fileboom.me`
- **filejoker.frp** — handles `filejoker.net`

Downloaded from the wordrider.net plugin repository.
