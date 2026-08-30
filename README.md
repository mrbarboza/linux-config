# linux-config

Linux desktop configuration for [Niri](https://github.com/niri-wm/niri) + [Noctalia](https://github.com/noctalia-dev/noctalia), with a Cyberpunk 2077-inspired look. Managed with [GNU Stow](https://www.gnu.org/software/stow/), same idea as [dotfiles](https://github.com/mrbarboza/dotfiles).

Distro-agnostic, written first for [CachyOS](https://cachyos.org/).

## Tools Overview

| Tool | Purpose |
| ------ | --------- |
| Niri | Scrollable-tiling Wayland compositor |
| Noctalia | Desktop shell (bar, launcher, control center, wallpaper, lock) |
| WezTerm | GPU-accelerated terminal |
| GNU Stow | Symlink farm for the packages in this repo |

## Prerequisites

### CachyOS

Noctalia **v5** is the `noctalia` package (`noctalia-shell` is the older v4 line).

```bash
sudo pacman -S niri noctalia wezterm stow ttf-jetbrains-mono-nerd \
  xdg-desktop-portal-gnome xdg-desktop-portal-gtk playerctl
```

To pull the full CachyOS Niri session meta-package (extra defaults, portals, session file):

```bash
sudo pacman -S cachyos-niri-noctalia
```

Then still stow this repo on top so the cyberpunk configs win.

### Other distros

Install the same tools from your package manager. Names that usually match:

- `niri`, `wezterm`, `stow`
- Noctalia v5: see [docs.noctalia.dev](https://docs.noctalia.dev/noctalia/)
- JetBrainsMono Nerd Font (or `ttf-jetbrains-mono-nerd` on Arch)

Pick **Niri** from your display manager (or start it from a TTY with `niri-session` / `niri --session`).

## Installation

```bash
git clone git@github.com:mrbarboza/linux-config.git ~/dotfiles/linux-config
cd ~/dotfiles/linux-config
stow niri noctalia wezterm
```

- Stow symlinks into `$HOME` (configured via `.stowrc`)
- Packages keep the `.config/...` prefix, so they land at `~/.config/niri`, `~/.config/noctalia`, and `~/.config/wezterm`
- Restow after pulls with `stow -R niri noctalia wezterm`

Then log into a Niri session. Noctalia is started from `spawn-at-startup "noctalia"`.

### Wallpaper

Noctalia is set to `source = "wallpaper"` with `pure_black_dark = true`, so the shell palette is generated from whatever wallpaper you pick. Drop a Night City / neon image in `~/Pictures` and set it from the Noctalia wallpaper panel (or launcher: `/wall`). Hot pink `#ff2a6d` and cyan `#05d9e8` are hard-coded on Niri's focus ring and border regardless.

## Per-tool Configuration

### Niri

- Autostarts Noctalia
- Rounded corners (`geometry-corner-radius 20`) + `clip-to-geometry`
- Focus ring: pink → cyan gradient; border: cyan active / hot pink urgent
- Window blur, Noctalia layer rules, and the xdg-activation fix from the [Noctalia Niri guide](https://docs.noctalia.dev/noctalia/compositor-settings/niri/)
- WezTerm empty `default-column-width` workaround (upstream default)

### Noctalia

- Dark mode, wallpaper-driven palette, pure-black surfaces
- Glass panels, JetBrainsMono Nerd Font
- Type-to-launch from the Niri overview is enabled

### WezTerm

- **Theme:** `cyberpunk`
- **Font:** JetBrainsMono Nerd Font 13pt
- Tab bar off, `RESIZE` decorations, 0.92 opacity
- **Keybindings:**
  - `Ctrl+Q` → toggle fullscreen
  - `Ctrl+'` → clear scrollback
  - `Ctrl+Click` → open link under cursor

## Keybinds

`Mod` is Super (the Windows / Command key) on a TTY session.

| Keys | Action |
| ------ | -------- |
| `Mod+Space` | Noctalia launcher |
| `Mod+S` | Control center |
| `Mod+,` | Noctalia settings |
| `Alt+Tab` | Window switcher |
| `Mod+T` / `Mod+Return` | WezTerm |
| `Mod+Q` | Close window |
| `Mod+O` | Overview |
| `Super+Alt+L` | Lock screen |
| `Mod+H/J/K/L` or arrows | Focus column / window |
| `Mod+Ctrl+H/J/K/L` | Move column / window |
| `Mod+1`–`9` | Focus workspace |
| `Mod+Ctrl+1`–`9` | Move column to workspace |
| `Mod+U` / `Mod+I` | Workspace down / up |
| `Mod+F` | Maximize column |
| `Mod+Shift+F` | Fullscreen |
| `Mod+V` | Toggle floating |
| `Mod+W` | Tabbed column |
| `Mod+Shift+E` | Quit niri |
| Volume / brightness keys | Via Noctalia |
| `Print` | Screenshot |

`Mod+Shift+/` shows the in-compositor hotkey overlay.

## Layout

```text
linux-config/
├── README.md
├── .stowrc
├── niri/
│   └── .config/niri/config.kdl
├── noctalia/
│   └── .config/noctalia/config.toml
└── wezterm/
    └── .config/wezterm/wezterm.lua
```
