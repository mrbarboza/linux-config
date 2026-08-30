# Themes

The theme picker reads semantic palettes from this directory and persists the active
theme under `~/.local/state/linux-config/theme`.

Available themes:

- Cyberpunk
- Tokyo Night
- Rosé Pine

The picker is intentionally a small implementation detail rather than a general
purpose CLI. It is launched from a Niri keybinding and applies the selected
palette across supported desktop components.
