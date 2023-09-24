vim.o.expandtab = true

-- vim.o.fileencoding = 'ucs-bom,utf-8,iso-8859-2,default,latin1'
vim.o.encoding = 'utf-8'
vim.o.termencoding = 'utf-8'

vim.o.autowrite = true
vim.o.autoread = true
vim.o.isfname = '@,48-57,/,.,-,_,+,,,#,$,%,~'
vim.o.listchars = 'tab:▸ ,eol:$,trail:░,nbsp:-'

vim.o.wildmenu = true
vim.o.wildmode = 'longest:full,full'
vim.o.completeopt = 'menu'
vim.o.tagcase = 'match'

vim.o.showfulltag = true
vim.o.ruler = true
vim.o.showcmd = true
vim.o.showmode = false
vim.o.showbreak = '>\\'
vim.o.cole = 2
vim.o.virtualedit = 'block'
vim.o.deisplay = 'lastline'

vim.o.notimeout = true
vim.o.ttimeout = true
vim.o.ttimeoutlen = 10

-- vim.o.cpo = 'aABceFs_/'
vim.o.cm = 'blowfish2'

vim.o.cmdheight = 2
vim.o.helphight = 25

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true
vim.o.breakindentop = 'shift:2'

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 750

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

vim.o.background = 'dark'

vim.o.cdpath = ',~/src,~/clients/iog'
vim.o.suffixes = vim.o.suffixes .. ',.pyc,.hi'
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.srolloff = 1
vim.o.sidesrolloff = 5
vim.o.startofline = false
vim.o.shortmess = vim.o.shortmess .. 'mr'
vim.o.spelllang = 'en_gb,pl'
vim.o.spelloptions = 'noplainbuffer,camel'
vim.o.textwidth = 78
vim.o.linebreak = true
vim.o.formatoptions = vim.o.formatoptions .. '1'

vim.o.softtabstop = -1
vim.o.shiftwidth = 2

vim.o.number = false
vim.o.rnu = false

vim.o.grepprg = "rg --vimgrep --with-filename"

return {}
