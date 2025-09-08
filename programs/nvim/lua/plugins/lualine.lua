return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VeryLazy',
    cond = false,
    disable = true,
    opts = {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = '',
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_x = {'filetype'}
      }
    },
  },
}
