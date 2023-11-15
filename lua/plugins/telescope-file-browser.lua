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
    vim.api.nvim_set_keymap(
      "n",
      "<leader>E",
      ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
      { noremap = true }
    )

    local fb_actions = require "telescope".extensions.file_browser.actions

    require("telescope").setup {
      extensions = {
        file_browser = {
          hijack_netrw = true,
          mappings = {
            ["i"] = {
              ["<C-a>"] = fb_actions.create,
              ["<C-d>"] = fb_actions.remove,
            },
            ["n"] = {
              ["<C-a>"] = fb_actions.create,
              ["<C-d>"] = fb_actions.remove,
            },
          },
        },
      },
    }
    require("telescope").load_extension "file_browser"
  end
}
