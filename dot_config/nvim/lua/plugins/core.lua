return {
  { "LazyVim/LazyVim", opts = { colorscheme = "catppuccin" } },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 10000,
    lazy = false,

    config = function(_, opts)
      require("catppuccin").setup(opts)

      -- Workaround for weird bufferline bug
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          vim.cmd.colorscheme("catppuccin")
        end,
      })
    end,
  },
}
