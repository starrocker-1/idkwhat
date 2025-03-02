return {
    'MeanderingProgrammer/render-markdown.nvim', 
    dependencies = { 'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    config = function()
      vim.api.nvim_set_hl(0, 'RenderMarkdownH1', {fg = '#cba6f7'})
      vim.api.nvim_set_hl(0, 'RenderMarkdownH1Bg', {fg = '#cba6f7'})
      vim.api.nvim_set_hl(0, 'RenderMarkdownH2', {fg = '#b4befe'})
      vim.api.nvim_set_hl(0, 'RenderMarkdownH2Bg', {fg = '#b4befe'})
      vim.api.nvim_set_hl(0, 'RenderMarkdownH3', {fg = '#89b4fa'})
      vim.api.nvim_set_hl(0, 'RenderMarkdownH3Bg', {fg = '#89b4fa'})
      vim.api.nvim_set_hl(0, 'RenderMarkdownH4', {fg = '#74c7ec'})
      vim.api.nvim_set_hl(0, 'RenderMarkdownH4Bg', {fg = '#74c7ec'})
      vim.api.nvim_set_hl(0, 'RenderMarkdownH5', {fg = '#94e2d5'})
      vim.api.nvim_set_hl(0, 'RenderMarkdownH5Bg', {fg = '#94e2d5'})
      vim.api.nvim_set_hl(0, 'RenderMarkdownH6', {fg = '#f8bd96'})
      vim.api.nvim_set_hl(0, 'RenderMarkdownH6Bg', {fg = '#f8bd96'})
      vim.api.nvim_set_hl(0, 'RenderMarkdownFail', {fg = '#e85b6c'})
      vim.api.nvim_set_hl(0, 'RenderMarkdownChecked', {fg = '#a6e3a1'})
      vim.api.nvim_set_hl(0, 'RenderMarkdownTodo', {fg = '#fae3b0'})
    end,
}
