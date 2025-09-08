return {
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    require("mini.pairs").setup(
    {
      modes = { insert = true, command = false, terminal = false },
      mappings = {
        ['"'] = { action = 'open', pair = '""', neigh_pattern = '[^\\].', register = { cr = false } },
        ["'"] = { action = 'open', pair = "''", register = { cr = false } },
        ['`'] = { action = 'open', pair = '``', register = { cr = false } },
        ['('] = { action = 'open', pair = '()', register = { cr = false } },
        ['['] = { action = 'open', pair = '[]', register = { cr = false } },
        ['{'] = { action = 'open', pair = '{}', register = { cr = false } },
      }
    })
  end
}
