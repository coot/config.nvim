vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

local aerial = require('aerial')
vim.keymap.set('n', '<F2>', ":Neotree<CR>")
vim.keymap.set('n', '<F3>', function()
                              aerial.toggle({focus = true, direction = "right"})
                              -- close imports
                              aerial.tree_close({index = 1, fold = false})
                            end)

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]resume' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Terminal
local function term()
  local Terminal = require('toggleterm.terminal').Terminal
  local terminal = Terminal:new()
  terminal:toggle()
end
vim.api.nvim_create_user_command('Term', term, {})

vim.api.nvim_set_keymap('n', 'gy', ':%y<CR>', {})
-- vim.api.nvim_del_keymap('n', 'Y')

vim.api.nvim_set_keymap('n', 'gs', ':%s/', {})
vim.api.nvim_set_keymap('x', 'gs', ':%s/', {})

-- cw doesn't include the white space after the word (:help cw):
vim.api.nvim_set_keymap('n', '&', ':&&<CR>', {})

vim.api.nvim_set_keymap('n', 'cw', 'dwi', {})

-- Terminal maps
-- `<leader>t` is set in `toggleterm` setup in `init.lua`
-- vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>ToggleTerm direction=horizontal<CR><cmd>startinsert<CR>", {noremap = true, silent = true})
-- vim.api.nvim_set_keymap("n", "<leader>v", "<cmd>ToggleTerm direction=vertical<CR><cmd>startinsert<CR>", {noremap = true, silent = true})
-- vim.api.nvim_set_keymap("n", "<leader>f", "<cmd>ToggleTerm direction=float<CR><cmd>startinsert<CR>", {noremap = true, silent = true})

vim.api.nvim_set_keymap('t', [[<c-\>]], [[<c-\><c-n>]], {noremap = true})
vim.api.nvim_set_keymap('t', '<A-r>', [['<C-\><C-N>"'.nr2char(getchar()).'pi']], {expr = true, noremap = true})
vim.api.nvim_set_keymap('t', '<C-W>', [['<C-\><C-N><C-W>'.nr2char(getchar())]], {expr = true, noremap = true})
vim.api.nvim_set_keymap('t', '<C-Y>', [[<C-\><C-N><C-Y>]], {noremap = true})
vim.api.nvim_set_keymap('t', '<C-b>', [[<C-\><C-N><C-b>]], {noremap = true})

local g = vim.g
g.m = '\\v^(\\<{7}|\\|{7}|\\>{7}|\\={7})(\\s|$)@='
vim.g = g

return {}
