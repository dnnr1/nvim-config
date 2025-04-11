-- ================================
--         Lorem Plugin
-- ================================

return {
	"dnnr1/lorem-ipsum.nvim",
	config = function()
		require("lorem_ipsum")
	end,
	dependencies = {
		"hrsh7th/nvim-cmp",
	},
}
