vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
   {
     "NvChad/NvChad",
     lazy = false,
     branch = "v2.5",
     import = "nvchad.plugins",
   },

   { import = "plugins" },
 }, lazy_config)

require("image").setup({
  backend = "kitty",
  processor = "magick_rock", -- or "magick_cli"
  integrations = {
    markdown = {
      enabled = true,
      clear_in_insert_mode = false,
      download_remote_images = true,
      only_render_image_at_cursor = true,
      floating_windows = false, -- if true, images will be rendered in floating markdown windows
      filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
    },
    neorg = {
      enabled = true,
      filetypes = { "norg" },
    },
    typst = {
      enabled = true,
      filetypes = { "typst" },
    },
    html = {
      enabled = false,
    },
    css = {
      enabled = false,
    },
  },
  max_width = nil,
  max_height = nil,
  max_width_window_percentage = nil,
  max_height_window_percentage = 50,
  window_overlap_clear_enabled = false, -- toggles images when windows are overlapped
  window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "snacks_notif", "scrollview", "scrollview_sign" },
  editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
  hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
})

require('render-markdown').setup({
  file_types = { 'markdown', 'vimwiki' },
  heading = {
    -- Turn on / off heading icon & background rendering
    enabled = true,
    -- Additional modes to render headings
    render_modes = false,
    -- Turn on / off any sign column related rendering
    sign = true,
    -- Replaces '#+' of 'atx_h._marker'
    -- The number of '#' in the heading determines the 'level'
    -- The 'level' is used to index into the list using a cycle
    -- If the value is a function the input context contains the nesting level of the heading within sections
    icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
    -- Determines how icons fill the available space:
    --  right:   '#'s are concealed and icon is appended to right side
    --  inline:  '#'s are concealed and icon is inlined on left side
    --  overlay: icon is left padded with spaces and inserted on left hiding any additional '#'
    position = 'right',
    -- Added to the sign column if enabled
    -- The 'level' is used to index into the list using a cycle
    signs = { '󰫎 ' },
    -- Width of the heading background:
    --  block: width of the heading text
    --  full:  full width of the window
    -- Can also be a list of the above values in which case the 'level' is used
    -- to index into the list using a clamp
    width = 'full',
    -- Amount of margin to add to the left of headings
    -- If a floating point value < 1 is provided it is treated as a percentage of the available window space
    -- Margin available space is computed after accounting for padding
    -- Can also be a list of numbers in which case the 'level' is used to index into the list using a clamp
    left_margin = 0,
    -- Amount of padding to add to the left of headings
    -- If a floating point value < 1 is provided it is treated as a percentage of the available window space
    -- Can also be a list of numbers in which case the 'level' is used to index into the list using a clamp
    left_pad = 0,
    -- Amount of padding to add to the right of headings when width is 'block'
    -- If a floating point value < 1 is provided it is treated as a percentage of the available window space
    -- Can also be a list of numbers in which case the 'level' is used to index into the list using a clamp
    right_pad = 0,
    -- Minimum width to use for headings when width is 'block'
    -- Can also be a list of integers in which case the 'level' is used to index into the list using a clamp
    min_width = 0,
    -- Determines if a border is added above and below headings
    -- Can also be a list of booleans in which case the 'level' is used to index into the list using a clamp
    border = false,
    -- Always use virtual lines for heading borders instead of attempting to use empty lines
    border_virtual = false,
    -- Highlight the start of the border using the foreground highlight
    border_prefix = false,
    -- Used above heading for border
    above = '▄',
    -- Used below heading for border
    below = '▀',
    -- The 'level' is used to index into the list using a clamp
    -- Highlight for the heading icon and extends through the entire line
    backgrounds = {
      'RenderMarkdownH1Bg',
      'RenderMarkdownH2Bg',
      'RenderMarkdownH3Bg',
      'RenderMarkdownH4Bg',
      'RenderMarkdownH5Bg',
      'RenderMarkdownH6Bg',
    },
    -- The 'level' is used to index into the list using a clamp
    -- Highlight for the heading and sign icons
    foregrounds = {
      'RenderMarkdownH1',
      'RenderMarkdownH2',
      'RenderMarkdownH3',
      'RenderMarkdownH4',
      'RenderMarkdownH5',
      'RenderMarkdownH6',
    },
    -- Define custom heading patterns which allow you to override various properties
    -- based on the contents of a heading. Each entry should consist of a string key,
    -- which is used mostly as an identifier, and a table value with:
    --   'pattern':    Matched against the heading text see :h lua-pattern
    --   'icon':       Optional override for the icon
    --   'background': Optional override for the background
    --   'foreground': Optional override for the foreground
    custom = {
    },
  },
  paragraph = {
    -- Turn on / off paragraph rendering
    enabled = true,
    -- Additional modes to render paragraphs
    render_modes = false,
    -- Amount of margin to add to the left of paragraphs
    -- If a floating point value < 1 is provided it is treated as a percentage of the available window space
    left_margin = 0,
    -- Minimum width to use for paragraphs
    min_width = 0,
  },
  code = {
    -- Turn on / off code block & inline code rendering
    enabled = true,
    -- Additional modes to render code blocks
    render_modes = false,
    -- Turn on / off any sign column related rendering
    sign = true,
    -- Determines how code blocks & inline code are rendered:
    --  none:     disables all rendering
    --  normal:   adds highlight group to code blocks & inline code, adds padding to code blocks
    --  language: adds language icon to sign column if enabled and icon + name above code blocks
    --  full:     normal + language
    style = 'full',
    -- Determines where language icon is rendered:
    --  right: right side of code block
    --  left:  left side of code block
    position = 'left',
    -- Amount of padding to add around the language
    -- If a floating point value < 1 is provided it is treated as a percentage of the available window space
    language_pad = 0,
    -- Whether to include the language name next to the icon
    language_name = true,
    -- A list of language names for which background highlighting will be disabled
    -- Likely because that language has background highlights itself
    -- Or a boolean to make behavior apply to all languages
    -- Borders above & below blocks will continue to be rendered
    disable_background = { 'diff' },
    -- Width of the code block background:
    --  block: width of the code block
    --  full:  full width of the window
    width = 'full',
    -- Amount of margin to add to the left of code blocks
    -- If a floating point value < 1 is provided it is treated as a percentage of the available window space
    -- Margin available space is computed after accounting for padding
    left_margin = 0,
    -- Amount of padding to add to the left of code blocks
    -- If a floating point value < 1 is provided it is treated as a percentage of the available window space
    left_pad = 0,
    -- Amount of padding to add to the right of code blocks when width is 'block'
    -- If a floating point value < 1 is provided it is treated as a percentage of the available window space
    right_pad = 0,
    -- Minimum width to use for code blocks when width is 'block'
    min_width = 0,
    -- Determines how the top / bottom of code block are rendered:
    --  none:  do not render a border
    --  thick: use the same highlight as the code body
    --  thin:  when lines are empty overlay the above & below icons
    border = 'thin',
    -- Used above code blocks for thin border
    above = '▄',
    -- Used below code blocks for thin border
    below = '▀',
    -- Highlight for code blocks
    highlight = 'RenderMarkdownCode',
    -- Highlight for language, overrides icon provider value
    highlight_language = nil,
    -- Padding to add to the left & right of inline code
    inline_pad = 0,
    -- Highlight for inline code
    highlight_inline = 'RenderMarkdownCodeInline',
  },
  dash = {
    -- Turn on / off thematic break rendering
    enabled = true,
    -- Additional modes to render dash
    render_modes = false,
    -- Replaces '---'|'***'|'___'|'* * *' of 'thematic_break'
    -- The icon gets repeated across the window's width
    icon = '─',
    -- Width of the generated line:
    --  <number>: a hard coded width value, if a floating point value < 1 is provided it is
    --            treated as a percentage of the available window space
    --  full:     full width of the window
    width = 'full',
    -- Amount of margin to add to the left of dash
    -- If a floating point value < 1 is provided it is treated as a percentage of the available window space
    left_margin = 0,
    -- Highlight for the whole line generated from the icon
    highlight = 'RenderMarkdownDash',
  },
  bullet = {
    -- Turn on / off list bullet rendering
    enabled = true,
    -- Additional modes to render list bullets
    render_modes = false,
    -- Replaces '-'|'+'|'*' of 'list_item'
    -- How deeply nested the list is determines the 'level', how far down at that level determines the 'index'
    -- If a function is provided both of these values are provided in the context using 1 based indexing
    -- If a list is provided we index into it using a cycle based on the level
    -- If the value at that level is also a list we further index into it using a clamp based on the index
    -- If the item is a 'checkbox' a conceal is used to hide the bullet instead
    icons = { '❖', '◈' },
    -- Replaces 'n.'|'n)' of 'list_item'
    -- How deeply nested the list is determines the 'level', how far down at that level determines the 'index'
    -- If a function is provided both of these values are provided in the context using 1 based indexing
    -- If a list is provided we index into it using a cycle based on the level
    -- If the value at that level is also a list we further index into it using a clamp based on the index
    ordered_icons = function(ctx)
      local value = vim.trim(ctx.value)
      local index = tonumber(value:sub(1, #value - 1))
      return string.format('%d.', index > 1 and index or ctx.index)
    end,
    -- Padding to add to the left of bullet point
    left_pad = 0,
    -- Padding to add to the right of bullet point
    right_pad = 0,
    -- Highlight for the bullet icon
    highlight = 'RenderMarkdownBullet',
  },
  -- Checkboxes are a special instance of a 'list_item' that start with a 'shortcut_link'
  -- There are two special states for unchecked & checked defined in the markdown grammar
  checkbox = {
    -- Turn on / off checkbox state rendering
    enabled = true,
    -- Additional modes to render checkboxes
    render_modes = false,
    -- Determines how icons fill the available space:
    --  inline:  underlying text is concealed resulting in a left aligned icon
    --  overlay: result is left padded with spaces to hide any additional text
    position = 'inline',
    unchecked = {
      -- Replaces '[ ]' of 'task_list_marker_unchecked'
      icon = '󰄱 ',
      -- Highlight for the unchecked icon
      highlight = 'RenderMarkdownUnchecked',
      -- Highlight for item associated with unchecked checkbox
      scope_highlight = nil,
    },
    checked = {
      -- Replaces '[x]' of 'task_list_marker_checked'
      icon = '󰱒 ',
      -- Highlight for the checked icon
      highlight = 'RenderMarkdownChecked',
      -- Highlight for item associated with checked checkbox
      scope_highlight = 'RenderMarkdownChecked',
    },
    -- Define custom checkbox states, more involved as they are not part of the markdown grammar
    -- As a result this requires neovim >= 0.10.0 since it relies on 'inline' extmarks
    -- Can specify as many additional states as you like following the 'todo' pattern below
    --   The key in this case 'todo' is for healthcheck and to allow users to change its values
    --   'raw':             Matched against the raw text of a 'shortcut_link'
    --   'rendered':        Replaces the 'raw' value when rendering
    --   'highlight':       Highlight for the 'rendered' icon
    --   'scope_highlight': Highlight for item associated with custom checkbox
    custom = {
      todo = { raw = '[-]', rendered = '󰥔 ', highlight = 'RenderMarkdownTodo', scope_highlight = 'RenderMarkdownTodo' },
      failed = { raw = '[!]', rendered = '✘ ', highlight = 'RenderMarkdownFail', scope_highlight = 'RenderMarkdownFail'
      },
    },
  },
  quote = {
    -- Turn on / off block quote & callout rendering
    enabled = true,
    -- Additional modes to render quotes
    render_modes = false,
    -- Replaces '>' of 'block_quote'
    icon = '▋',
    -- Whether to repeat icon on wrapped lines. Requires neovim >= 0.10. This will obscure text if
    -- not configured correctly with :h 'showbreak', :h 'breakindent' and :h 'breakindentopt'. A
    -- combination of these that is likely to work is showbreak = '  ' (2 spaces), breakindent = true,
    -- breakindentopt = '' (empty string). These values are not validated by this plugin. If you want
    -- to avoid adding these to your main configuration then set them in win_options for this plugin.
    repeat_linebreak = false,
    -- Highlight for the quote icon
    highlight = 'RenderMarkdownQuote',
  },
  pipe_table = {
    -- Turn on / off pipe table rendering
    enabled = true,
    -- Additional modes to render pipe tables
    render_modes = false,
    -- Pre configured settings largely for setting table border easier
    --  heavy:  use thicker border characters
    --  double: use double line border characters
    --  round:  use round border corners
    --  none:   does nothing
    preset = 'heavy',
    -- Determines how the table as a whole is rendered:
    --  none:   disables all rendering
    --  normal: applies the 'cell' style rendering to each row of the table
    --  full:   normal + a top & bottom line that fill out the table when lengths match
    style = 'full',
    -- Determines how individual cells of a table are rendered:
    --  overlay: writes completely over the table, removing conceal behavior and highlights
    --  raw:     replaces only the '|' characters in each row, leaving the cells unmodified
    --  padded:  raw + cells are padded to maximum visual width for each column
    --  trimmed: padded except empty space is subtracted from visual width calculation
    cell = 'padded',
    -- Amount of space to put between cell contents and border
    padding = 1,
    -- Minimum column width to use for padded or trimmed cell
    min_width = 0,
    -- Characters used to replace table border
    -- Correspond to top(3), delimiter(3), bottom(3), vertical, & horizontal
    -- stylua: ignore
    border = {
      '┌', '┬', '┐',
      '├', '┼', '┤',
      '└', '┴', '┘',
      '│', '─',
    },
    -- Gets placed in delimiter row for each column, position is based on alignment
    alignment_indicator = '━',
    -- Highlight for table heading, delimiter, and the line above
    head = 'RenderMarkdownTableHead',
    -- Highlight for everything else, main table rows and the line below
    row = 'RenderMarkdownTableRow',
    -- Highlight for inline padding used to add back concealed space
    filler = 'RenderMarkdownTableFill',
  },
  -- Callouts are a special instance of a 'block_quote' that start with a 'shortcut_link'
  -- Can specify as many additional values as you like following the pattern from any below, such as 'note'
  --   The key in this case 'note' is for healthcheck and to allow users to change its values
  --   'raw':        Matched against the raw text of a 'shortcut_link', case insensitive
  --   'rendered':   Replaces the 'raw' value when rendering
  --   'highlight':  Highlight for the 'rendered' text and quote markers
  --   'quote_icon': Optional override for quote.icon value for individual callout
  callout = {
    note = { raw = '[!NOTE]', rendered = '󰋽 Note', highlight = 'RenderMarkdownInfo' },
    tip = { raw = '[!TIP]', rendered = '󰌶 Tip', highlight = 'RenderMarkdownSuccess' },
    important = { raw = '[!IMPORTANT]', rendered = '󰅾 Important', highlight = 'RenderMarkdownHint' },
    warning = { raw = '[!WARNING]', rendered = '󰀪 Warning', highlight = 'RenderMarkdownWarn' },
    caution = { raw = '[!CAUTION]', rendered = '󰳦 Caution', highlight = 'RenderMarkdownError' },
    -- Obsidian: https://help.obsidian.md/Editing+and+formatting/Callouts
    abstract = { raw = '[!ABSTRACT]', rendered = '󰨸 Abstract', highlight = 'RenderMarkdownInfo' },
    summary = { raw = '[!SUMMARY]', rendered = '󰨸 Summary', highlight = 'RenderMarkdownInfo' },
    tldr = { raw = '[!TLDR]', rendered = '󰨸 Tldr', highlight = 'RenderMarkdownInfo' },
    info = { raw = '[!INFO]', rendered = '󰋽 Info', highlight = 'RenderMarkdownInfo' },
    todo = { raw = '[!TODO]', rendered = '󰗡 Todo', highlight = 'RenderMarkdownInfo' },
    hint = { raw = '[!HINT]', rendered = '󰌶 Hint', highlight = 'RenderMarkdownSuccess' },
    success = { raw = '[!SUCCESS]', rendered = '󰄬 Success', highlight = 'RenderMarkdownSuccess' },
    check = { raw = '[!CHECK]', rendered = '󰄬 Check', highlight = 'RenderMarkdownSuccess' },
    done = { raw = '[!DONE]', rendered = '󰄬 Done', highlight = 'RenderMarkdownSuccess' },
    question = { raw = '[!QUESTION]', rendered = '󰘥 Question', highlight = 'RenderMarkdownWarn' },
    help = { raw = '[!HELP]', rendered = '󰘥 Help', highlight = 'RenderMarkdownWarn' },
    faq = { raw = '[!FAQ]', rendered = '󰘥 Faq', highlight = 'RenderMarkdownWarn' },
    attention = { raw = '[!ATTENTION]', rendered = '󰀪 Attention', highlight = 'RenderMarkdownWarn' },
    failure = { raw = '[!FAILURE]', rendered = '󰅖 Failure', highlight = 'RenderMarkdownError' },
    fail = { raw = '[!FAIL]', rendered = '󰅖 Fail', highlight = 'RenderMarkdownError' },
    missing = { raw = '[!MISSING]', rendered = '󰅖 Missing', highlight = 'RenderMarkdownError' },
    danger = { raw = '[!DANGER]', rendered = '󱐌 Danger', highlight = 'RenderMarkdownError' },
    error = { raw = '[!ERROR]', rendered = '󱐌 Error', highlight = 'RenderMarkdownError' },
    bug = { raw = '[!BUG]', rendered = '󰨰 Bug', highlight = 'RenderMarkdownError' },
    example = { raw = '[!EXAMPLE]', rendered = '󰉹 Example', highlight = 'RenderMarkdownHint' },
    quote = { raw = '[!QUOTE]', rendered = '󱆨 Quote', highlight = 'RenderMarkdownQuote' },
    cite = { raw = '[!CITE]', rendered = '󱆨 Cite', highlight = 'RenderMarkdownQuote' },
  },
  link = {
    -- Turn on / off inline link icon rendering
    enabled = true,
    -- Additional modes to render links
    render_modes = false,
    -- How to handle footnote links, start with a '^'
    footnote = {
      -- Replace value with superscript equivalent
      superscript = true,
      -- Added before link content when converting to superscript
      prefix = '',
      -- Added after link content when converting to superscript
      suffix = '',
    },
    -- Inlined with 'image' elements
    image = '󰥶 ',
    -- Inlined with 'email_autolink' elements
    email = '󰀓 ',
    -- Fallback icon for 'inline_link' and 'uri_autolink' elements
    hyperlink = '󰌹 ',
    -- Applies to the inlined icon as a fallback
    highlight = 'RenderMarkdownLink',
    -- Applies to WikiLink elements
    wiki = { icon = '󱗖 ', highlight = 'RenderMarkdownWikiLink' },
    -- Define custom destination patterns so icons can quickly inform you of what a link
    -- contains. Applies to 'inline_link', 'uri_autolink', and wikilink nodes. When multiple
    -- patterns match a link the one with the longer pattern is used.
    -- Can specify as many additional values as you like following the 'web' pattern below
    --   The key in this case 'web' is for healthcheck and to allow users to change its values
    --   'pattern':   Matched against the destination text see :h lua-pattern
    --   'icon':      Gets inlined before the link text
    --   'highlight': Optional highlight for the 'icon', uses fallback highlight if not provided
    custom = {
      web = { pattern = '^http', icon = '󰖟 ' },
      discord = { pattern = 'discord%.com', icon = '󰙯 ' },
      github = { pattern = 'github%.com', icon = '󰊤 ' },
      gitlab = { pattern = 'gitlab%.com', icon = '󰮠 ' },
      google = { pattern = 'google%.com', icon = '󰊭 ' },
      neovim = { pattern = 'neovim%.io', icon = ' ' },
      reddit = { pattern = 'reddit%.com', icon = '󰑍 ' },
      stackoverflow = { pattern = 'stackoverflow%.com', icon = '󰓌 ' },
      wikipedia = { pattern = 'wikipedia%.org', icon = '󰖬 ' },
      youtube = { pattern = 'youtube%.com', icon = '󰗃 ' },
    },
  },
  sign = {
    -- Turn on / off sign rendering
    enabled = true,
    -- Applies to background of sign text
    highlight = 'RenderMarkdownSign',
  },
  -- Mimic org-indent-mode behavior by indenting everything under a heading based on the
  -- level of the heading. Indenting starts from level 2 headings onward.
  indent = {
    -- Turn on / off org-indent-mode
    enabled = false,
    -- Additional modes to render indents
    render_modes = false,
    -- Amount of additional padding added for each heading level
    per_level = 2,
    -- Heading levels <= this value will not be indented
    -- Use 0 to begin indenting from the very first level
    skip_level = 1,
    -- Do not indent heading titles, only the body
    skip_heading = false,
  },
})

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)
