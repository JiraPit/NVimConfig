return {
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
  init = function()
    -- Only disable default visual mappings to avoid conflict with <leader>s
    -- and to remove the default 'S' mapping.
    vim.g.nvim_surround_no_visual_mappings = true
  end,
  config = function()
    require("nvim-surround").setup({})

    -- Visual mode mapping
    -- See `:h nvim-surround.keymaps`
    vim.keymap.set("x", "<leader>s", "<Plug>(nvim-surround-visual)", {
      desc = "Add a surrounding pair around a visual selection",
    })
  end,
}
