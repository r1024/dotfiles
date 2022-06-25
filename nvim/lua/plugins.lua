local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd [[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Speed packer
packer.init {
  git = {
    -- default_url_format = 'http://hub.nuaa.cf/%s'
    -- default_url_format = 'http://hub.fastgit.xyz/%s'
    -- default_url_format = 'http://github.com/%s'
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "rcarriga/nvim-notify" -- notify

  use "ellisonleao/gruvbox.nvim"
  use "lukas-reineke/indent-blankline.nvim" -- indent blankline
  use "kyazdani42/nvim-web-devicons" -- icons
  use "akinsho/bufferline.nvim" -- tab
  use "nvim-lualine/lualine.nvim" -- status line
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "ethanholz/nvim-lastplace" -- auto return back to the last modified positon when open a file

  -- Treesittetr
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

  use "kyazdani42/nvim-tree.lua"
  use "mbbill/undotree" -- undo
  use "ntpeters/vim-better-whitespace"

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }

  use "MattesGroeger/vim-bookmarks"
  use "tom-anders/telescope-vim-bookmarks.nvim"

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "j-hui/fidget.nvim" -- show lsp progress
  use "ray-x/lsp_signature.nvim" -- show function signature when typing

  -- Editor enhance
  use "terrortylor/nvim-comment"
  use "tpope/vim-repeat" -- command enhance
  use "tpope/vim-surround" -- vim surround
  use "r1024/neovim-session-manager" -- fork from "Shatur/neovim-session-manager"

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "hrsh7th/cmp-nvim-lsp" -- lsp client

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use
  -- lspkind
  use 'onsails/lspkind-nvim'

  use "folke/which-key.nvim" -- which key

  -- Git
  use "lewis6991/gitsigns.nvim"
  use "sindrets/diffview.nvim"

  use "kevinhwang91/nvim-bqf" -- better quick fix
  use "folke/todo-comments.nvim" -- todo comments
  use "simrat39/symbols-outline.nvim" -- outline
  use "folke/trouble.nvim"

  use "voldikss/vim-translator"
  use "mtdl9/vim-log-highlighting"

  use "lfv89/vim-interestingwords"
  use "r1024/telescope-cscope.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

