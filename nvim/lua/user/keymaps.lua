-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "J", "mzJ`z")

keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

keymap.set("i", "<C-c>", "<Esc>")

-- next greatest remap ever : asbjornHaland
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

-- keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")

keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/short.txt<CR>")
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

keymap.set("n", "zR", "ufo.openAllFolds")
keymap.set("n", "zM", "ufo.closeAllFolds")

keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

keymap.set("n", "<leader>w", ":lua vim.wo.wrap = not vim.wo.wrap<CR>")
keymap.set("n", "<leader>r", "<cmd>CellularAutomaton make_it_rain<CR>")
keymap.set("n", "<leader>o", "<cmd>CellularAutomaton game_of_life<CR>")

local function map(m, k, v)
  vim.keymap.set(m, k, v, { silent = true })
end

-- map <C-v> "+p
-- vnoremap <C-c> "+y
map("v", "<C-c>", '"+y')
map("n", "<C-v>", '"+P')
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
vim.api.nvim_set_option("clipboard", "unnamed")
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true })
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true })
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true })
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { silent = true })
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { silent = true })
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { silent = true })
