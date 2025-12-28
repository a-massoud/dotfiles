return {
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "ltex-ls-plus" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ltex_plus = {
          settings = {
            ltex = {
              checkFrequency = "save",
              language = "en-US",
              additionalRules = {
                enablePickyRules = true,
                motherTongue = "en",
              },
              disabledRules = { fr = { "FRENCH_WHITESPACE" } },
              languageToolHttpServerUri = "http://localhost:8081/",
            },
          },
        },
      },
    },
  },
  {
    "barreiroleo/ltex_extra.nvim",
    branch = "dev",
    dependencies = { "neovim/nvim-lspconfig" },
    opts = {
      load_langs = { "en-US", "fr", "es", "ar" },
    },
  },
  {
    "lervag/vimtex",
    init = function()
      vim.g.vimtex_view_general_viewer = "zathura"
      vim.g.vimtex_view_method = "zathura"
    end,
  },
}
