local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
      end,
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    },
    {
        'nvim-tree/nvim-web-devicons',
        config = function()
            require('nvim-web-devicons').setup {
                default = true;
            }
        end
    },
    -- the colorscheme should be available when starting Neovim
    {
        'asperan/chstr.nvim',
        -- Load aduring startup if is the main colorscheme
        lazy = false,
        -- Load before all the other start plugins
        priority = 1000,
        dependencies = 'rktjmp/lush.nvim',
        -- Set the coloscheme to 'chstr'
        config = function()
            vim.cmd.colorscheme("chstr")
        end
    },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
    },
    {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        opts = {
          -- See `:help gitsigns.txt`
          signs = {
            add = { text = '+' },
            change = { text = '~' },
            delete = { text = '_' },
            topdelete = { text = '‾' },
            changedelete = { text = '~' },
          },
          on_attach = function(bufnr)
            vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk, { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
            vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk, { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
            vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[P]review [H]unk' })
          end,
        },
    },
    {
        -- Add indentation guides even on blank lines
        'lukas-reineke/indent-blankline.nvim',
        -- Enable `lukas-reineke/indent-blankline.nvim`
        -- See `:help indent_blankline.txt`
        main = "ibl",
        opts = {
          indent = {
                char = '┊'
          },
        },
    },
    { 'numToStr/Comment.nvim', opts = {} },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = {
          'nvim-treesitter/nvim-treesitter-textobjects',
        },
        config = require("plugin.treesitter").config
    },
    {
        -- Set lualine as statusline
        'nvim-lualine/lualine.nvim',
        -- See `:help lualine.txt`
        opts = {
            options = {
                icons_enabled = false,
                theme = 'auto',
                component_separators = '|',
                section_separators = '',
            },
        },
    },
    {
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        dependencies = {
          -- Snippet Engine & its associated nvim-cmp source
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',

            -- Adds LSP completion capabilities
            'hrsh7th/cmp-nvim-lsp',

            -- Add Buffer completion capabilities
            'hrsh7th/cmp-buffer',

            -- Adds a number of user-friendly snippets
            'rafamadriz/friendly-snippets',
        },
        config = true,
    },
    {
        -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            { 'williamboman/mason.nvim', config = true },
            'williamboman/mason-lspconfig.nvim',
            'WhoIsSethDaniel/mason-tool-installer.nvim',

            -- Useful status updates for LSP
            -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
            { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

            -- Additional lua configuration, makes nvim stuff amazing!
            'folke/neodev.nvim',
        },
    },
    { 'mbbill/undotree', config = require("plugin.undotree").config },
    {
        'ur4ltz/surround.nvim',
        config = function()
            require("surround").setup({mapping_style = "surround"})
        end,
    },
    {
        'vidocqh/auto-indent.nvim',
        opts = {
            indentexpr = function(lnum)
                return require("nvim-treesitter.indent").get_indent(lnum)
            end
        },
    },
    {
        'mfussenegger/nvim-lint',
    }
})
