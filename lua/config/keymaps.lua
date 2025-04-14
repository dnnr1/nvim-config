-- ================================
--         Key Mapping Configuration
-- ================================

local keymap = vim.keymap

-- Set leader key to space
vim.g.mapleader = " "

-- Insert Mode Mappings
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- General Mappings
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Tab Management Mappings
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Goodies Mappings
keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })
keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save" })

-- Buffer Navigation Mappings
keymap.set("n", "<leader>]", ":bnext<CR>", { desc = "Go to next buffer" })
keymap.set("n", "<leader>[", ":bprevious<CR>", { desc = "Go to previous buffer" })

-- Navigation Mappings
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Miscellaneous Mappings
keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files with Telescope" })
keymap.set("n", "<leader>fs", ":Telescope live_grep<CR>", { desc = "Live grep with Telescope" })
keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "List buffers with Telescope" })
keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "Find help tags with Telescope" })
keymap.set("n", "<leader>ft", ":TodoTelescope<CR>", { desc = "Find todos" })
