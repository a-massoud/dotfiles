return {
  {
    "neovim/nvim-lspconfig",
    -- @require("lspconfig").
    opts = {
      servers = {
        qmlls = {
          cmd = { "qmlls6" }
        },
      },
    },
  },
}
