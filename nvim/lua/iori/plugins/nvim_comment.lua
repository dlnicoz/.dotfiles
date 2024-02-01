return {
  "terrortylor/nvim-comment",
  dependencies = {
    ---
    -- your dependencies
    ---
  },
  config = function()
    require("nvim_comment").setup({
      line_mapping = "<leader>cl",
      operator_mapping = "<leader>c",
      comment_chunk_text_object = "ic",
      comment_empty = false,
    })
  end,
}
