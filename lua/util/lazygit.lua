-- Lazygit integration
function _G.open_lazygit()
    vim.cmd("term lazygit")
    vim.cmd("startinsert")
    vim.wo.number = false -- Disable line numbers
    vim.wo.relativenumber = false -- Disable relative line numbers
end

vim.api.nvim_create_autocmd("TermClose", {
    pattern = "term://*lazygit*",
    callback = function()
        vim.wo.number = true -- Re-enable line numbers
        vim.wo.relativenumber = true -- Re-enable relative line numbers
        vim.cmd("bdelete!") -- Close the buffer
    end,
})

vim.api.nvim_set_keymap('n', '<leader>gg', '<Cmd>lua open_lazygit()<CR>', { noremap = true, silent = true })
