return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local s = " "
        for e, n in pairs(diagnostics_dict) do
          local sym = e == "error" and " " or (e == "warning" and " " or "")
          s = s .. n .. sym
        end
        return s
      end,
      -- indicators = {
      --   style = "underline"
      -- }
      -- mode = "tabs",
      -- separator_style = "padded_slant",
      -- show_close_icon = "true",
      -- show_buffer_close_icons = "true",
    },
  },
}

-- return {
--   "akinsho/bufferline.nvim",
--   event = "VeryLazy",
--   keys = {
--     { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
--     { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
--   },
--   opts = {
--     options = {
--       mode = "tabs",
--       -- separator_style = "slant",
--       show_buffer_close_icons = false,
--       show_close_icon = false,
--     },
--   },
-- }
