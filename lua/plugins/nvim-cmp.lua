return {
  -- Use <tab> for completion and snippets (supertab)
  -- first: disable default <tab> and <s-tab> behavior in LuaSnip
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  -- then: setup supertab in cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        -- User tab to confirm completion
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm({ select = true })
          else
            fallback()
          end
        end, { "i", "s" }),
        -- Use <S-Tab> to jump to next snippet's placeholder
        ["<S-Tab>"] = cmp.mapping(function(_)
          if cmp.visible() == false and luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            cmp.complete()
          end
        end, { "i", "s" }),
        -- Disable Enter for completion
        ["<CR>"] = function(fallback)
          fallback()
        end,
      })
    end,
  },
}
