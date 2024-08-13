return {
  'scottmckendry/cyberdream.nvim',
  lazy = false,
  config = function()
    require('cyberdream').setup {
      transparent = true,
      terminal_colors = true,
      italic_comments = true,
      hide_fillchars = false,
      borderless_telescope = true,
      extensions = {
        telescope = true,
      },
    }

    vim.cmd.colorscheme 'cyberdream'
  end,
}
