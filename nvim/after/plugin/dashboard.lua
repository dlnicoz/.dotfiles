local cmd = vim.cmd

require('dashboard').setup({
    preview_file_height = 11,
    preview_file_width = 70,
    session_directory = "/home/iori/.config/nvim/session",
    theme = 'hyper',
    hide = { statusline, tabline },
    disable_move = true,
    config = {
        header =   {
	 	"",
	 	"",
	 	"",
	--  	"",
	--  	"",
	-- "",
	-- " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
	-- " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
	-- " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
	-- " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
	-- " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
	-- " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
	--  	"",
	--  	"",
	--  	"",
	--  	"",
	--  	"",
	-- "",
	-- " [ TIP: To exit Neovim, just power off your computer. ] ",
	"",
    '',
    '⣿⠟⣽⣿⣿⣿⣿⣿⢣⠟⠋⡜⠄⢸⣿⣿⡟⣬⢁⠠⠁⣤⠄⢰⠄⠇⢻⢸',
    '⢏⣾⣿⣿⣿⠿⣟⢁⡴⡀⡜⣠⣶⢸⣿⣿⢃⡇⠂⢁⣶⣦⣅⠈⠇⠄⢸⢸',
    '⣹⣿⣿⣿⡗⣾⡟⡜⣵⠃⣴⣿⣿⢸⣿⣿⢸⠘⢰⣿⣿⣿⣿⡀⢱⠄⠨⢸',
    '⣿⣿⣿⣿⡇⣿⢁⣾⣿⣾⣿⣿⣿⣿⣸⣿⡎⠐⠒⠚⠛⠛⠿⢧⠄⠄⢠⣼',
    '⣿⣿⣿⣿⠃⠿⢸⡿⠭⠭⢽⣿⣿⣿⢂⣿⠃⣤⠄⠄⠄⠄⠄⠄⠄⠄⣿⡾',
    '⣼⠏⣿⡏⠄⠄⢠⣤⣶⣶⣾⣿⣿⣟⣾⣾⣼⣿⠒⠄⠄⠄⡠⣴⡄⢠⣿⣵',
    '⣳⠄⣿⠄⠄⢣⠸⣹⣿⡟⣻⣿⣿⣿⣿⣿⣿⡿⡻⡖⠦⢤⣔⣯⡅⣼⡿⣹',
    '⡿⣼⢸⠄⠄⣷⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣕⡜⡌⡝⡸⠙⣼⠟⢱⠏',
    '⡇⣿⣧⡰⡄⣿⣿⣿⣿⡿⠿⠿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣋⣪⣥⢠⠏⠄',
    '⣧⢻⣿⣷⣧⢻⣿⣿⣿⡇⠄⢀⣀⣀⡙⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠂⠄⠄',
    '⢹⣼⣿⣿⣿⣧⡻⣿⣿⣇⣴⣿⣿⣿⣷⢸⣿⣿⣿⣿⣿⣿⣿⣿⣰⠄⠄⠄',
    '⣼⡟⡟⣿⢸⣿⣿⣝⢿⣿⣾⣿⣿⣿⢟⣾⣿⣿⣿⣿⣿⣿⣿⣿⠟⠄⡀⡀',
    '⣿⢰⣿⢹⢸⣿⣿⣿⣷⣝⢿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠛⠉⠄⠄⣸⢰⡇',
    '⣿⣾⣹⣏⢸⣿⣿⣿⣿⣿⣷⣍⡻⣛⣛⣛⡉⠁⠄⠄⠄⠄⠄⠄⢀⢇⡏⠄',
    '',
	 	"",
	 	"",
	        },
        center = {
            {
		icon = "  ",
		desc = "Recent sessions                         ",
		shortcut = "SPC s l",
		action = "SessionLoad",
	},
	{
		icon = "  ",
		desc = "Find recent files                       ",
		action = "Telescope oldfiles",
		shortcut = "SPC f r",
	},
	{
		icon = "  ",
		desc = "Find files                              ",
		action = "Telescope find_files find_command=rg,--hidden,--files",
		shortcut = "SPC f f",
	},
	{
		icon = "  ",
		desc = "File browser                            ",
		action = "Telescope file_browser",
		shortcut = "SPC f b",
	},
	{
		icon = "  ",
		desc = "Find word                               ",
		action = "Telescope live_grep",
		shortcut = "SPC f w",
	},
	{
		icon = "  ",
		desc = "Load new theme                          ",
		action = "Telescope colorscheme",
		shortcut = "SPC h t",
	},
            -- {icon = '        ', desc = 'Last Session  ', action = 'silent source ~/.config/nvim/cache/Session.vim'},
            -- {icon = '        ', desc = 'Find File     ', action = 'Telescope find_files cwd=~/ hidden=true'},
            -- {icon = '        ', desc = 'Recent Files  ', action = 'Telescope oldfiles'},
        },
        footer = {
            "", " If I'm using Neovim, then my Emacs config must be broken!"
        },
    },
})

cmd([[highlight DashboardFooter     guifg=#89ddff]])
cmd([[highlight DashboardHeader     guifg=#c3e88d]])
cmd([[highlight DashboardDesc       guifg=#82aaff]])
cmd([[highlight DashboardKey        guifg=#82aaff]])
cmd([[highlight DashboardIcon       guifg=#82aaff]])


-- Disable statusline on dashboard
cmd([[
if has("autocmd")
    au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if &filetype == "dashboard" | set laststatus=0 noruler | else | set laststatus=2 | endif
endif
]])
