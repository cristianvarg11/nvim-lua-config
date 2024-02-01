-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  ------------ Telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
	use 'olacin/telescope-cc.nvim' -- Integration with conventional commits
	use 'xiyaowong/telescope-emoji' -- Emojis! :D
	use 'LukasPietzschmann/telescope-tabs' -- To switch tabs

	------------- AI
	use {
		'Exafunction/codeium.vim',
		config = function ()
			-- Change '<C-g>' here to any keycode you like.
			vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
			vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
			vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
			vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
		end
	}

  ------------ Colorschemes
  use({ 'rose-pine/neovim', as = 'rose-pine' })
	use { "catppuccin/nvim", as = "catppuccin" }
	use { "ellisonleao/gruvbox.nvim" }


	------------ Treesitter
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use('nvim-treesitter/playground')

	------------ Highlight
	use('valloric/matchtagalways')

	------------ Autopair
	use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
	}

	------------- NerdTree
	use('preservim/nerdtree')
	use('vwxyutarooo/nerdtree-devicons-syntax')
	use('ryanoasis/vim-devicons')

	-------------- Tmux navigator
	use('christoomey/vim-tmux-navigator')

	-------------- LSP
	use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{                                      -- Optional
				'williamboman/mason.nvim',
				run = function()
					pcall(vim.cmd, 'MasonUpdate')
				end,
			},
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'L3MON4D3/LuaSnip'},     -- Required
		}
	}

	--------------- Prettier
	use('neovim/nvim-lspconfig')
	use('jose-elias-alvarez/null-ls.nvim')
	use('MunifTanjim/prettier.nvim')

	--------------- LuaLine
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}

	--------------- Emmet
	use('mattn/emmet-vim')


	--------------- Comment
	use {
			'numToStr/Comment.nvim',
			config = function()
					require('Comment').setup()
			end
	}
	use('JoosepAlviste/nvim-ts-context-commentstring')

	--------------- Images
	use {'edluffy/hologram.nvim'}
end)
