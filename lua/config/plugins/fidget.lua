-- ================================
--  Fidget.nvim
-- ================================

return {
	"j-hui/fidget.nvim",
	event = "LspAttach",
	opts = {
		progress = {
			suppress_on_insert = true,
			ignore_done_already = true,
			ignore_empty_message = true,
			ignore = {
				"ltex",
				function(msg)
					return msg.lsp_client.name == "lua_ls" and string.find(msg.title, "Diagnosing")
				end,
			},
		},
		logger = {
			level = vim.log.levels.OFF, -- disable logging
		},
	},
}
