-- Various options
--
local indent = 4
vim.opt.tabstop = indent        -- Number of spaces that a <Tab> in the file counts for
vim.opt.shiftwidth = indent     -- Number of spaces to use for auto-indenting
vim.opt.expandtab = true        -- Use spaces instead of tabs
vim.opt.softtabstop = indent    -- Number of spaces a <Tab> key inserts
vim.opt.smartindent = true      -- Smart indentation (C-like languages)
vim.opt.autoindent = true       -- Auto indentation (copy indent from previous line)

vim.opt.number = true           -- Display line numbers
vim.opt.mouse = a               -- Enable mouse

vim.opt.ignorecase = true       -- Ignore case when searching
vim.opt.incsearch = true        -- Show search results while typing
vim.opt.smartcase = true        -- Override ignorecase if search contains uppercase

vim.cmd('colorscheme wildcharm')  -- Set theme

vim.opt.list = true             -- Display hidden characters
vim.opt.listchars = {
  tab = '→ ',
  trail = '·',
  extends = '⟩',
  precedes = '⟨',
}
