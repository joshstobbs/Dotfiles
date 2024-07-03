return {
	"Shatur/neovim-ayu",
	priority = 100002,
	config = function()
		local colors = require("ayu.colors")
		colors.generate(true)

		require("ayu").setup({
			mirage = true,
			overrides = {
				-- FzfLuaNormal = {},
				FzfLuaBorder = { fg = colors.comment },

				IblIndent = { fg = "#262D39" },

				CursorWord = { bg = "NONE", underline = true },
				CursorLineNr = { fg = colors.comment, bg = colors.bg },
				CursorLine = { bg = colors.bg },

				Folded = { bg = "NONE" },

				StatusLine = { bg = colors.bg },

				VertSplit = { fg = "#262D39", bg = colors.bg },
				NvimTreeFolderIcon = { fg = colors.comment },
				NvimTreeFolderName = { fg = colors.fg },
				NvimTreeOpenedFolderIcon = { fg = colors.accent },
				NvimTreeOpenedFolderName = { fg = colors.fg },

				FlashMatch = { fg = colors.fg },
				FlashCurrent = { fg = colors.fg },
				FlashLabel = { fg = colors.accent, bg = colors.selection_bg },

				PmenuSel = { bg = "#282e3e", fg = "NONE" },
				Pmenu = { fg = colors.fg, bg = colors.line },
				PmenuSbar = { bg = colors.line },
				PmenuThumb = { bg = colors.comment },

				NormalFloat = { bg = colors.panel_bg },

				TelescopeMatching = { fg = colors.accent },
				TelescopeSelection = { fg = colors.fg, bg = colors.panel_bg },
				TelescopeSelectionCaret = { fg = colors.line, bg = colors.line },

				TelescopePromptPrefix = { bg = colors.panel_bg },
				TelescopePromptNormal = { bg = colors.panel_bg },
				TelescopeResultsNormal = { bg = colors.line },
				TelescopePreviewNormal = { bg = colors.line },
				TelescopePromptBorder = { bg = colors.panel_bg, fg = colors.panel_bg },
				TelescopeResultsBorder = { bg = colors.line, fg = colors.line },
				TelescopePreviewBorder = { bg = colors.line, fg = colors.line },
				TelescopePromptTitle = { bg = colors.accent, fg = colors.panel_bg },
				TelescopeResultsTitle = { fg = colors.line },
				TelescopePreviewTitle = { bg = colors.accent, fg = colors.panel_bg },

				DiagnosticError = { fg = colors.comment },
				DiagnosticWarn = { fg = colors.comment },
				DiagnosticInfo = { fg = colors.comment },
				DiagnosticHint = { fg = colors.comment },
				DiagnosticSignError = { fg = colors.error },
				DiagnosticSignWarn = { fg = colors.keyword },
				DiagnosticSignInfo = { fg = colors.tag },
				DiagnosticSignHint = { fg = colors.regexp },

				-- Search = { fg = colors.accent, bg = colors.selection_inactive },
				-- CurSearch = { fg = "green", bg = "pink" },
				-- IncSearch = { fg = "orange", bg = "blue" },
			},
		})

		require("ayu").colorscheme()
	end,
}
