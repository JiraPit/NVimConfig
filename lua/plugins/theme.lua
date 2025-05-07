return {
  -- Set colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-frappe",
    },
  },

  -- nightfox
  {
    "EdenEast/nightfox.nvim",
  },

  -- catppuccin
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    opts = {
      transparent_background = true,
    },
  },
}
