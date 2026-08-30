local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- Pick one of: cyberpunk, tokyo-night, rose-pine.
-- Override per machine with LINUX_CONFIG_THEME.
local theme = os.getenv("LINUX_CONFIG_THEME") or "cyberpunk"

local color_schemes = {
  ["cyberpunk"] = "cyberpunk",
  ["tokyo-night"] = "Tokyo Night",
  ["rose-pine"] = "Rosé Pine",
}

config.color_scheme = color_schemes[theme] or color_schemes["cyberpunk"]
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Regular" })
config.font_size = 13.0
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.92
config.max_fps = 120
config.enable_wayland = true
config.warn_about_missing_glyphs = false
config.inactive_pane_hsb = {
  saturation = 0.8,
  brightness = 0.6,
}

config.keys = {
  {
    key = "q",
    mods = "CTRL",
    action = wezterm.action.ToggleFullScreen,
  },
  {
    key = "'",
    mods = "CTRL",
    action = wezterm.action.ClearScrollback("ScrollbackAndViewport"),
  },
}

config.mouse_bindings = {
  {
    event = { Up = { streak = 1, button = "Left" } },
    mods = "CTRL",
    action = wezterm.action.OpenLinkAtMouseCursor,
  },
}

return config
