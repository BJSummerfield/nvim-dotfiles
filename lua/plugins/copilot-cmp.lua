return {
  'zbirenbaum/copilot-cmp',
  config = function()
    require('copilot').setup {
      suggestion = { enabled = false },
      panel = { enabled = false },
      fix_pairs = true,
    }
    require('copilot_cmp').setup()
  end,
}
