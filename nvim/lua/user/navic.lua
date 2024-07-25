-- local M = {
--   "SmiteshP/nvim-navic",
-- }
--
-- function M.config()
--   local kinds = {
--     Array = " ",
--     Boolean = " ",
--     Class = " ",
--     Color = " ",
--     Constant = " ",
--     Constructor = " ",
--     Enum = " ",
--     EnumMember = " ",
--     Event = " ",
--     Field = " ",
--     File = " ",
--     Folder = "󰉋 ",
--     Function = " ",
--     Interface = " ",
--     Key = " ",
--     Keyword = " ",
--     Method = " ",
--     -- Module = " ",
--     Module = " ",
--     Namespace = " ",
--     Null = "󰟢 ",
--     Number = " ",
--     Object = " ",
--     Operator = " ",
--     Package = " ",
--     Property = " ",
--     Reference = " ",
--     Snippet = " ",
--     String = " ",
--     Struct = " ",
--     Text = " ",
--     TypeParameter = " ",
--     Unit = " ",
--     Value = " ",
--     Variable = " ",
--   }
--
--   local icons = require "user.icons"
--
--   require("nvim-navic").setup {
--     icons = kinds,
--     highlight = true,
--     lsp = {
--       auto_attach = true,
--     },
--     click = true,
--     separator = " " .. icons.ui.ChevronRight .. " ",
--     depth_limit = 0,
--     depth_limit_indicator = "..",
--   }
-- end
--
-- return M
navic.setup {
  icons = {
    File = "󰈙 ",
    Module = " ",
    Namespace = "󰌗 ",
    Package = " ",
    Class = "󰌗 ",
    Method = "󰆧 ",
    Property = " ",
    Field = " ",
    Constructor = " ",
    Enum = "󰕘",
    Interface = "󰕘",
    Function = "󰊕 ",
    Variable = "󰆧 ",
    Constant = "󰏿 ",
    String = "󰀬 ",
    Number = "󰎠 ",
    Boolean = "◩ ",
    Array = "󰅪 ",
    Object = "󰅩 ",
    Key = "󰌋 ",
    Null = "󰟢 ",
    EnumMember = " ",
    Struct = "󰌗 ",
    Event = " ",
    Operator = "󰆕 ",
    TypeParameter = "󰊄 ",
  },
  lsp = {
    auto_attach = false,
    preference = nil,
  },
  highlight = false,
  separator = " > ",
  depth_limit = 0,
  depth_limit_indicator = "..",
  safe_output = true,
  lazy_update_context = false,
  click = false,
  format_text = function(text)
    return text
  end,
}
