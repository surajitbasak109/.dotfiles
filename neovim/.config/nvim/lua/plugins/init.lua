-- Packer
local fn = vim.fn
local execute = vim.api.nvim_command

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
        'git',
        'clone',
        'https://github.com/wbthomason/packer.nvim',
        install_path,
    })
    -- vim.cmd("autocmd VimEnter * PackerSync")
end

local packer = require('packer');

packer.init {
    display = {
        open_fn = function()
            return require('packer.util').float { border = 'single' }
        end,
    },
}

packer.startup({
    function(use)
        -- Packer itself
        use 'wbthomason/packer.nvim'

        -- WhichKey - displays a popup with possible key bindings of the command you started typing
        -- Which key is that? Which-key!
        use {
            'folke/which-key.nvim',
            config = function()
                require 'plugins.config.which-key'
            end,
        }

        -- Distraction free editing
        use {
            "folke/zen-mode.nvim",
            config = function()
                require 'plugins.config.zen-mode'
            end
        }

        -- dims inactive portions of the code you're editing using TreeSitter.
        use {
            'folke/twilight.nvim',
            config = function()
                require 'plugins.config.twilight'
            end
        }

        -- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
        use({
            "folke/noice.nvim",
            config = function()
                require 'plugins.config.noice'
            end,
            requires = {
                -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
                "MunifTanjim/nui.nvim",
                -- OPTIONAL:
                --   `nvim-notify` is only needed, if you want to use the notification view.
                --   If not available, we use `mini` as the fallback
                "rcarriga/nvim-notify",
            }
        })

        -- a simple lua plugin for automated session management.
        use({
            "folke/persistence.nvim",
            event = "BufReadPre", -- this will only start session saving when an actual file was opened
            module = "persistence",
            config = function()
                require("persistence").setup({
                    options = { "buffers", "curdir", "tabpages", "winsize", "help" },
                })
            end,
        })

        use {
            "folke/trouble.nvim",
            cmd = { "TroubleToggle", "Trouble" },
            config = function()
                require("trouble").setup({
                    auto_open = false,
                    use_diagnostic_signs = true, -- en
                })
            end,
        }

        -- A better annotation generator. Supports multiple languages and annotation conventions.
        use {
            "danymat/neogen",
            config = function()
                require("neogen").setup({ snippet_engine = "luasnip" })
            end,
        }

        -- A tree like view for symbols in Neovim using the Language Server Protocol.
        -- Supports all your favourite languages.
        use {
            "simrat39/symbols-outline.nvim",
            cmd = "SymbolsOutline",
            init = function()
                vim.keymap.set("n", "<leader>cs", "<cmd>SymbolsOutline<cr>", { desc = "Symbols Outline" })
            end,
            config = function()
                require("symbols-outline").setup()
            end,
        }

        use ({
            "ThePrimeagen/refactoring.nvim",
            init = function()
                -- prompt for a refactor to apply when the remap is triggered
                vim.keymap.set("v", "<leader>r",
                    function()
                        require("refactoring").select_refactor()
                    end,
                    { noremap = true, silent = true, expr = false } 
                )
            end,
            config = function()
                require("refactoring").setup({})
            end,
        })

        -- Simple winbar/statusline plugin that shows your current code context
        use {
            "SmiteshP/nvim-navic",
            config = function()
                vim.g.navic_silence = true
                require("nvim-navic").setup({ separator = " ", highlight = true, depth_limit = 5 })
            end,
        }

        -- Incremental LSP renaming based on Neovim's command-preview feature.
        use {
            "smjonas/inc-rename.nvim",
            cmd = "IncRename",
            config = function()
                require("inc_rename").setup()
            end,
        }

        ----------------------------------------------------------
        -- Telescope - A powerful fuzzy file finder and more... --
        ----------------------------------------------------------
        -- The big daddy
        use {
            'nvim-telescope/telescope.nvim', tag = '0.1.0',
            -- or                            , branch = '0.1.x',
            requires = {
                'nvim-lua/plenary.nvim',
                'nvim-lua/popup.nvim',
                'ahmedkhalf/project.nvim',
            },
            config = function()
                require 'plugins.config.telescope'
            end,
        }

        -- Telescope most recently used (extension)
        use({
            'nvim-telescope/telescope-frecency.nvim',
            requires = { 'tami5/sqlite.lua' },
        })

        -- Clipboard manager
        use({
            "AckslD/nvim-neoclip.lua",
            config = function()
                require('neoclip').setup({
                    enable_persistent_history = true,
                })
            end,
            requires = { 'tami5/sqlite.lua', module = 'sqlite' },
        })

        ------------------------------------------
        --                Themes                --
        ------------------------------------------
        use {{
            -- Tokyo Night
            'folke/tokyonight.nvim',
        }, {
            -- Nord
            'shaunsingh/nord.nvim',
        }, {
            -- Dracula
            'dracula/vim', as = 'dracula',
            config = function()
                vim.cmd[[colorscheme dracula]]
            end,
        }}

        ---------------- End of Themes ----------------

        -- Add fancy indent markers, which integrate nicely with treesitter
        -- and shows the current context
        use {
            "lukas-reineke/indent-blankline.nvim",
            config = function()
                require 'plugins.config.indent-blankline'
            end,
        }

        -- A blazing fast and easy to configure Neovim statusline written in Lua.
        use {{
            "nvim-lualine/lualine.nvim",
            config = function()
                require 'plugins.config.lualine'
            end,
            requires = {
                "arkav/lualine-lsp-progress",
                "kyazdani42/nvim-web-devicons",
                "rlch/github-notifications.nvim",
            },
        }, {
            'j-hui/fidget.nvim',
            after = 'lualine.nvim',
            config = function()
                require('fidget').setup()
            end,
        }}

        -- Highlight colours (sometimes, currently)
        use {
            "norcalli/nvim-colorizer.lua",
            config = function()
                require("colorizer").setup()
            end,
        }

        -- :w !sudo tee % > /dev/null
        use {
            "lambdalisue/suda.vim",
            cmd = { "SudaWrite", "SudaRead" },
        }

        -- Markdown preview
        use {
            "iamcco/markdown-preview.nvim",
            run = "cd app && yarn install",
            config = function()
                vim.g.mkdp_browser = "chrome"
            end,
        }

        use {
            "andymass/vim-matchup",
            event = "BufReadPost",
            config = function()
                vim.g.matchup_matchparen_offscreen = { method = "status_manual" }
            end,
        }

        use {
            "cshuaimin/ssr.nvim",
            -- Calling setup is optional.
            init = function()
                vim.keymap.set({ "n", "x" }, "<leader>sr", function()
                    require("ssr").open()
                end, { desc = "Structural Replace" })
            end,
        }

        use {
            "Wansmer/treesj",
            keys = "J",
            config = function()
                require("treesj").setup({ use_default_keymaps = false })
                vim.keymap.set("n", "J", "<cmd>TSJToggle<cr>")
            end,
        }

        ------------------------------------
        --          Navigation            --
        ------------------------------------

        -- A File Explorer For Neovim Written In Lua
        use {
            'nvim-tree/nvim-tree.lua',
            event = 'CursorHold',
            config = function()
                require 'plugins.config.nvim-tree'
            end,
        }

        -- Neoscroll: a smooth scrolling neovim
        use({
            'karb94/neoscroll.nvim',
            event = 'WinScrolled',
            config = function()
                require('neoscroll').setup({ hide_cursor = false })
            end,
        })

        -- Git integration for buffers
        use({
            'lewis6991/gitsigns.nvim',
            event = 'BufRead',
            config = function()
                require 'plugins.config.gitsigns'
            end,
        })

        -- Comment stuff out
        use { 'tpope/vim-commentary' }
        -- The git plugin so good, it should be illegal
        use { 'tpope/vim-fugitive', config = 'vim.g.fugitive_legacy_commands = 0' }
        -- GitHub extension for fugitive.vim
        use { 'tpope/vim-rhubarb' }
        --  Quoting/parenthesizing made simple
        use { "tpope/vim-surround" }

        -- A painless, powerful Vim auto-pair plugin.
        use {
            'tmsvg/pear-tree',
            config = function()
                vim.g.pear_tree_repeatable_expand = 0
                vim.g.pear_tree_smart_backspace = 1
            end,
        }

        -- Find the enemy and replace them with dark power.
        use {
            'nvim-pack/nvim-spectre'
        }

        -- A snazzy bufferline for Neovim
        use {
            'akinsho/bufferline.nvim',
            tag = "v3.*",
            requires = 'nvim-tree/nvim-web-devicons',
            config = function()
                require('bufferline').setup()
            end
        }

        ----------------------------------------------
        --          Language Server Protcol         --
        --              Autocompletion              --
        --          Syntax Highlighting             --
        --          Linting and Formatting          --
        ----------------------------------------------

        -- Nvim Treesitter configurations and abstraction layer
        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            config = function ()
                require 'plugins.config.treesitter'
            end
        }

        -- Quickstart configs for Nvim LSP (Language Server Protocol)
        use {
            'neovim/nvim-lspconfig',
            requires = {
                "williamboman/nvim-lsp-installer", -- Installs servers within neovim
                "onsails/lspkind-nvim",            -- adds vscode-like pictograms to neovim built-in lsp
            },
            config = function()
                require 'plugins.config.lspconfig'
            end
        }

        -- Autocomplete
        -- CMP completion engine
        use {
            "hrsh7th/nvim-cmp",
            requires = {
                "onsails/lspkind-nvim",     -- Icons on the popups
                "hrsh7th/cmp-nvim-lsp",     -- LSP source for nvim-cmp
                "saadparwaiz1/cmp_luasnip", -- Snippets source
                "L3MON4D3/LuaSnip",         -- Snippet engine
            },
            config = function()
                require 'plugins.config.nvim-cmp'
            end,
        }

        -- Null-LS Use external formatters and linters
        use({
            "jose-elias-alvarez/null-ls.nvim",
            requires = {
                "nvim-lua/plenary.nvim",
            },
            config = function()
                require 'plugins.config.null-ls'
            end,
        })

        use "b0o/schemastore.nvim"

        ----------------------------------------------
        --          Web Development Stuff           --
        ----------------------------------------------
        -- Emmet
        use {
            'mattn/emmet-vim',
            config = function()
                require 'plugins.config.emmet'
            end,
        }

        -- Editor config
        use { 'editorconfig/editorconfig-vim' }

        -- vCoolor is a Vim plugin that allows using a color picker/selector directly from the editor.
        use {
            'KabbAmine/vCoolor.vim',
            config = [[vim.g.vcoolor_custom_picker = "kdialog --title 'vCoolor' --getcolor --default "]],
        }
    end
})
