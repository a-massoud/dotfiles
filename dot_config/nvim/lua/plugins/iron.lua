return {
  {
    "hkupty/iron.nvim",
    config = function()
      local iron = require("iron.core")
      local common = require("iron.fts.common")
      local view = require("iron.view")

      iron.setup({
        config = {
          scratch_repl = true,
          repl_definition = {
            sh = {
              command = { "zsh" },
            },
            python = {
              command = { "ipython", "--no-autoindent" },
              format = common.bracketed_paste,
              block_dividers = { "# %%", "#%%" },
              env = { PYTHON_BASIC_REPL = "1" }, --this is needed for python3.13 and up.
            },
          },
          repl_open_cmd = view.bottom(30),
        },
        keymaps = {
          send_motion = "<space>msc",
          visual_send = "<space>msc",
          send_file = "<space>msf",
          send_line = "<space>msl",
          send_mark = "<space>msm",
          send_code_block = "<space>msb",
          send_code_block_and_move = "<space>msn",
          mark_motion = "<space>mc",
          mark_visual = "<space>mc",
          remove_mark = "<space>md",
          cr = "<space>ms<cr>",
          interrupt = "<space>ms<space>",
          exit = "<space>msq",
          clear = "<space>mcl",
        },
        highlight = {
          italic = true,
        },
        ignore_blank_lines = true,
      })
      vim.keymap.set("n", "<space>mrs", "<cmd>IronRepl<cr>")
      vim.keymap.set("n", "<space>mrr", "<cmd>IronRestart<cr>")
      vim.keymap.set("n", "<space>mrf", "<cmd>IronFocus<cr>")
      vim.keymap.set("n", "<space>mrh", "<cmd>IronHide<cr>")
    end,
  },
}
