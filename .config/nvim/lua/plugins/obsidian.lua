return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    ui = { enable = false },
    workspaces = {
      {
        name = "MyLife",
        path = "~/Documents/MyLife/",
      },
    },
    templates = {
      folder = "~/Documents/MyLife/06 - Templates/",
      date_format = "%Y-%m-%d",  -- Date format
      time_format = "%H:%M",  -- Time format
      substitutions = {},
    },
    disable_frontmatter = true,
  },
}

