return {
  'dgox16/oldworld.nvim',
  lazy = false,
  priority = 1000,
  -- terminal_colors = true, -- enable terminal colors
  -- variant = 'default', -- default, oled, cooler
  config = function()
    require('oldworld').setup {
      terminal_colors = true,
      variant = 'oled',
    }

    vim.cmd.colorscheme 'oldworld'
  end,
}
