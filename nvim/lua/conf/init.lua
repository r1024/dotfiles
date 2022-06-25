local ends_with = function(str, ending)
  return ending == "" or str:sub(- #ending) == ending
end

local M = {}

M.setup = function()
  -- config nvim plugins
  local config_dir = vim.fn.stdpath('config') .. '/lua/conf'
  -- plugins do not need to load
  local unload_plugins = {
    "init", -- we don't need to load init again
    "nvim-lsp-installer",
    "vim-translator",
    "vim-interestingwords",
    "vim-bookmarks",
  }
  -- make sure you call the require("nvim-lsp-installer").setup() function before you set up any servers!
  local status_ok, _ = pcall(require, "conf.nvim-lsp-installer")
  if not status_ok then
    vim.notify('Failed loading ' .. "nvim-lsp-installer", vim.log.levels.ERROR)
  end

  status_ok, _ = pcall(require, "conf.vim-translator")
  if not status_ok then
    vim.notify('Failed loading ' .. "vim-translator", vim.log.levels.ERROR)
  end

  status_ok, _ = pcall(require, "conf.vim-interestingwords")
  if not status_ok then
    vim.notify('Failed loading ' .. "vim-interestingwords", vim.log.levels.ERROR)
  end

  status_ok, _ = pcall(require, "conf.vim-bookmarks")
  if not status_ok then
    vim.notify('Failed loading ' .. "vim-bookmarks", vim.log.levels.ERROR)
  end

  local helper_set = {}
  for _, v in pairs(unload_plugins) do
    helper_set[v] = true
  end
  for _, fname in pairs(vim.fn.readdir(config_dir)) do
    if not ends_with(fname, ".lua") then
      goto skip_to_next
    end
    local cut_suffix_fname = fname:sub(1, #fname - #'.lua')
    if helper_set[cut_suffix_fname] == nil then
      status_ok, _ = pcall(require, cut_suffix_fname)
      if not status_ok then
        vim.notify('Plugin ' .. cut_suffix_fname .. ' is not installed!', vim.log.levels.ERROR)
        goto skip_to_next
      end

      local file = "conf." .. cut_suffix_fname
      status_ok, _ = pcall(require, file)
      if not status_ok then
        vim.notify('Failed loading ' .. fname, vim.log.levels.ERROR)
      end
    end
    ::skip_to_next::
  end
end

M.setup()
