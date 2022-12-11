local present, treesitterConfig = pcall(require, 'nvim-treesitter.configs')

if not present then
    return
end

treesitterConfig.setup({
    -- To install additional languages, do: `:TSInstall <mylang>`. `:TSInstall maintained` to install all maintained
    ensure_installed = {
        'vim',
        'c',
        'lua',
        'cpp',
        'php',
        'typescript',
        'scss',
        'css',
        'html',
        'markdown',
        'cpp',
        'graphql',
        'javascript',
        'json',
        'python',
        'sql',
        'yaml',
    },
    sync_installed = false, -- install languages synchronously (only applied to `ensure_installed`)
    ignore_install = { '' }, -- List of parsers to ignore installing
    matchup = {
        enable = true, -- mandatory, false will disable the whole extension
        disable_virtual_text = true,
        disable = { 'html' }, -- optional, list of language that will be disabled
        -- include_match_words = false
    },
    highlight = {
        enable = true, -- This is a MUST
        additional_vim_regex_highlighting = { 'php' },
        disable = { 'txt', 'markdown' },
    },
    autopairs = { enable = true },
    indent = {
        enable = false, -- Really breaks stuff if true
        disable = { 'python', 'css', 'rust' },
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = 'gnn',
            node_incremental = 'grn',
            scope_incremental = 'grc',
            node_decremental = 'grm',
        },
    },
    filetypes = {
        'html',
        'javascript',
        'javascriptreact',
        'svelte',
        'typescript',
        'typescriptreact',
        'vue',
        'xml',
    },
    -- Smart rename
    -- Renames the symbol under the cursor within the current scope (and current file).
    refactor = {
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = 'grr',
            },
        },
        navigation = {
            enable = true,
            keymaps = {
                goto_definition = 'gnd',
                list_definitions = 'gnD',
                list_definitions_toc = 'gO',
                goto_next_usage = '<a-*>',
                goto_previous_usage = '<a-#>',
            },
        },
        -- highlight_current_scope = { enable = true },
    },
    autotag = {
        enable = true,
        disable = { 'xml', 'markdown' },
    },
    rainbow = {
        enable = true,
        extended_mode = false,
        colors = {
            -- "#68a0b0",
            -- "#946EaD",
            -- "#c7aA6D",
            'Gold',
            'Orchid',
            'DodgerBlue',
            -- "Cornsilk",
            -- "Salmon",
            -- "LawnGreen",
        },
        disable = { 'html' },
    },
    playground = {
        enable = true,
    },

    context_commentstring = {
        enable = true,
    },
    textobjects = {
        select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['at'] = '@class.outer',
                ['it'] = '@class.inner',
                ['ac'] = '@call.outer',
                ['ic'] = '@call.inner',
                ['aa'] = '@parameter.outer',
                ['ia'] = '@parameter.inner',
                ['al'] = '@loop.outer',
                ['il'] = '@loop.inner',
                ['ai'] = '@conditional.outer',
                ['ii'] = '@conditional.inner',
                ['a/'] = '@comment.outer',
                ['i/'] = '@comment.inner',
                ['ab'] = '@block.outer',
                ['ib'] = '@block.inner',
                ['as'] = '@statement.outer',
                ['is'] = '@scopename.inner',
                ['aA'] = '@attribute.outer',
                ['iA'] = '@attribute.inner',
                ['aF'] = '@frame.outer',
                ['iF'] = '@frame.inner',
            },
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                [']m'] = '@function.outer',
                [']]'] = '@class.outer',
            },
            goto_next_end = {
                [']M'] = '@function.outer',
                [']['] = '@class.outer',
            },
            goto_previous_start = {
                ['[m'] = '@function.outer',
                ['[['] = '@class.outer',
            },
            goto_previous_end = {
                ['[M'] = '@function.outer',
                ['[]'] = '@class.outer',
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ['<leader>.'] = '@parameter.inner',
            },
            swap_previous = {
                ['<leader>,'] = '@parameter.inner',
            },
        },
    },
})

-- Enable folds (zc and zo) on functions and classes but not by default
vim.cmd([[
set nofoldenable
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
]])
