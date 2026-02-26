return {
    {
        "zbirenbaum/copilot.lua",
        config = function()
            require("copilot").setup({
                copilot_model = "gpt-41-copilot",
                suggestion = { enabled = false },
                panel = { enabled = false },
                -- panel = {
                --   enabled = true,
                --   auto_refresh = true,
                --   keymap = {
                --     jump_prev = "<Up>",
                --     jump_next = "<Down>",
                --     accept = "<CR>",
                --   },
                --   layout = {
                --     position = "right",
                --     ratio = 0.4,
                --   },
                -- },
            })
        end,
    },

    -- This block turns on copilot-cmp and adds it to nvim-cmp sources
    {
        "zbirenbaum/copilot-cmp",
        config = function()
            require("copilot_cmp").setup({})
            local cmp = require("cmp")
            local source = cmp.get_config().sources

            -- Check if the source is nil
            if source == nil then
                source = {}
            end

            -- Insert the copilot source at the end of the sources
            table.insert(source, { name = "copilot", group_index = 1 })
            cmp.setup({
                sources = source,
            })
        end,
    },
}
