vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

require('gitsigns').setup()
require('mini.indentscope').setup()
require('ibl').setup({
  exclude = {
    filetypes = {
      'help',
      'startify',
      'aerial',
      'alpha',
      'dashboard',
      'packer',
      'neogitstatus',
      'NvimTree',
      'neo-tree',
      'Trouble',
    },
    buftypes = {
      'nofile',
      'terminal',
    },
  },
  show_trailing_blankline_indent = false,
  use_treesitter = true,
  show_current_context = true,
  use_treesitter_scope = true,
})

-- require("ibl").setup {
--     space_char_blankline = " ",
--     show_current_context = false,
--     show_end_of_line = true,
--     -- show_current_context = true,
--     -- show_current_context_start = true,
--     config_exclude_buftypes = {"terminal"},
--     exclude = {
--         buftypes = {"terminal",},
--         filetypes = {
--             "dashboard",
--              "neo-tree",
--             "help",
--             "packer",
--             "nvim-Tree",
--             "Trouble",
--             "vimwiki",
--             "man",
--             "gitmessengerpopup",
--             "diagnosticpopup",
--             "lspinfo",
--       "help",
--       "alpha",
--       "dashboard",
--       "neo-tree",
--       "Trouble",
--       "lazy",
--       "mason",
--       "notify",
--       "toggleterm",
--       "lazyterm",
--             "packer",
--             "checkhealth",
--             "TelescopePrompt",
--             "TelescopeResults",
--             "",
--          },
--     }
-- }
