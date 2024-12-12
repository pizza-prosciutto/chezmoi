local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')
Plug('neovim/nvim-lspconfig')           -- lsp configs
Plug('nvim-lua/plenary.nvim')           -- telescope dependency
Plug('nvim-treesitter/nvim-treesitter') -- telescope dependency
Plug('nvim-telescope/telescope.nvim')   -- fuzzy search
Plug('vim-airline/vim-airline')         -- statusbar
Plug('preservim/nerdtree')              -- tree explorer
Plug('folke/tokyonight.nvim')           -- theme
vim.call('plug#end')

require'lspconfig'.yamlls.setup{
  settings = {
    redhat = {
      telemetry = {
        enabled = false
      }
    },
    yaml = {
      format = {
        true
      },
      validate = true,
      completion = true
    }
  }
}

require'lspconfig'.jsonls.setup {
  settings = {
    json = {
      validate = { enable = true }
    }
  }
}

-- Various options
local indent = 2
vim.opt.tabstop = indent        -- Number of spaces that a <Tab> in the file counts for
vim.opt.shiftwidth = indent     -- Number of spaces to use for auto-indenting
vim.opt.expandtab = true        -- Use spaces instead of tabs
vim.opt.softtabstop = indent    -- Number of spaces a <Tab> key inserts
vim.opt.number = true           -- Display line numbers
vim.opt.mouse = a               -- Enable mouse

-- Key bindings
vim.keymap.set("n", "<C-e>", ":NERDTreeToggle<CR>", { noremap = true, silent = true})

-- Autoclose
vim.api.nvim_set_keymap('i', '"', '""<left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', "'", "''<left>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '(', '()<left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '{', '{}<left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '[', '[]<left>', { noremap = true, silent = true })

-- Tab navigation
vim.api.nvim_set_keymap('n', '<C-t>', ':tabnew<CR>', { noremap = true, silent = true })

-- Theme
vim.cmd[[colorscheme tokyonight-storm]]
