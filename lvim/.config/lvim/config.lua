--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]

-- vim options
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.relativenumber = true

-- general
lvim.log.level = 'info'
lvim.format_on_save = {
    enabled = true,
    pattern = '*.lua',
    timeout = 1000,
}
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = 'space'
-- add your own keymapping
lvim.keys.normal_mode['<C-s>'] = ':w<cr>'
lvim.keys.insert_mode['jk'] = '<Esc>'

lvim.builtin.which_key.mappings['t'] = {
    name = 'Diagnostics',
    t = { '<cmd>TroubleToggle<cr>', 'trouble' },
    w = { '<cmd>TroubleToggle workspace_diagnostics<cr>', 'workspace' },
    d = { '<cmd>TroubleToggle document_diagnostics<cr>', 'document' },
    q = { '<cmd>TroubleToggle quickfix<cr>', 'quickfix' },
    l = { '<cmd>TroubleToggle loclist<cr>', 'loclist' },
    r = { '<cmd>TroubleToggle lsp_references<cr>', 'references' },
}

lvim.builtin.which_key.mappings['sw'] = {
    name = 'Search and Replace',
    ['1'] = { "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", 'Replace Current word' },
    ['2'] = { "<cmd>lua require('spectre').open_visual()<CR>", 'Replace word' },
    ['3'] = { "<cmd>lua require('spectre').open()<CR>", 'Search window' },
}

lvim.builtin.which_key.mappings['S'] = {
    name = 'Session',
    c = { "<cmd>lua require('persistence').load()<cr>", 'Restore last session for current dir' },
    l = { "<cmd>lua require('persistence').load({ last = true })<cr>", 'Restore last session' },
    Q = { "<cmd>lua require('persistence').stop()<cr>", 'Quit without saving session' },
}

lvim.keys.normal_mode['<S-l>'] = ':BufferLineCycleNext<CR>'
lvim.keys.normal_mode['<S-h>'] = ':BufferLineCyclePrev<CR>'

-- -- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings['W'] = { '<cmd>noautocmd w<cr>', 'Save without formatting' }
lvim.builtin.which_key.mappings['P'] = { '<cmd>Telescope projects<CR>', 'Projects' }

-- -- Change theme settings
-- lvim.colorscheme = "lunar"

-- After changing plugin config exit and reopen LunarVim, Run :PackerSync
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = 'dashboard'
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = 'left'
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

-- lvim.builtin.treesitter.ignore_install = { "haskell" }

-- -- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>

-- --- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
local formatters = require('lvim.lsp.null-ls.formatters')
formatters.setup({
    { command = 'stylua' },
    {
        command = 'prettier',
        extra_args = { '--print-with', '100' },
        filetypes = { 'typescript', 'typescriptreact', 'css', 'javascript', 'html' },
    },
})
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     command = "shellcheck",
--     args = { "--severity", "warning" },
--   },
-- }

-- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
    {
        'folke/trouble.nvim',
        cmd = 'TroubleToggle',
    },
    -- Emmet
    {
        'mattn/emmet-vim',
    },
    {
        'wakatime/vim-wakatime',
    },
    {
        'nacro90/numb.nvim',
        event = 'BufRead',
        config = function()
            require('numb').setup({
                show_numbers = true, -- Enable 'number' for the window while peeking
                show_cursorline = true, -- Enable 'cursorline' for the window while peeking
            })
        end,
    },
    { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' },
    { 'f-person/git-blame.nvim' },
    {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup({ 'css', 'scss', 'html', 'javascript' }, {
                RGB = true, -- #RGB hex codes
                RRGGBB = true, -- #RRGGBB hex codes
                RRGGBBAA = true, -- #RRGGBBAA hex codes
                rgb_fn = true, -- CSS rgb() and rgba() functions
                hsl_fn = true, -- CSS hsl() and hsla() functions
                css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
                css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
            })
        end,
    },
    {
        'ray-x/lsp_signature.nvim',
        event = 'BufRead',
        config = function()
            require('lsp_signature').on_attach()
        end,
    },
    {
        'metakirby5/codi.vim',
        cmd = 'Codi',
    },
    {
        'iamcco/markdown-preview.nvim',
        run = 'cd app && npm install',
        ft = 'markdown',
        setup = function()
            vim.g.mkdp_filetypes = { 'markdown' }
        end,
        config = function()
            vim.g.mkdp_auto_start = 1
            vim.g.mkdp_browser = 'brave-browser'
        end,
    },
    {
        'karb94/neoscroll.nvim',
        event = 'WinScrolled',
        config = function()
            require('neoscroll').setup({
                -- All these keys will be mapped to their corresponding default scrolling animation
                mappings = {
                    '<C-u>',
                    '<C-d>',
                    '<C-b>',
                    '<C-f>',
                    '<C-y>',
                    '<C-e>',
                    'zt',
                    'zz',
                    'zb',
                },
                hide_cursor = true, -- Hide cursor while scrolling
                stop_eof = true, -- Stop at <EOF> when scrolling downwards
                use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
                respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
                cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
                easing_function = nil, -- Default easing function
                pre_hook = nil, -- Function to run before the scrolling animation starts
                post_hook = nil, -- Function to run after the scrolling animation ends
            })
        end,
    },
    {
        'folke/todo-comments.nvim',
        event = 'BufRead',
        config = function()
            require('todo-comments').setup()
        end,
    },
    {
        'folke/persistence.nvim',
        event = 'BufReadPre', -- this will only start session saving when an actual file was opened
        module = 'persistence',
        config = function()
            require('persistence').setup({
                dir = vim.fn.expand(vim.fn.stdpath('config') .. '/session/'),
                options = { 'buffers', 'curdir', 'tabpages', 'winsize' },
            })
        end,
    },
    {
        'ethanholz/nvim-lastplace',
        event = 'BufRead',
        config = function()
            require('nvim-lastplace').setup({
                lastplace_ignore_buftype = { 'quickfix', 'nofile', 'help' },
                lastplace_ignore_filetype = {
                    'gitcommit',
                    'gitrebase',
                    'svn',
                    'hgcommit',
                },
                lastplace_open_folds = true,
            })
        end,
    },
    -- You must install glow globally
    -- https://github.com/charmbracelet/glow
    -- yay -S glow
    {
        'npxbr/glow.nvim',
        ft = { 'markdown' },
        -- run = "yay -S glow"
    },
    {
        'ggandor/lightspeed.nvim',
        event = 'BufRead',
    },
    {
        'p00f/nvim-ts-rainbow',
    },
    {
        'windwp/nvim-spectre',
    },
}

-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'zsh',
    callback = function()
        -- let treesitter use bash highlight for zsh files as well
        require('nvim-treesitter.highlight').attach(0, 'bash')
    end,
})
