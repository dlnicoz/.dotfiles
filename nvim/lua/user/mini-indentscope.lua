return {
  "echasnovski/mini.indentscope",
  dependencies = {
    ---
    -- your dependencies
    ---
  },
  config = function()
    require("mini.indentscope").setup({

      exclude = {
        filetypes = {
          "help",
          "startify",
          "aerial",
          "alpha",
          "dashboard",
          "packer",
          "neogitstatus",
          "NvimTree",
          "neo-tree",
          "Trouble",
        },
        buftypes = {
          "nofile",
          "terminal",
        },
      },
    })
  end,
}


