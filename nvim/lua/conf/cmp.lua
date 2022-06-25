local lspkind = require('lspkind')
local cmp = require('cmp')

require("luasnip.loaders.from_vscode").lazy_load()
require'luasnip'.filetype_extend("zsh", {"shell"})

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = {
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({
      select = true ,
      behavior = cmp.ConfirmBehavior.Replace
    }),
  },
  sources = cmp.config.sources({
    { name = 'buffer', option = {
      get_bufnrs = function()
        return vim.api.nvim_list_bufs()
      end
    } },
    { name = 'path' },
    { name = 'cmdline' },
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
  }),
  -- 使用lspkind-nvim显示类型图标
  formatting = {
    format = lspkind.cmp_format({
      with_text = true, -- do not show text alongside icons
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      before = function (entry, vim_item)
        -- Source 显示提示来源
        vim_item.menu = "["..string.upper(entry.source.name).."]"
        return vim_item
      end
    })
  },
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = {
    ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'c' }),
    ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'c' }),
    ['<CR>'] = cmp.mapping.confirm({
      select = true ,
      behavior = cmp.ConfirmBehavior.Replace
    }),
  },
  sources = ({
    { name = 'buffer' },
  }),
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = {
    ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'c' }),
    ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'c' }),
    ['<CR>'] = cmp.mapping.confirm({
      select = true ,
      behavior = cmp.ConfirmBehavior.Replace
    }),
  },
  sources = cmp.config.sources({
    { name = 'path' },
    { name = 'cmdline' },
  }),
})

