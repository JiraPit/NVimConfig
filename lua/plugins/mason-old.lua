return {
  { "mason-org/mason.nvim", version = "^1.0.0" },
  {
    "mason-org/mason-lspconfig.nvim",
    version = "^1.0.0",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      automatic_enable = {
        -- Prevent rust-analyzer from being automatically enabled
        -- So that we can use rust.lua plugin instead
        exclude = { "rust_analyzer", "rust-analyzer" },
      },
    },
  },
}
