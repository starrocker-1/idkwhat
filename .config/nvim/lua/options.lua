require "nvchad.options"

-- add yours here!
vim.opt.relativenumber = true


vim.cmd([[let @f="0f[lr!A #failedj"]])
vim.cmd([[let @g="0f[lrxj"]])
vim.cmd([[let @v="0f[lr-j"]])
vim.cmd([[let @r="0f[lr $vF#dxj"]])
vim.cmd([[let @b="0f[lr j"]])



-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
