-- TODO: what else?
-- PERF: fully optimized
-- HACK: hmmm, this looks little funky
-- NOTE: adding a note
-- FIX: This needs fixing
-- WARNING: ?????

-- Packer
local fn = vim.fn
-- local execute = vim.api.nvim_command

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path,
    })

    -- When vim opens sync packer
    vim.cmd('autocmd VimEnter * PackerSync')
    -- vim.cmd('autocmd VimEnter * Alpha')
end

-- Use a protected call so we don't error out on first use
local present, packer = pcall(require, 'packer')
if not present then
    return
end

-- Have packer use a popup window
packer.init({
    -- snapshot = "july-24",
    snapshot_path = fn.stdpath('config') .. '/snapshots',
    max_jobs = 50,
    display = {
        open_fn = function()
            return require('packer.util').float({ border = 'rounded' })
        end,
        prompt_border = 'rounded', -- Border style of prompt popups.
    },
})

packer.startup({
    function(use)
        -- Packer itself
        use('wbthomason/packer.nvim')

        --------------------- LSP ---------------------
        -- Language server protocol
        -- Quickstart configs for Nvim LSP
        -- Linting and formatting
        ----------------------------------------------
        use({
            'neovim/nvim-lspconfig',
            requires = {
                -- Portable package manager for Neovim that runs
                -- everywhere Neovim runs. Easily install and manage
                -- LSP servers, DAP servers, linters, and formatters.
                'williamboman/mason.nvim',
                'williamboman/mason-lspconfig.nvim',
                'onsails/lspkind-nvim',
                'ray-x/lsp_signature.nvim',
                'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
                'b0o/schemastore.nvim',
                'nvim-lua/plenary.nvim',
                -- Null-LS Use external formatters and linters
                'jose-elias-alvarez/null-ls.nvim',
                'folke/lua-dev.nvim',
            },
            config = function()
                require('plugins.config.lsp')
            end,
        })

        -- TODO: Add below after testing
        -- nvim-lua/lsp-status.nvim
        -- RishabhRD/nvim-lsputils
        -- glepnir/lspsaga.nvim           2.2K Star

        use({
            "glepnir/lspsaga.nvim",
            branch = "main",
            config = function()
                require('plugins.config.lspsaga')
            end,
        })

        -- Editing
        use({
            'nacro90/numb.nvim',
            config = function()
                require('plugins.config.numb')
            end,
        })

        use({
            'junegunn/vim-slash',
            config = function()
                vim.cmd([[noremap <plug>(slash-after) zz]])
            end,
        })

        -- Key bindings
        -- WhichKey - displays a popup with possible key bindings of the command you started typing
        -- Which key is that? Which-key!
        use({
            'folke/which-key.nvim',
            config = function()
                require('plugins.config.which-key')
            end,
        })

        -- Distraction free editing
        use({
            'folke/zen-mode.nvim',
            config = function()
                require('plugins.config.zen-mode')
            end,
        })

        -- dims inactive portions of the code you're editing using TreeSitter.
        use({
            'folke/twilight.nvim',
            config = function()
                require('plugins.config.twilight')
            end,
        })

        -- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
        use({
            'folke/noice.nvim',
            config = function()
                -- require('plugins.config.noice')
            end,
            requires = {
                -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
                'MunifTanjim/nui.nvim',
            },
        })

        use({
            'rcarriga/nvim-notify',
            config = function()
                require('plugins.config.notify')
            end,
        })

        -- a simple lua plugin for automated session management.
        use({
            'folke/persistence.nvim',
            event = 'BufReadPre', -- this will only start session saving when an actual file was opened
            module = 'persistence',
            config = function()
                require('persistence').setup({
                    options = { 'buffers', 'curdir', 'tabpages', 'winsize', 'help' },
                })
            end,
        })

        -- A pretty diagnostics, references, telescope results, quickfix and
        -- location list to help you solve all the trouble your code is causing.
        use({
            'folke/trouble.nvim',
            cmd = { 'TroubleToggle', 'Trouble' },
            config = function()
                require('trouble').setup({
                    auto_open = false,
                    use_diagnostic_signs = true, -- en
                })
            end,
        })

        -- VSCode bulb for neovim's built-in LSP.
        use({
            'kosayoda/nvim-lightbulb',
            requires = 'antoinemadec/FixCursorHold.nvim',
            config = function()
                require('nvim-lightbulb').setup({ autocmd = { enabled = true } })
            end,
        })

        -- A better annotation generator. Supports multiple languages and annotation conventions.
        use({
            'danymat/neogen',
            config = function()
                require('neogen').setup({ snippet_engine = 'luasnip' })
            end,
        })

        -- A tree like view for symbols in Neovim using the Language Server Protocol.
        -- Supports all your favourite languages.
        use({
            'simrat39/symbols-outline.nvim',
            cmd = 'SymbolsOutline',
            config = function()
                require('symbols-outline').setup()
            end,
        })

        use({
            'ThePrimeagen/refactoring.nvim',
            init = function()
                -- prompt for a refactor to apply when the remap is triggered
                vim.keymap.set('v', '<leader>r', function()
                    require('refactoring').select_refactor()
                end, { noremap = true, silent = true, expr = false })
            end,
            config = function()
                require('refactoring').setup({})
            end,
        })

        -- Simple winbar/statusline plugin that shows your current code context
        use({
            'SmiteshP/nvim-navic',
            config = function()
                require('plugins.config.navic')
            end,
        })

        -- Incremental LSP renaming based on Neovim's command-preview feature.
        use({
            'smjonas/inc-rename.nvim',
            cmd = 'IncRename',
            config = function()
                require('inc_rename').setup()
            end,
        })

        ----------------------------------------------------------
        -- Telescope - A powerful fuzzy file finder and more... --
        ----------------------------------------------------------
        -- The big daddy
        use({
            'nvim-telescope/telescope.nvim',
            tag = '0.1.0',
            -- or                            , branch = '0.1.x',
            requires = {
                'nvim-lua/plenary.nvim',
                'nvim-lua/popup.nvim',
                'ahmedkhalf/project.nvim',
            },
            config = function()
                require('plugins.config.telescope')
            end,
        })

        -- Marking
        use({
            'MattesGroeger/vim-bookmarks',
            config = function()
                require('plugins.config.bookmark')
            end,
        })

        -- Telescope most recently used (extension)
        use({
            'nvim-telescope/telescope-frecency.nvim',
            requires = { 'tami5/sqlite.lua' },
        })

        -- Clipboard manager
        use({
            'AckslD/nvim-neoclip.lua',
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
        use({
            {
                -- Tokyo Night
                'folke/tokyonight.nvim',
            },
            {
                -- Nord
                'shaunsingh/nord.nvim',
            },
            {
                -- Dracula
                'dracula/vim',
                as = 'dracula',
                config = function()
                    vim.cmd([[colorscheme dracula]])
                end,
            },
        })

        ---------------- End of Themes ----------------

        ----------------------------------------------
        -- Dependencies
        ----------------------------------------------
        -- Dev Icons
        use('kyazdani42/nvim-web-devicons')

        -- Add fancy indent markers, which integrate nicely with treesitter
        -- and shows the current context
        use({
            'lukas-reineke/indent-blankline.nvim',
            config = function()
                require('plugins.config.indent-blankline')
            end,
        })

        -- :w !sudo tee % > /dev/null
        use({
            'lambdalisue/suda.vim',
            cmd = { 'SudaWrite', 'SudaRead' },
        })

        -- Markdown preview
        use({
            'iamcco/markdown-preview.nvim',
            run = 'cd app && yarn install',
            config = function()
                vim.g.mkdp_browser = 'qutebrowser'
            end,
        })

        use({
            'andymass/vim-matchup',
            event = 'BufReadPost',
            config = function()
                vim.g.matchup_matchparen_offscreen = { method = 'status_manual' }
                vim.g.matchup_matchpref = { html = { nolists = 1 } }
            end,
        })

        use({
            'folke/todo-comments.nvim',
            requires = 'nvim-lua/plenary.nvim',
            config = function()
                require('plugins.config.todo-comments')
            end,
        })

        use({
            'cshuaimin/ssr.nvim',
            -- Calling setup is optional.
            init = function()
                vim.keymap.set({ 'n', 'x' }, '<leader>sr', function()
                    require('ssr').open()
                end, { desc = 'Structural Replace' })
            end,
        })

        use({
            'Wansmer/treesj',
            keys = 'J',
            config = function()
                require('treesj').setup({ use_default_keymaps = false })
                vim.keymap.set('n', 'J', '<cmd>TSJToggle<cr>')
            end,
        })

        ----------------------------------------------
        --        Navigation/File Explorer          --
        ----------------------------------------------

        -- A File Explorer For Neovim Written In Lua
        use({
            'nvim-tree/nvim-tree.lua',
            event = 'CursorHold',
            config = function()
                require('plugins.config.nvim-tree')
            end,
        })

        use({
            'christianchiarulli/lir.nvim',
            config = function()
                require('plugins.config.lir')
            end,
        })

        ----------------------------------------------
        --              Git Utilities               --
        ----------------------------------------------

        -- Git integration for buffers
        use({
            'lewis6991/gitsigns.nvim',
            event = 'BufRead',
            config = function()
                require('plugins.config.gitsigns')
            end,
        })
        -- See author name and more
        use({
            'f-person/git-blame.nvim',
            config = function()
                vim.g.gitblame_enabled = 0
                vim.g.gitblame_message_template = '<summary> • <date> • <author>'
                vim.g.gitblame_highlight_group = 'LineNr'
            end,
        })

        use({
            'rhysd/git-messenger.vim',
            event = 'BufRead',
            config = function()
                vim.g.git_messenger_no_default_mappings = true
                vim.keymap.set('n', 'gm', '<CMD>GitMessenger<CR>')
            end,
        })

        -- The git plugin so good, it should be illegal
        use({ 'tpope/vim-fugitive', config = 'vim.g.fugitive_legacy_commands = 0' })
        -- GitHub extension for fugitive.vim
        use({ 'tpope/vim-rhubarb' })

        -- Github
        use({
            'pwntester/octo.nvim',
            config = function()
                require('octo').setup()
            end,
        })

        ----------------------------------------------
        -- Utilities
        ----------------------------------------------
        -- A painless, powerful Vim auto-pair plugin.
        use({
            'windwp/nvim-autopairs',
            config = function()
                require('plugins.config.autopairs')
            end,
        })

        -- Highlight colours (sometimes, currently)
        use({
            'norcalli/nvim-colorizer.lua',
            config = function()
                require('colorizer').setup()
            end,
        })

        -- Find the enemy and replace them with dark power.
        use({
            'nvim-pack/nvim-spectre',
            config = function()
                require('plugins.config.spectre')
            end,
        })

        -- Comment stuff out
        use({ 'tpope/vim-commentary' })
        --  Quoting/parenthesizing made simple
        use({
            'tpope/vim-surround',
            config = function()
                require('plugins.config.surround')
            end,
        })

        use({
            'phaazon/hop.nvim',
            branch = 'v2', -- optional but strongly recommended
            config = function()
                require('plugins.config.hop')
            end,
        })

        use({
            'akinsho/toggleterm.nvim',
            tag = '*',
            config = function()
                require('plugins.config.toggleterm')
            end,
        })

        use({
            disable = true,
            'stevearc/dressing.nvim',
            config = function()
                require('plugins.config.dressing')
            end,
        })

        use({
            'lewis6991/impatient.nvim',
            config = function()
                require('impatient').enable_profile()
            end,
        })

        use({
            'lalitmee/browse.nvim',
            config = function()
                require('plugins.config.browse')
            end,
        })

        -- Registers
        use({
            'tversteeg/registers.nvim',
            config = function()
                require('plugins.config.registers')
            end,
        })

        -- Session
        -- use({
        --     'rmagatti/auto-session',
        --     requires = { 'rmagatti/session-lens' },
        --     config = function()
        --         require('plugins.config.auto-session')
        --     end,
        -- })

        -- Quickfix
        use({
            'kevinhwang91/nvim-bqf',
        })

        -- Search and Replace
        use({
            's1n7ax/nvim-search-and-replace',
            config = function()
                local present, search_and_replace = pcall(require, "nvim-search-and-replace")
                if present then
                    search_and_replace.setup()
                end
            end,
        })

        ----------------------------------------------
        -- Interface
        ----------------------------------------------

        -- A snazzy bufferline for Neovim
        use({
            'akinsho/bufferline.nvim',
            tag = 'v3.*',
            requires = 'nvim-tree/nvim-web-devicons',
            config = function()
                require('bufferline').setup()
            end,
        })

        -- A blazing fast and easy to configure Neovim statusline written in Lua.
        use({
            {
                'nvim-lualine/lualine.nvim',
                config = function()
                    require('plugins.config.lualine')
                end,
                requires = {
                    'arkav/lualine-lsp-progress',
                    'kyazdani42/nvim-web-devicons',
                    'rlch/github-notifications.nvim',
                },
            },
            {
                'j-hui/fidget.nvim',
                after = 'lualine.nvim',
                config = function()
                    require('fidget').setup()
                end,
            },
        })

        -- Neoscroll: a smooth scrolling neovim
        use({
            'karb94/neoscroll.nvim',
            event = 'WinScrolled',
            config = function()
                require('neoscroll').setup({ hide_cursor = false })
            end,
        })

        ----------------------------------------------
        --          Syntax Highlighting             --
        --          Language Server Protcol         --
        --              Autocompletion              --
        --          Linting and Formatting          --
        ----------------------------------------------

        ------------------------------------------------------------
        --                Syntax Parser                           --
        -- Nvim Treesitter configurations and abstraction layer   --
        ------------------------------------------------------------
        use({
            {
                'nvim-treesitter/nvim-treesitter',
                run = ':TSUpdate',
                config = function()
                    require('plugins.config.treesitter')
                end,
            },
            { 'nvim-treesitter/nvim-treesitter-refactor', after = 'nvim-treesitter' },
            { 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' },
            { 'JoosepAlviste/nvim-ts-context-commentstring', after = 'nvim-treesitter' },
            { 'p00f/nvim-ts-rainbow', after = 'nvim-treesitter' },
            { 'nvim-treesitter/playground', after = 'nvim-treesitter' },
            { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' },
        })

        use({
            'abecodes/tabout.nvim',
            wants = { 'nvim-treesitter' }, -- or require if not used so far
            config = function()
                require('plugins.config.tabout')
            end,
        })

        -- Startup
        use({
            'goolord/alpha-nvim',
            config = function()
                require('plugins.config.alpha')
            end,
        })

        -- Fuzzy file finder
        use({
            'junegunn/fzf.vim',
            requires = { 'junegunn/fzf', run = 'fzf#install()' },
            config = function()
                vim.g.fzf_buffers_jump = 1

                local map = vim.keymap.set

                map('n', '<Leader>sf', '<Cmd>Files<CR>')
                map('n', '<Leader>sc', '<Cmd>exe "Files" stdpath("config")<CR>')
                map('n', '<Leader>sp', '<Cmd>exe "Files" stdpath("data") .. "/site"<CR>')
                map('n', '<Leader>sw', '<Cmd>exe "Files" g:wiki_root<CR>')
                map('n', '<Leader>rw', '<Cmd>exe "Rg" expand("<cword>")<CR>')
            end,
        })

        -- Wiki
        use({
            'lervag/wiki.vim',
            setup = function()
                vim.g.wiki_root = '~/Documents/wiki'
                vim.g.wiki_filetypes = { 'md' }
                vim.g.wiki_link_extension = '.md'
                vim.g.wiki_link_target_type = 'md'
                vim.g.wiki_export = {
                    args = '--highlight-style=tango --template=eisvogel',
                    from_format = 'markdown',
                    ext = 'pdf',
                    view = true,
                    viewer = 'okular',
                }
            end,
            cmd = {
                'WikiEnable',
                'WikiFzfPages',
                'WikiFzfTags',
                'WikiIndex',
                'WikiJournal',
                'WikiOpen',
                'WikiReload',
            },
            event = 'BufReadPre ~/Documents/wiki/*.md',
            keys = '<Leader>mw',
        })

        use({
            'lvimuser/lsp-inlayhints.nvim',
            config = function()
                -- require('plugins.config.lsp-inlayhints')
            end,
        })

        use({
            'zbirenbaum/copilot.lua',
            event = { 'VimEnter' },
            config = function()
                vim.defer_fn(function()
                    require('plugins.config.copilot')
                end, 100)
            end,
        })

        use({
            'RRethy/vim-illuminate',
            config = function()
                require('plugins.config.illuminate')
            end,
        })

        ----------------------------------------------
        -- Autocomplete
        -- CMP completion engine
        ----------------------------------------------
        use({
            'hrsh7th/nvim-cmp',
            requires = {
                'hrsh7th/cmp-cmdline', -- nvim-cmp source for vim's cmdline
                'hrsh7th/cmp-path', -- nvim-cmp source for path
                'hrsh7th/cmp-buffer', -- nvim-cmp source for buffer words
                'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
                'onsails/lspkind-nvim', -- Icons on the popups
                'hrsh7th/cmp-nvim-lua', -- Icons on the popups
            },
            config = function()
                require('plugins.config.nvim-cmp')
            end,
        })

        ----------------------------------------------
        -- Snippets
        ----------------------------------------------
        use({
            'L3MON4D3/LuaSnip',
            requires = {
                'rafamadriz/friendly-snippets',
            },
            config = function()
                require('luasnip.loaders.from_vscode').lazy_load()
            end,
        })

        use({
            'saadparwaiz1/cmp_luasnip', -- Snippets source
        })

        ----------------------------------------------
        --          Web Development Stuff           --
        ----------------------------------------------
        -- Emmet
        use({
            'mattn/emmet-vim',
            config = function()
                require('plugins.config.emmet')
            end,
        })

        -- Editor config
        use({ 'editorconfig/editorconfig-vim' })

        -- vCoolor is a Vim plugin that allows using a color picker/selector directly from the editor.
        use({
            'KabbAmine/vCoolor.vim',
            config = [[vim.g.vcoolor_custom_picker = "kdialog --title 'vCoolor' --getcolor --default "]],
        })

        -- Blade
        use({ 'jwalton512/vim-blade' })

        if PACKER_BOOTSTRAP then
            require('packer').sync()
        end
    end,
})
