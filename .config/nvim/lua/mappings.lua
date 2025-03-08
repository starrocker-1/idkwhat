require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("i", "jk", "<ESC>")
map('n', '<M-w>', '<C-w>', { noremap = true, silent = false  })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")


