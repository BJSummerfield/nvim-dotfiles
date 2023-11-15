return {
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons"
  },

  config = function()
    vim.api.nvim_set_keymap(
      "n",
      "<leader>e",
      ":Telescope file_browser<CR>",
      { noremap = true }

    )
    -- You don't need to set any of these options.
    -- IMPORTANT!: this is only a showcase of how you can set default options!
    require("telescope").setup {
      extensions = {
        file_browser = {
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
        },
      },
    }
    -- To get telescope-file-browser loaded and working with telescope,
    -- you need to call load_extension, somewhere after setup function:
    require("telescope").load_extension "file_browser"
  end
}
