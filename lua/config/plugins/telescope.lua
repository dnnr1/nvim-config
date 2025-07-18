-- ================================
--         Telescope Plugin
-- ================================

return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	cmd = "Telescope",
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
		{ "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find help" },
		{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
		{ "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Commands" },
		{ "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
		{ "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git status" },
		{ "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Git branches" },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local trouble = require("trouble")
		
		local ignore_patterns = {
			"%.git/",
			"node_modules/",
			"%.npm/",
			"__pycache__/",
			"%.DS_Store",
			"%.pyc",
			"%.jpg",
			"%.jpeg",
			"%.png",
			"%.gif",
			"%.pdf",
			"%.mkv",
			"%.mp4",
			"%.zip",
		}
		
		telescope.setup({
			defaults = {
				prompt_prefix = " ",
				selection_caret = " ",
				path_display = { "truncate" },
				file_ignore_patterns = ignore_patterns,
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<C-t>"] = function(...) trouble.toggle("telescope") end,
						["<C-d>"] = actions.delete_buffer + actions.move_to_top,
						["<C-u>"] = false,
						["<C-s>"] = actions.select_horizontal,
						["<C-v>"] = actions.select_vertical,
					},
					n = {
						["<C-t>"] = function(...) trouble.toggle("telescope") end,
						["dd"] = actions.delete_buffer + actions.move_to_top,
					},
				},
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55,
						results_width = 0.8,
					},
					vertical = {
						mirror = false,
					},
					width = 0.87,
					height = 0.80,
					preview_cutoff = 120,
				},
				sorting_strategy = "ascending",
				winblend = 0,
				border = {},
				borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			},
			pickers = {
				find_files = {
					theme = "dropdown",
					previewer = false,
					hidden = true,
				},
				live_grep = {
					additional_args = function(opts)
						return {"--hidden"}
					end
				},
				buffers = {
					theme = "dropdown",
					previewer = false,
					initial_mode = "normal",
					mappings = {
						i = {
							["<C-d>"] = actions.delete_buffer + actions.move_to_top,
						}
					}
				},
			},
		})
		
		telescope.load_extension("fzf")
	end,
}
