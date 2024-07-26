-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Copy diagnostics to clipboard
local function copy_all_diagnostics_to_clipboard()
  local bufnr = vim.api.nvim_get_current_buf()
  local lnum = vim.api.nvim_win_get_cursor(0)[1] - 1
  local diagnostics = vim.diagnostic.get(bufnr, { lnum = lnum })
  if #diagnostics > 0 then
    local diagnostic_messages = {}
    for _, diagnostic in ipairs(diagnostics) do
      table.insert(diagnostic_messages, diagnostic.message)
    end
    local all_diagnostics = table.concat(diagnostic_messages, '\n')
    vim.fn.setreg('+', all_diagnostics)
    print 'All diagnostics copied to clipboard'
  else
    print 'No diagnostics to copy'
  end
end

vim.keymap.set('n', '<leader>dc', copy_all_diagnostics_to_clipboard, { desc = 'Copy [D]iagnostics to [C]lipboard' })

-- Lazygit integration
function _G.open_lazygit()
  vim.cmd 'term lazygit'
  vim.cmd 'startinsert'
  vim.wo.number = false -- Disable line numbers
  vim.wo.relativenumber = false -- Disable relative line numbers
end

vim.api.nvim_create_autocmd('TermClose', {
  pattern = 'term://*lazygit*',
  callback = function()
    vim.wo.number = true -- Re-enable line numbers
    vim.wo.relativenumber = true -- Re-enable relative line numbers
    vim.cmd 'bdelete!' -- Close the buffer
  end,
})

vim.api.nvim_set_keymap('n', '<leader>gg', '<Cmd>lua open_lazygit()<CR>', { desc = 'Open Lazygit', noremap = true, silent = true })
