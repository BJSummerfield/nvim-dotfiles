-- Clear highlight search in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show [E]rror messages' })

-- Centers cursor while navigating
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('v', '<', '<gv') -- Shift Indentation to Left
vim.keymap.set('v', '>', '>gv') -- Shift Indentation to Right

--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Save Buffer', noremap = true, silent = true })
vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = 'Quit', noremap = true, silent = true })
vim.keymap.set('n', '<leader>c', ':bd<CR>', { desc = 'Close Buffer', noremap = true, silent = true })

vim.keymap.set('n', '<leader>W', ':w!<CR>', { desc = 'Hard Save Buffer', noremap = true, silent = true })
vim.keymap.set('n', '<leader>Q', ':q!<CR>', { desc = 'Hard Quit', noremap = true, silent = true })
vim.keymap.set('n', '<leader>C', ':bd!<CR>', { desc = 'Hard Close Buffer', noremap = true, silent = true })

-- Unbind the S key
vim.keymap.set({ 'n', 'x' }, 's', '<Nop>')
