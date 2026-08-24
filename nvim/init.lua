--Plugins
vim.pack.add({
  {
    src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
    version = vim.version.range('3')
  },

  -- Neo-tree dependencies
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/MunifTanjim/nui.nvim" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },

  -- Additional Plugins
  { src = "https://github.com/metalelf0/black-metal-theme-neovim" }, -- Colorscheme
  { src = "https://github.com/ficd0/ashen.nvim" }, -- Colorscheme
  { src = "https://github.com/neovim/nvim-lspconfig" }, -- LSP
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" }
})

-- render-markdown.nvim
vim.pack.add({
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/nvim-mini/mini.nvim', 
    'https://github.com/MeanderingProgrammer/render-markdown.nvim',
})
require('render-markdown').setup({}) -- only mandatory if you want to set custom options

-- Options
vim.opt.number = true
vim.opt.relativenumber = true
vim.g.mapleader = " "

-- Colorscheme
require("ashen").load()

-- Set the main background to transparent
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "LineNr", { bg = "none" }) 
-- Lspconfig
vim.lsp.enable('ruff')


-- Treesitter
vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local ft = args.match
    local lang = vim.treesitter.language.get_lang(ft)
    if lang and vim.treesitter.language.add(lang) then
      pcall(vim.treesitter.start, args.buf, lang)
    end
  end,
})

-- Keybinds
vim.keymap.set('n', '<leader>s', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader><Tab>', ':Neotree toggle<CR>')


vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
