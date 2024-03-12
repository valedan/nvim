return {
	"echasnovski/mini.ai",
	-- keys = {
	--   { "a", mode = { "x", "o" } },
	--   { "i", mode = { "x", "o" } },
	-- },
	event = "VeryLazy",
	dependencies = { "nvim-treesitter-textobjects" },
	opts = function()
		local ai = require("mini.ai")
		return {
			n_lines = 2000,
			custom_textobjects = {
				o = ai.gen_spec.treesitter({
					a = { "@block.outer", "@conditional.outer", "@loop.outer" },
					i = { "@block.inner", "@conditional.inner", "@loop.inner" },
				}, {}),
				f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
				c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
			},
			-- Module mappings. Use `''` (empty string) to disable one.
			mappings = {
				-- Main textobject prefixes
				around = "a",
				inside = "i",

				-- Next/last variants
				around_next = "an",
				inside_next = "in",
				around_last = "al",
				inside_last = "il",

				-- Move cursor to corresponding edge of `a` textobject
				goto_left = "g[",
				goto_right = "g]",
			},
		}
	end,
}
