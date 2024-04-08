return {
  "neovim/nvim-lspconfig",

  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "nvimdev/lspsaga.nvim",
    "shellRaining/hlchunk.nvim",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require "lspconfig"

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require "cmp_nvim_lsp"

    local keymap = vim.keymap -- for conciseness

    local opts = { noremap = true, silent = true }
    local on_attach = function(client, bufnr)
      opts.buffer = bufnr

      -- set keybinds
      opts.desc = "Show LSP references"
      keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

      opts.desc = "Go to declaration"
      keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

      opts.desc = "Show LSP definitions"
      keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

      opts.desc = "Show LSP implementations"
      keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

      opts.desc = "Show LSP type definitions"
      keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

      opts.desc = "See available code actions"
      keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

      opts.desc = "Smart rename"
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

      opts.desc = "Show buffer diagnostics"
      keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

      opts.desc = "Show line diagnostics"
      keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

      opts.desc = "Go to previous diagnostic"
      keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

      opts.desc = "Go to next diagnostic"
      keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

      opts.desc = "Show documentation for what is under cursor"
      keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

      opts.desc = "Restart LSP"
      keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- configure html server
    lspconfig["html"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- lspsaga ----------------------------------------------------
    require("lspsaga").setup {
      symbol_in_winbar = {
        enable = true,
      },
      ui = {
        code_action = "",
      },
    }

    -- configure typescript server with plugin
    lspconfig["tsserver"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- configure css server
    lspconfig["cssls"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- configure tailwindcss server
    lspconfig["tailwindcss"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- configure svelte server
    lspconfig["svelte"].setup {
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)

        vim.api.nvim_create_autocmd("BufWritePost", {
          pattern = { "*.js", "*.ts" },
          callback = function(ctx)
            if client.name == "svelte" then
              client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
            end
          end,
        })
      end,
    }

    -- configure prisma orm server
    lspconfig["prismals"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- configure graphql language server
    lspconfig["graphql"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
    }

    -- configure emmet language server
    lspconfig["emmet_ls"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
    }

    -- configure python server
    lspconfig["pyright"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- configure lua server (with special settings)
    lspconfig["lua_ls"].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = { -- custom settings for lua
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand "$VIMRUNTIME/lua"] = true,
              [vim.fn.stdpath "config" .. "/lua"] = true,
            },
          },
        },
      },
    }
  end,
}

-- local M = {
--   "neovim/nvim-lspconfig",
--   event = { "BufReadPre", "BufNewFile" },
--   dependencies = {
--     {
--       "folke/neodev.nvim",
--       "nvimdev/lspsaga.nvim",
--       "shellRaining/hlchunk.nvim",
--     },
--   },
-- }

-- local function lsp_keymaps(bufnr)
--   local opts = { noremap = true, silent = true }
--   local keymap = vim.api.nvim_buf_set_keymap
--   keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
--   keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
--   -- keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
--   vim.keymap.set("n", "K", function()
--     local winid = require("ufo").peekFoldedLinesUnderCursor()
--     if not winid then
--       vim.lsp.buf.hover()
--     end
--   end)
--   keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
--   keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
--   keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
-- end

-- M.on_attach = function(client, bufnr)
--   lsp_keymaps(bufnr)

--   if client.supports_method "textDocument/inlayHint" then
--     vim.lsp.inlay_hint.enable(bufnr, true)
--   end
-- end

-- M.toggle_inlay_hints = function()
--   local bufnr = vim.api.nvim_get_current_buf()
--   vim.lsp.inlay_hint.enable(bufnr, not vim.lsp.inlay_hint.is_enabled(bufnr))
-- end

-- function M.common_capabilities()
--   local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
--   if status_ok then
--     return cmp_nvim_lsp.default_capabilities()
--   end

--   local capabilities = vim.lsp.protocol.make_client_capabilities()
--   capabilities.textDocument.completion.completionItem.snippetSupport = true
--   capabilities.textDocument.completion.completionItem.resolveSupport = {
--     properties = {
--       "documentation",
--       "detail",
--       "additionalTextEdits",
--     },
--   }
--   capabilities.textDocument.foldingRange = {
--     dynamicRegistration = false,
--     lineFoldingOnly = true,
--   }

--   return capabilities
-- end

-- function M.config()
--   local wk = require "which-key"
--   wk.register {
--     ["<leader>la"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
--     ["<leader>lf"] = {
--       "<cmd>lua vim.lsp.buf.format({async = true, filter = function(client) return client.name ~= 'typescript-tools' end})<cr>",
--       "Format",
--     },
--     ["<leader>li"] = { "<cmd>LspInfo<cr>", "Info" },
--     ["<leader>lj"] = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
--     ["<leader>lh"] = { "<cmd>lua require('user.lspconfig').toggle_inlay_hints()<cr>", "Hints" },
--     ["<leader>lk"] = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
--     ["<leader>ll"] = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
--     ["<leader>lq"] = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
--     ["<leader>lr"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
--   }

--   wk.register {
--     ["<leader>la"] = {
--       name = "LSP",
--       a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action", mode = "v" },
--     },
--   }

--   local lspconfig = require "lspconfig"
--   local icons = require "user.icons"

--   require("lspsaga").setup {
--     symbol_in_winbar = {
--       enable = true,
--     },
--     ui = {
--       code_action = "",
--     },
--   }
--   local servers = {
--     "lua_ls",
--     "cssls",
--     "html",
--     -- "tsserver",
--     "astro",
--     -- "pyright",
--     "bashls",
--     "lemminx",
--     "jsonls",
--     "yamlls",
--     "marksman",
--     "tailwindcss",
--     "eslint",
--     "taplo",
--     -- "rust_analyzer",
--   }

--   local default_diagnostic_config = {
--     signs = {
--       active = true,
--       values = {
--         { name = "DiagnosticSignError", text = icons.diagnostics.Error },
--         { name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
--         { name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
--         { name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
--       },
--     },
--     virtual_text = false,
--     update_in_insert = false,
--     underline = true,
--     severity_sort = true,
--     float = {
--       focusable = true,
--       style = "minimal",
--       border = "rounded",
--       source = "always",
--       header = "",
--       prefix = "",
--     },
--   }

--   vim.diagnostic.config(default_diagnostic_config)

--   for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {}) do
--     vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
--   end

--   vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
--   vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
--   require("lspconfig.ui.windows").default_options.border = "rounded"

--   for _, server in pairs(servers) do
--     local opts = {
--       on_attach = M.on_attach,
--       capabilities = M.common_capabilities(),
--     }

--     local require_ok, settings = pcall(require, "user.lspsettings." .. server)
--     if require_ok then
--       opts = vim.tbl_deep_extend("force", settings, opts)
--     end

--     if server == "lua_ls" then
--       require("neodev").setup {}
--     end

--     lspconfig[server].setup(opts)
--   end
-- end

-- return M
