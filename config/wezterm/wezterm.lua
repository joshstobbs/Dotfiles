local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- System
-- config.term = "wezterm"
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"

-- Keys
config.disable_default_key_bindings = false
config.enable_csi_u_key_encoding = false
config.enable_kitty_keyboard = true

-- Shortcuts
local function is_vim(pane)
	return pane:get_user_vars().IS_NVIM == "true"
end

local direction_keys = {
	Left = "h",
	Down = "j",
	Up = "k",
	Right = "l",
	-- Reverse lookup
	h = "Left",
	j = "Down",
	k = "Up",
	l = "Right",
}

local function split_nav(resize_or_move, key)
	return {
		key = key,
		mods = resize_or_move == "resize" and "META" or "CTRL",
		action = wezterm.action_callback(function(win, pane)
			if is_vim(pane) then
				-- pass the keys through to vim/nvim
				win:perform_action({
					SendKey = { key = key, mods = resize_or_move == "resize" and "META" or "CTRL" },
				}, pane)
			else
				if resize_or_move == "resize" then
					win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
				else
					win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
				end
			end
		end),
	}
end

config.keys = {
	-- Splits
	{ key = "s", mods = "CMD", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "s", mods = "CMD|SHIFT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },

	-- move between split panes
	split_nav("move", "h"),
	split_nav("move", "j"),
	split_nav("move", "k"),
	split_nav("move", "l"),
	-- resize panes
	split_nav("resize", "h"),
	split_nav("resize", "j"),
	split_nav("resize", "k"),
	split_nav("resize", "l"),

	-- Pane Management
	{ key = "w", mods = "CMD", action = wezterm.action.CloseCurrentPane({ confirm = false }) },
}

-- Font
config.font = wezterm.font_with_fallback({ "MonoLisa", { family = "Symbols Nerd Font Mono", scale = 0.75 } })
config.font_size = 17.0
config.line_height = 1.85
config.warn_about_missing_glyphs = false

-- Theme
config.color_scheme = "Ayu Mirage"
config.use_fancy_tab_bar = false
config.window_padding = { top = 8, left = 28, right = 28 }

local theme = wezterm.get_builtin_color_schemes()[config.color_scheme]

config.colors = {
	split = theme.background,
	tab_bar = {
		-- #131720
		background = theme.background,
		active_tab = { bg_color = theme.background, fg_color = theme.foreground },
		inactive_tab = { bg_color = theme.background, fg_color = "#5C6773" },
		inactive_tab_hover = { bg_color = theme.background, fg_color = "#5C6773" },
		new_tab = { bg_color = theme.background, fg_color = "#5C6773" },
		new_tab_hover = { bg_color = theme.background, fg_color = theme.foreground },
	},
}

-- Tabs
config.tab_max_width = 1000

local function basename(s)
	return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

local function tab_process(tab)
	local pane = tab.active_pane
	local process = basename(pane.foreground_process_name)

	return process
end

local function tab_title(tab)
	local title = tab.tab_title

	if title and #title > 0 then
		return title
	end

	return string.gsub(tab.active_pane.current_working_dir, "(.*[/\\])(.*)", "%2")
end

local process_icons = {
	["fish"] = { Text = " " },
	["nvim"] = { Text = " " },
}

local icon_colors = {
	["nvim"] = { Foreground = { Color = "#d9f99d" } },
}

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local process = tab_process(tab)
	local title = tab_title(tab)
	local icon = { Text = "" }
	local color = { Text = "" }

	if process_icons[process] ~= nil then
		icon = process_icons[process]
	end

	if icon_colors[process] ~= nil and tab.is_active then
		color = icon_colors[process]
	end

	return {
		{ Text = "  " },
		"ResetAttributes",
		color,
		icon,
		"ResetAttributes",
		{ Text = title },
	}
end)

function os.capture(cmd, raw)
	local f = assert(io.popen(cmd, "r"))
	local s = assert(f:read("*a"))
	f:close()
	if raw then
		return s
	end
	s = string.gsub(s, "^%s+", "")
	s = string.gsub(s, "%s+$", "")
	s = string.gsub(s, "[\n\r]+", " ")
	return s
end

-- Hyperlinks
config.hyperlink_rules = {
	-- Linkify things that look like URLs and the host has a TLD name.
	-- Compiled-in default. Used if you don't specify any hyperlink_rules.
	{ regex = "\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b", format = "$0" },

	-- linkify email addresses
	-- Compiled-in default. Used if you don't specify any hyperlink_rules.
	{ regex = [[\b\w+@[\w-]+(\.[\w-]+)+\b]], format = "mailto:$0" },
	-- file:// URI
	-- Compiled-in default. Used if you don't specify any hyperlink_rules.
	{ regex = [[\bfile://\S*\b]], format = "$0" },

	-- Make username/project paths clickable. This implies paths like the following are for GitHub.
	-- ( "nvim-treesitter/nvim-treesitter" | wbthomason/packer.nvim | wez/wezterm | "wez/wezterm.git" )
	-- As long as a full URL hyperlink regex exists above this it should not match a full URL to
	-- GitHub or GitLab / BitBucket (i.e. https://gitlab.com/user/project.git is still a whole clickable URL)
	{ regex = [["([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)"]], format = "https://www.github.com/$1/$3" },
}

return config
