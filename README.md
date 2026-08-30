# linux-config

Linux desktop configuration for Niri + Noctalia, with a developer-focused setup. Managed with GNU Stow.

Distro-agnostic, written first for CachyOS.

## Tools

| Tool | Purpose |
|---|---|
| Niri | Scrollable-tiling Wayland compositor |
| Noctalia | Desktop shell |
| WezTerm | GPU-accelerated terminal |
| mise | Runtime and development-tool version manager |
| GNU Stow | Symlink farm for packages in this repo |

## Installation

Install the desktop dependencies from your distribution, then:

```bash
git clone git@github.com:mrbarboza/linux-config.git ~/dotfiles
cd ~/dotfiles
stow niri noctalia wezterm mise
```

## Themes

The repository includes palettes for:

- Cyberpunk (current desktop default)
- Tokyo Night
- Rosé Pine

### WezTerm

WezTerm can select a theme through `LINUX_CONFIG_THEME`:

```bash
LINUX_CONFIG_THEME=tokyo-night wezterm
LINUX_CONFIG_THEME=rose-pine wezterm
```

Supported values are:

- `cyberpunk`
- `tokyo-night`
- `rose-pine`

The Tokyo Night and Rosé Pine palettes are also stored under `themes/` as the source of truth for extending the theme consistently into Niri and Noctalia.

## mise

mise is stowed to:

```text
~/.config/mise/config.toml
```

Install mise using your distribution package manager or the official installer, then manage development runtimes per project with a `mise.toml`.

Example:

```bash
mise use node@lts
mise use python@3.13
mise use go@latest
```

## Layout

```text
linux-config/
├── niri/
├── noctalia/
├── wezterm/
├── mise/
└── themes/
    ├── tokyo-night/
    └── rose-pine/
```
