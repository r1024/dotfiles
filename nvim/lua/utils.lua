local ends_with = function(str, ending)
  return ending == "" or str:sub(- #ending) == ending
end

local M = {}
local diffview_is_running = 0

M.Exit = function()
  if diffview_is_running then
    vim.cmd [[DiffviewClose]]
    vim.cmd [[bd]]
    diffview_is_running = 0
  end
end

M.DiffviewOpen = function()
  vim.cmd [[DiffviewOpen]]
  diffview_is_running = 1
end

M.DiffviewFileHistory = function()
  vim.cmd [[DiffviewFileHistory]]
  diffview_is_running = 1
end

M.find_files = function()
  local smart_search_path = vim.fn.fnamemodify(vim.fn.finddir('.git', '.;'), ":p:h")
  if ends_with(smart_search_path, ".git") then
    smart_search_path = vim.fn.fnamemodify(smart_search_path, ":h")
  end
  if smart_search_path then
    -- vim.fn.execute("Telescope find_files cwd=" .. smart_search_path .. " search_dirs=" .. smart_search_path .. " theme=ivy", "")
    vim.fn.execute("Telescope find_files cwd=" .. smart_search_path .. " theme=ivy", "")
  else
    vim.fn.execute("Telescope find_files theme=ivy", "")
  end
end

-- Searches for the string under your cursor
M.grep_string = function()
  local smart_search_path = vim.fn.fnamemodify(vim.fn.finddir('.git', '.;'), ":p:h")
  if ends_with(smart_search_path, ".git") then
    smart_search_path = vim.fn.fnamemodify(smart_search_path, ":h")
  end
  if smart_search_path then
    vim.fn.execute("Telescope grep_string cwd=" .. smart_search_path .. " search_dirs=" .. smart_search_path .. " word_match=-w" .. " theme=ivy", "")
  else
    vim.fn.execute("Telescope grep_string theme=ivy", "")
  end
end

M.live_grep = function()
  local smart_search_path = vim.fn.fnamemodify(vim.fn.finddir('.git', '.;'), ":p:h")
  if ends_with(smart_search_path, ".git") then
    smart_search_path = vim.fn.fnamemodify(smart_search_path, ":h")
  end
  if smart_search_path then
    vim.fn.execute("Telescope live_grep cwd=" .. smart_search_path .. " search_dirs=" .. smart_search_path .. " theme=ivy", "")
  else
    vim.fn.execute("Telescope live_grep theme=ivy", "")
  end
end

M.nvim_tree_toggle = function()
  local smart_root_path = vim.fn.fnamemodify(vim.fn.finddir('.git', '.;'), ":p:h")
  if ends_with(smart_root_path, ".git") then
    smart_root_path = vim.fn.fnamemodify(smart_root_path, ":h")
  end

  require ('nvim-tree').toggle(false, false, smart_root_path)
end

return M
