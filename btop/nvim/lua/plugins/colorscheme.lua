return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  {
  "folke/tokyonight.nvim",
  opts = {
    transparent = true,
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
  },
},
  { "catppuccin/nvim"},
  {"rebelot/kanagawa.nvim"},
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
}
