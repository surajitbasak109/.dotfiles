local nvimTreePresent, nvimTree = pcall(require, "nvim-tree")

if not nvimTreePresent then
    return
end

nvimTree.setup({
    diagnostics = {
        enable = true,
    },
    update_focused_file = {
        enable = true,
    },
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
            },
        },
    },
    filters = {
        custom = { '.git$', 'node_modules$', '^target$', 'vendor$', 'public$' },
    },
    git = {
        ignore = false,
    },
    actions = {
        open_file = {
            window_picker = {
                enable = false,
            },
        },
    },
    renderer = {
        icons = {
            show = {
                git = true,
                folder = true,
                file = true,
                folder_arrow = false,
            },
            glyphs = {
                default = '',
                git = {
                    unstaged = '~',
                    staged = '+',
                    unmerged = '!',
                    renamed = '≈',
                    untracked = '?',
                    deleted = '-',
                },
            },
        },
        indent_markers = {
            enable = true,
        },
    },
})

vim.api.nvim_set_keymap("n", "<c-n>", "<cmd>NvimTreeToggle<cr>", { noremap = true, silent = true })

vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('NVIM_TREE', { clear = true }),
    pattern = 'NvimTree',
    callback = function()
        vim.api.nvim_win_set_option(0, 'wrap', false)
    end,
})
