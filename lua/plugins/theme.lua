return {
  -- Set colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "catppuccin-frappe",
      colorscheme = "nightfox",
    },
  },

  -- nightfox
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    name = "nightfox",
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
