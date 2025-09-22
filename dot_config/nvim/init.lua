vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "tpope/vim-surround",
  "echasnovski/mini.pairs",
  "tpope/vim-commentary",
  "tpope/vim-repeat",
  "tpope/vim-speeddating",
  "tpope/vim-unimpaired",
  "farmergreg/vim-lastplace",
  { "catppuccin/nvim", name = "catppuccin", lazy = false, priority = 1000 },
  "junegunn/vim-easy-align",
  "vim-scripts/utl.vim",
})

-- pairs
require("mini.pairs").setup()

-- basic editing options
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.formatoptions = "croqnj"
vim.opt.joinspaces = false
vim.opt.textwidth = 80
vim.opt.scrolloff = 5
vim.opt.title = true
vim.opt.titlelen = 0
vim.opt.fixeol = false
vim.opt.delcombine = true
vim.opt.spell = false
vim.opt.spelllang = "en_us,es_mx,fr,cjk"

-- search options
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- swap files
vim.opt.swapfile = true

-- display
vim.opt.encoding = "utf-8"
vim.opt.ruler = true
vim.opt.laststatus = 2
vim.opt.showmatch = true
vim.opt.matchtime = 0
vim.opt.showmode = true
vim.opt.wildmenu = true
vim.opt.number = true
vim.opt.relativenumber = false

-- syntax
vim.opt.cursorline = true
-- vim.opt.bg = "light"
vim.env["NVIM_TUI_ENABLE_TRUE_COLOR"] = "1"
if vim.fn.has("termguicolors") then
  vim.opt.termguicolors = true
end
require("catppuccin").setup({
  flavour = "auto",
  background = {
    light = "latte",
    dark = "mocha",
  },
  integrations = {
    notify = true,
    cmp = true,
    dap = true,
    dap_ui = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
        ok = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
        ok = { "underline" },
      },
      inlay_hints = {
        background = true,
      },
    },
    nvimtree = true,
    treesitter = true,
    telescope = { enabled = true },
    noice = true,
    overseer = true,
  },
})
vim.cmd("colorscheme catppuccin")

-- F2 to toggle search highlighting
vim.api.nvim_set_keymap("", "<F2>", "<cmd>nohl<CR>", { noremap = true })
vim.api.nvim_set_keymap("i", "<F2>", "<Esc><cmd>nohl<CR>a", { noremap = true })

-- F5 to switch rl
vim.api.nvim_set_keymap("", "<F5>", "<cmd>set rl!<CR>", { noremap = true })
vim.api.nvim_set_keymap("i", "<F5>", "<Esc><cmd>set rl!<CR>a", { noremap = true })

-- F5 to switch arab
vim.api.nvim_set_keymap("", "<F6>", "<cmd>set arab!<CR>", { noremap = true })
vim.api.nvim_set_keymap("i", "<F6>", "<Esc><cmd>set arab!<CR>a", { noremap = true })

-- vim-easy-align
vim.api.nvim_set_keymap("x", "ga", "<Plug>(EasyAlign)", { noremap = true })
vim.api.nvim_set_keymap("n", "ga", "<Plug>(EasyAlign)", { noremap = true })
