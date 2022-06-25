local _, which_key = pcall(require, "which-key")

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<Space>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  ["?"] = {"<cmd>Telescope keymaps<cr>", "show keybindings"},
  b = {
    name = "buffers",
    ["b"] = {"<cmd>Telescope buffers theme=ivy<cr>", "buffer switch"},
    ["d"] = {"<cmd>bd<cr>", "buffer delete"},
    ["D"] = {"<cmd>%bd|e#<CR>", "Close Other Buffers" },
    ["u"] = {"<cmd>UndotreeToggle<cr>", "undotree"},
    ["s"] = {"<cmd>Telescope grep_string search_dirs=% path_display='hidden' theme=ivy<cr>", "search current word"},
    ["f"] = {"<cmd>Telescope current_buffer_fuzzy_find theme=ivy<cr>", "fzf search"},
    ["o"] = {"<cmd>SymbolsOutline<cr>", "list all symbols"},
  },

  f = {
    name = "files",
    ["e"] = {"<cmd>lua require('utils').nvim_tree_toggle()<cr>", "file explore"},
    ["f"] = {"<cmd>lua require('utils').find_files()<cr>", "file find"},
    ["F"] = {"<cmd>lua vim.lsp.buf.formatting()<cr>", "file format"},
    ["h"] = {"<cmd>DiffviewFileHistory<cr>", "file history"},
  },
  h = {
    name = "help",
    ["m"] = {"<cmd>Telescope man_pages theme=ivy<cr>", "man page"},
    ["t"] = {"<cmd>Telescope help_tags theme=ivy<cr>", "tags"},
    ["c"] = {"<cmd>Telescope commands theme=ivy<cr>", "commands"},
    ["k"] = {"<cmd>Telescope keymaps theme=ivy<cr>", "Keymaps"},
  },
  l = {
    name = "lsp",
    ["i"] = {"<cmd>LspInstall<cr>", "install lsp"},
  },
  m = {
    name = "mark",
    ["m"] = {"<cmd>BookmarkToggle<cr>", "bookmark set/unset"},
    ["a"] = {"<cmd>BookmarkShowAll<cr>", "bookmark show all"},
    ["i"] = {"<cmd>BookmarkAnnotate<cr>", "bookmark edit comment"},
  },
  p = {
    name = "projects",
    ["s"] = {"<cmd>lua require('utils').grep_string()<cr>", "search current word"},
    ["S"] = {"<cmd>lua require('utils').live_grep()<cr>", "search word"},
    ["d"] = {"<cmd>DiffviewOpen<cr>", "view diff"},
  },
  s = {
    name = "session",
    ["s"] = {"<cmd>SessionManager load_session<cr>", "select and load session"},
    ["w"] = {"<cmd>SessionManager save_current_session<cr>", "save session"},
    ["D"] = {"<cmd>SessionManager delete_session<cr>", "delect and delete session"},
    ["d"] = {"<cmd>Telescope cscope goto_definition<cr>", "goto definition"},
    ["y"] = {"<cmd>Telescope cscope list_this_symbols<cr>", "find symbols"},
  },
  t = {
    name = "todo|trouble",
    ["t"] = {"<cmd>TodoQuickFix<cr>", "list todo"},
    ["T"] = {"<cmd>TroubleToggle<cr>", "list trouble"},
  },
  ["r"] = {"<cmd>Telescope registers<cr>", "show register"},
}

which_key.setup()
which_key.register(mappings, opts)

