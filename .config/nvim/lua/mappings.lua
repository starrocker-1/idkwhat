require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map('n', '<M-w>', '<C-w>', { noremap = true, silent = false  })
map({ "n", "t" }, "<leader>tf", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- map("i", "jk", "<ESC>")


