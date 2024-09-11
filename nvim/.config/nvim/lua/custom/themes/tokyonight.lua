return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  cond = nil,
  config = function()
    require('tokyonight').setup {
      style = 'storm',
      transparent = true,
      styles = {
        sidebars = 'dark',
        floats = 'dark',
      },
    }
    vim.cmd [[colorscheme tokyonight]]
  end,
}
