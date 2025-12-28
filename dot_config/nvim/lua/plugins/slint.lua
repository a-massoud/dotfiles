return {
  { "slint-ui/vim-slint" },
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "slint-lsp" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        slint_lsp = true,
      },
    },
  },
}
