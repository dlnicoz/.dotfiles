local function map(m, k, v)
  vim.keymap.set(m, k, v, { silent = true })
end

map("n", "<leader>;", ":HopWordCurrentLineBC<CR>")
map("n", "<leader>j", ":HopWordAC<CR>")
map("n", "<leader>k", ":HopWordBC<CR>")
map("n", "<leader>l", ":HopWordCurrentLineAC<CR>")
-- map("n", "<leader>h", ":HopWordCurrentLineBC<CR>")

map("n", "<leader>e", "<CMD>:EslintFixAll<CR>")

map("n", "<leader>fr", "<CMD>Telescope oldfiles<CR>")
map("n", "<leader>ff", "<CMD>Telescope find_files<CR>")
map("n", "<leader>fb", "<CMD>Telescope file_browser<CR>")
map("n", "<leader>fw", "<CMD>Telescope live_grep<CR>")
map("n", "<leader>ht", "<CMD>Telescope colorscheme<CR>")

map("i", "jj", "<Esc>")

map("n", ";", "5j")
map("n", "'", "5k")

map("n", "<c-s>", ":w<CR>")
map("i", "<c-s>", "<Esc>:w<CR>a")

map("n", "MM", ":bnext<CR>")
map("n", "nn", ":bprevious<CR>")
map("n", "..", ":bd<CR>")

map("n", "<a-h>", "<C-w>h")
map("n", "<a-j>", "<C-w>j")
map("n", "<a-k>", "<C-w>k")
map("n", "<a-l>", "<C-w>l")

map("n", "<C-Right>", ":vertical resize +3<CR>")
map("n", "<C-Left>", ":vertical resize -3<CR>")
map("n", "<C-Up>", ":resize +3<CR>")
map("n", "<C-Down>", ":resize -3<CR>")

vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true })
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true })
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true })
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { silent = true })
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { silent = true })
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { silent = true })
