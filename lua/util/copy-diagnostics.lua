local function copy_diagnostic_to_clipboard()
  local diagnostics = vim.diagnostic.get(0, { lnum = vim.api.nvim_win_get_cursor(0)[1] - 1 })
  if #diagnostics > 0 then
    local diagnostic_message = diagnostics[1].message
    vim.fn.setreg('+', diagnostic_message)
    print('Diagnostic copied to clipboard')
  else
    print('No diagnostic to copy')
  end
end

vim.keymap.set('n', '<leader>dc', copy_diagnostic_to_clipboard, { desc = 'Copy diagnostic message to clipboard' })
