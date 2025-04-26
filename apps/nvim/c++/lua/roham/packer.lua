-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
--vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
 use 'wbthomason/packer.nvim'
 use {
      'numToStr/Comment.nvim',
       config = function()
          require('Comment').setup()
       end
  }

 use {
    "hrsh7th/nvim-cmp",
    requires = { "hrsh7th/cmp-nvim-lsp" }
 }

 use {
	'nvim-telescope/telescope.nvim',tag = '0.1.8',
 	requires = { {'nvim-lua/plenary.nvim'} }
 }

 use({
	"rose-pine/neovim",
	name= "rose-pine",
	config= function()
		vim.cmd("colorscheme rose-pine")
	end
 })

 use {
     'nvim-treesitter/nvim-treesitter',
     run = function()
         local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
         ts_update()
     end,
 }

 use('theprimeagen/harpoon')
 use('mbbill/undotree')
 use('tpope/vim-fugitive')
 use('neoclide/coc.nvim')

 use {
	'VonHeikemen/lsp-zero.nvim',
	requires= {
		{'neovim/nvim-lspconfig'},
 	}
 }
  use {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = function()
          require("nvim-autopairs").setup {}
      end
  }

  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  })

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use("karb94/neoscroll.nvim")
  use "elihunter173/dirbuf.nvim"
end)
