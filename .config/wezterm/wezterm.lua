local wezterm = require('wezterm')
local config = {}

local light_theme = 'Ef-Cyprus'
local dark_theme = 'Ef-Elea-Dark'

function get_appearance()
if wezterm.gui then
return wezterm.gui.get_appearance()
end
return 'Light'
end

function scheme_for_appearance(appearance)
if appearance:find 'Dark' then
return dark_theme
else
return light_theme
end
end

config.color_scheme = scheme_for_appearance(get_appearance())
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true

return config
