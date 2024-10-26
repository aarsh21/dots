return {
  { "datsfilipe/vesper.nvim" },
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      transparent_mode = true,
      terminal_colors = true, -- add
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
      },
      contrast = "hard",
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    opts = {
      style = "night",
      transparent = true,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = { bold = true, italic = true },
        sidebars = "transparent", -- style for sidebars, see below
        floats = "transparent", -- style for floating windows
      },
      lualine_bold = true,
    },
  },
  {
    "catppuccin/nvim",
    opts = {
      transparent_background = true,
      flavour = "mocha",
      comments = { "italic" }, -- Change the style of comments
      conditionals = { "italic" },
      loops = { "italic" },
      functions = { "bold" },
      -- keywords = {},
      -- strings = {},
      -- variables = {},
      -- numbers = {},
      -- booleans = {},
      -- properties = {},
      -- types = {},
      operators = { "bold" },
      sidebars = "dark",
      floats = "dark",
      -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    default_integrations = true,
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      treesitter = true,
      notify = true,
    },
  },
  {
    "rebelot/kanagawa.nvim",
    opts = {
      undercurl = true, -- enable undercurls
      commentStyle = { italic = true },
      functionStyle = { italic = true },
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = true, -- do not set background color
      dimInactive = false, -- dim inactive window `:h hl-NormalNC`
      terminalColors = true,
    },
  },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vesper",
    },
  },
}
