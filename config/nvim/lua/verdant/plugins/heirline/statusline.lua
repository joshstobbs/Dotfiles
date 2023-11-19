local colors = require("ayu.colors")
colors.generate(true)

local ViMode = {
	init = function(self)
		self.mode = vim.fn.mode(1) -- :h mode()
	end,
	static = {
		mode_names = {
			n = "Normal", -- "N",
			no = "Normal (Operator Pending)", -- "N?",
			nov = "Normal (Operator Pending)", -- "N?",
			noV = "Normal (Operator Pending)", -- "N?",
			["no\22"] = "Normal (Operator Pending)", -- "N?",
			niI = "Normal (Insert)", -- "Ni",
			niR = "Normal (Replace)", -- "Nr",
			niV = "Normal (Visual)", -- "Nv",
			nt = "Normal (Terminal-Normal)", -- "Nt",
			v = "Visual", -- "V",
			vs = "Visual (Select)", -- "Vs",
			V = "Visual (Line)", -- "V_",
			Vs = "Visual (Select Line)", -- "Vs",
			["\22"] = "Visual (Block)", -- "^V",
			["\22s"] = "Visual (Block Select)", -- "^V",
			s = "Select", -- "S",
			S = "Select (Line)", -- "S_",
			["\19"] = "Select (Block)", -- "^S",
			i = "Insert", -- "I",
			ic = "Insert (Completion)", -- "Ic",
			ix = "Insert (x)", -- "Ix",
			R = "Replace", -- "R",
			Rc = "Replace (Completion)", -- "Rc",
			Rx = "Replace (x)", -- "Rx",
			Rv = "Replace (Visual)", -- "Rv",
			Rvc = "Replace (Visual Completion)", -- "Rv",
			Rvx = "Replace (Visual x)", -- "Rv",
			c = "Command-Line", -- "C",
			cv = "Ex", -- "Ex",
			r = "Hit-Enter", -- "...",
			rm = "More-Prompt", -- "M",
			["r?"] = "Hit-Enter?", -- "?",
			["!"] = "Shell", -- "!",
			t = "Terminal-Job", -- "T",
		},
		mode_colors = {
			n = "red",
			i = "green",
			v = "cyan",
			V = "cyan",
			["\22"] = "cyan",
			c = "orange",
			s = "purple",
			S = "purple",
			["\19"] = "purple",
			R = "orange",
			r = "orange",
			["!"] = "red",
			t = "red",
		},
	},
	provider = function(self)
		return " %2(" .. self.mode_names[self.mode] .. "%)"
	end,
	hl = function(self)
		local mode = self.mode:sub(1, 1) -- get only the first mode character
		return { fg = self.mode_colors[mode], bold = true }
	end,
	update = {
		"ModeChanged",
		pattern = "*:*",
		callback = vim.schedule_wrap(function()
			vim.cmd("redrawstatus")
		end),
	},
}

return {
	{ ViMode },
}
