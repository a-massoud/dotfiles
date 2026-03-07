return {
  {
    "lervag/vimtex",
    init = function()
      vim.g.vimtex_view_general_viewer = "zathura"
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_syntax_conceal_disable = 1
    end,
  },
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "texlab" } },
  },
  {
    "stevearc/conform.nvim",
    --@type require("conform").setupOpts
    opts = {
      formatters_by_ft = {
        tex = { "latexindent" },
      },
      formatters = {
        latexindent = {
          prepend_args = { "-rv", "-y\"defaultIndent:'  '\"", "-m" },
        },
      },
    },
  },
}
