local M = {
  "nvimtools/none-ls.nvim",
}

function M.config()
  local null_ls = require "null-ls"

  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics -- to setup linters

  local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

  null_ls.setup {
    debug = true,
    sources = {

      formatting.prettier.with {
        extra_filetypes = { "svelte" },
      }, -- js/ts formatter
      formatting.stylua, -- lua formatter
      formatting.isort,
      formatting.black,
      diagnostics.pylint,
      -- diagnostics.eslint_d.with({ -- js/ts linter
      --   condition = function(utils)
      --     return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs" }) -- only enable if root has .eslintrc.js or .eslintrc.cjs
      --   end,
      -- }),
      -- formatting.prettier.with {
      --   extra_filetypes = { "toml" },
      --   -- extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
      -- },
      -- formatting.eslint,
      -- null_ls.builtins.diagnostics.eslint,
      null_ls.builtins.completion.spell,
    },
  }
end

return M
