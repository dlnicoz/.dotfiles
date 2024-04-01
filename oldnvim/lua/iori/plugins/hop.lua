require("hop").setup()

return {
  "phaazon/hop.nvim",
  as = "hop",
  dependencies = {},
  config = function()
    local opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_set_keymap
    keymap("", "L", ":HopWordCurrentLine<cr>", { silent = true })
    -- keymap("", "S", ":HopChar2<cr>", { silent = true })
    -- keymap("", "Q", ":HopPattern<cr>", { silent = true })
    keymap("", "H", ":HopChar2<cr>", { silent = true })

    keymap(
      "o",
      "f",
      ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<CR>",
      opts
    )
    keymap(
      "o",
      "F",
      ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<CR>",
      opts
    )
    keymap(
      "o",
      "t",
      ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<CR>",
      opts
    )
    keymap(
      "o",
      "T",
      ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<CR>",
      opts
    )

    keymap(
      "n",
      "f",
      ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<CR>",
      opts
    )
    keymap(
      "n",
      "F",
      ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<CR>",
      opts
    )
    keymap(
      "n",
      "t",
      ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<CR>",
      opts
    )
    keymap(
      "n",
      "T",
      ":lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<CR>",
      opts
    )
  end,
}

--   return {
-- "echasnovski/mini.indentscope",
--     dependencies = {
--       ---
--       -- your dependencies
--       ---
--     },
--     config = function()
--       ---
--       -- the code to configure the plugin
--       ---
--     end
--   }
