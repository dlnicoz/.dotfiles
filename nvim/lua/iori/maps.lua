local function map(m, k, v)
	vim.keymap.set(m, k, v, { silent = true })
end


-- formating using nullls

-- Keybindings for telescope
map("n", "<leader>fr", "<CMD>Telescope oldfiles<CR>")
map("n", "<leader>ff", "<CMD>Telescope find_files<CR>")
map("n", "<leader>fb", "<CMD>Telescope file_browser<CR>")
map("n", "<leader>fw", "<CMD>Telescope live_grep<CR>")
map("n", "<leader>ht", "<CMD>Telescope colorscheme<CR>")


map("i","jj","<Esc>")

map("n",";","5j")
map("n","'","5k")

-- map("n","gff",":Files<cr>")

map("n","mm",":bnext<CR>")
map("n","nn",":bprevious<CR>")
map("n","..",":bd<CR>")

-- the prime agen

map("n","Y","y$")
map("n","Y","y$")
map("n","n","nzzzv")
map("n","N","Nzzzv")
map("n","J","mzJ`z")

-- easy navigation between buffers

map("n","<a-h>","<C-w>h")
map("n","<a-j>","<C-w>j")
map("n","<a-k>","<C-w>k")
map("n","<a-l>","<C-w>l")

map("n","<C-Right>",":vertical resize +3<CR>")
map("n","<C-Left>",":vertical resize -3<CR>")
map("n","<C-Up>",":resize +3<CR>")
map("n","<C-Down>",":resize -3<CR>")


map("v","<C-c>",'"+yi')
-- copy and paste with system
-- map("n","<leader>p","+p")
-- map("v","<leader>p","+p")
-- map("n","<leader>P","+P")
-- map("v","<leader>P","+P")
-- map("i","<leader>y","*y")
map("v","<leader>y","y$")
-- map("n","<leader>Y","+y$")
-- nnoremap <leader>p "+p
-- vnoremap <leader>p "+p
-- nnoremap <leader>P "+P
-- vnoremap <leader>P "+P
-- nnoremap <leader>y "+y
-- vnoremap <leader>y +y
