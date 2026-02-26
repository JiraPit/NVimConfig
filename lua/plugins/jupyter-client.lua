return {
  {
    "geg2102/nvim-jupyter-client",
    config = function()
      require("nvim-jupyter-client").setup({})
    end,
  },

  {
    "Vigemus/iron.nvim",
    config = function()
      local iron = require("iron.core")
      local view = require("iron.view")
      local common = require("iron.fts.common")

      iron.setup({
        config = {
          -- Whether a repl should be discarded or not
          scratch_repl = true,
          -- Your repl definitions come here
          repl_definition = {
            sh = {
              -- Can be a table or a function that
              -- returns a table (see below)
              command = { "bash" },
            },
            python = {
              command = { "python3" }, -- or { "ipython", "--no-autoindent" }
              format = common.bracketed_paste_python,
              block_dividers = { "# %%", "#%%" },
              env = { PYTHON_BASIC_REPL = "1" }, --this is needed for python3.13 and up.
            },
          },
          -- set the file type of the newly created repl to ft
          -- bufnr is the buffer id of the REPL and ft is the filetype of the
          -- language being used for the REPL.
          repl_filetype = function(bufnr, ft)
            return ft
            -- or return a string name such as the following
            -- return "iron"
          end,
          -- Send selections to the DAP repl if an nvim-dap session is running.
          dap_integration = true,
          -- How the repl window will be displayed
          -- See below for more information
          -- repl_open_cmd = view.bottom(40),

          -- repl_open_cmd can also be an array-style table so that multiple
          -- repl_open_commands can be given.
          -- When repl_open_cmd is given as a table, the first command given will
          -- be the command that IronRepl initially toggles.
          -- Moreover, when repl_open_cmd is a table, each key will automatically
          -- be available as a keymap (see keymaps below) with the names
          -- toggle_repl_with_cmd_1, ..., toggle_repl_with_cmd_k
          -- For example,
          --
          repl_open_cmd = {
            view.split.vertical.rightbelow("%30"), -- cmd_1: open a repl to the right
            view.split.vertical.rightbelow("%100"), -- cmd_2: open a repl to the right
          },
        },
        -- Iron doesn't set keymaps by default anymore.
        -- You can set them here or manually add keymaps to the functions in iron.core
        keymaps = {
          -- toggle_repl = "<space>rr", -- toggles the repl open and closed.
          -- If repl_open_command is a table as above, then the following keymaps are
          -- available
          toggle_repl_with_cmd_1 = "<space>rr",
          toggle_repl_with_cmd_2 = "<space>rf",
          restart_repl = "<space>rR", -- calls IronRestart to restart the repl
          send_motion = "<space>sc",
          visual_send = "<space>sc",
          send_file = "<space>sf",
          send_line = "<space>sl",
          send_paragraph = "<space>sp",
          send_until_cursor = "<space>su",
          send_mark = "<space>sm",
          send_code_block = "<space>sb",
          send_code_block_and_move = "<space>sn",
          mark_motion = "<space>mc",
          mark_visual = "<space>mc",
          remove_mark = "<space>md",
          cr = "<space>s<cr>",
          interrupt = "<space>s<space>",
          exit = "<space>sq",
          clear = "<space>cl",
        },
        -- If the highlight is on, you can change how it looks
        -- For the available options, check nvim_set_hl
        highlight = {
          italic = true,
        },
        ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
      })

      -- iron also has a list of commands, see :h iron-commands for all available commands
      -- vim.keymap.set("n", "<space>rf", "<cmd>IronFocus<cr>")
      -- vim.keymap.set("n", "<space>rh", "<cmd>IronHide<cr>")
    end,
  },
} -- return {
--   {
--     "benlubas/molten-nvim",
--     version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
--     dependencies = { "3rd/image.nvim" },
--     build = ":UpdateRemotePlugins",
--     init = function()
--       -- these are examples, not defaults. Please see the readme
--       vim.g.molten_image_provider = "image.nvim"
--       vim.g.molten_output_win_max_height = 20
--       vim.g.molten_virt_text_output = true
--       vim.g.molten_auto_open_output = false
--     end,
--   },
--   {
--     "3rd/image.nvim",
--     opts = {
--       backend = "kitty", -- whatever backend you would like to use
--       max_width = 100,
--       max_height = 12,
--       max_height_window_percentage = math.huge,
--       max_width_window_percentage = math.huge,
--       window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
--       window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
--     },
--   },
--   {
--     "quarto-dev/quarto-nvim",
--     dependencies = {
--       "jmbuhr/otter.nvim",
--       "nvim-treesitter/nvim-treesitter",
--       "benlubas/molten-nvim",
--     },
--     require("quarto").setup({
--       codeRunner = {
--         enabled = true,
--         default_method = "molten",
--         ft_runners = { python = "molten" },
--         never_run = { "yaml" },
--       },
--     }),
--     init = function()
--       local wk = require("which-key")
--       local runner = require("quarto.runner")
--       local quarto = require("quarto")
--
--       wk.add({
--         { "<leader>j", group = "jupyter", icon = { icon = "", color = "blue" } },
--
--         { "<leader>jA", runner.run_all, desc = "All Cells" },
--         { "<leader>ja", runner.run_above, desc = "Cell and Above" },
--         { "<leader>jc", runner.run_cell, desc = "Cell" },
--         { "<leader>jl", runner.run_line, desc = "Line" },
--
--         { "<leader>jp", quarto.quartoPreview, desc = "Open Preview" },
--         { "<leader>jq", quarto.quartoClosePreview, desc = "Close Preview" },
--
--         { "<leader>jd", ":MoltenLoad<cr>", desc = "Load Molten State" },
--         -- { "<leader>jc", create_kernel_from_conda, desc = "Create Kernel" },
--         { "<leader>js", ":MoltenSave<cr>", desc = "Save Molten State" },
--         { "<leader>ji", ":MoltenInit<cr>", desc = "Init Molten" },
--         { "<leader>jD", ":MoltenDeinit<cr>", desc = "Deinit Molten" },
--         { "<leader>jI", ":MoltenImagePopup<cr>", desc = "Show Image" },
--         { "<leader>jo", ":MoltenShowOutput<cr>", desc = "Show Output" },
--         { "<leader>jv", "<cmd>VenvSelect<cr>", desc = "Select LSP Env" },
--       })
--     end,
--   },
--   {
--     "GCBallesteros/jupytext.nvim",
--     config = true,
--     -- Depending on your nvim distro or config you may need to make the loading not lazy
--     -- lazy=false,
--   },
-- }
