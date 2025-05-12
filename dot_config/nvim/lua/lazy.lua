-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
if vim.g.vscode then
  require('lazy').setup({
    -- import all plugins --
    require 'plugins.mini',
    require 'plugins.comment',
    require 'plugins.gruvbox',
    require 'plugins.lazydev',
    -- use when working with hex code colors
    -- require 'plugins.nvim-colorizer',
    -- require("plugins.nvim-treesitter"),
    require 'plugins.which-key',
    require 'plugins.todo-comments',
  }, {
    ui = {
      -- If you are using a Nerd Font: set icons to an empty table which will use the
      -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
      icons = vim.g.have_nerd_font and {} or {
        cmd = '⌘',
        config = '🛠',
        event = '📅',
        ft = '📂',
        init = '⚙',
        keys = '🗝',
        plugin = '🔌',
        runtime = '💻',
        require = '🌙',
        source = '📄',
        start = '🚀',
        task = '📌',
        lazy = '💤 ',
      },
    },
  })
else
  require('lazy').setup({

    -- import all plugins --
    require 'plugins.alpha',
    require 'plugins.autopairs',
    require 'plugins.cmp',
    -- require 'plugins.go',
    require 'plugins.mini',
    require 'plugins.neogit',
    require 'plugins.neo-tree',
    require 'plugins.lualine',
    require 'plugins.debug',
    require 'plugins.chezmoi',
    -- require 'plugins.clangd_extensions',
    require 'plugins.cmp',
    require 'plugins.comment',
    require 'plugins.gitsigns',
    require 'plugins.gruvbox',
    require 'plugins.indent_line',
    require 'plugins.lazydev',
    require 'plugins.markdown-preview',
    require 'plugins.neominimap',
    -- use when working with hex code colors
    -- require 'plugins.nvim-colorizer',
    require 'plugins.nvim-jqx',
    require 'plugins.nvim-lspconfig',
    require 'plugins.nvim-treesitter',
    require 'plugins.nvim-ufo',
    require 'plugins.ft-python.f-string-toggle',
    require 'plugins.telescope',
    require 'plugins.which-key',
    require 'plugins.todo-comments',

    -- imports all plugins
    -- { import = 'plugins' },
  }, {
    ui = {
      -- If you are using a Nerd Font: set icons to an empty table which will use the
      -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
      icons = vim.g.have_nerd_font and {} or {
        cmd = '⌘',
        config = '🛠',
        event = '📅',
        ft = '📂',
        init = '⚙',
        keys = '🗝',
        plugin = '🔌',
        runtime = '💻',
        require = '🌙',
        source = '📄',
        start = '🚀',
        task = '📌',
        lazy = '💤 ',
      },
    },
  })
end
