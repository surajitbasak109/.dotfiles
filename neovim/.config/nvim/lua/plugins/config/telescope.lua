local present, telescope = pcall(require, 'telescope')

if not present then
    return
end

vim.g.theme_switcher_loaded = true

local actions = require('telescope.actions')

local options = {
    defaults = {
        prompt_prefix = ' ',
        selection_caret = ' ',
        -- prompt_prefix = "   ",
        -- selection_caret = "  ",
        entry_prefix = '  ',
        initial_mode = 'insert',
        selection_strategy = 'reset',
        sorting_strategy = 'ascending',
        layout_strategy = 'horizontal',
        layout_config = {
            horizontal = {
                prompt_position = 'top',
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = {
                mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },
        file_sorter = require('telescope.sorters').get_fuzzy_file,
        file_ignore_patterns = { 'bin', 'node_modules', 'vendor', 'public', '.git/', '.cache', '%.o', '%.a', '%.out', '%.pdf', '%.mkv', '%.mp4', '%.zip' },
        generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
        -- path_display = { "truncate" },
        path_display = { 'smart' },
        winblend = 0,
        border = {},
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        color_devicons = true,
        set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
        file_previewer = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require('telescope.previewers').buffer_previewer_maker,
        mappings = {
            i = {
                ['<C-n>'] = actions.cycle_history_next,
                ['<C-p>'] = actions.cycle_history_prev,

                ['<C-c>'] = actions.close,

                ['<Down>'] = actions.move_selection_next,
                ['<c-j>'] = actions.move_selection_next,
                ['<Up>'] = actions.move_selection_previous,
                ['<c-k>'] = actions.move_selection_previous,

                ['<CR>'] = actions.select_default,
                ['<C-x>'] = actions.select_horizontal,
                ['<C-v>'] = actions.select_vertical,
                ['<C-t>'] = actions.select_tab,

                ['<C-u>'] = actions.preview_scrolling_up,
                ['<C-d>'] = actions.preview_scrolling_down,

                ['<PageUp>'] = actions.results_scrolling_up,
                ['<PageDown>'] = actions.results_scrolling_down,

                ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
                ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
                ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
                ['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
                ['<C-_>'] = actions.which_key, -- keys from pressing <C-/>

                ['<C-k>'] = actions.move_selection_next,
                ['<C-l>'] = actions.move_selection_previous,
            },

            n = {
                ['<esc>'] = actions.close,
                ['<CR>'] = actions.select_default,
                ['<C-x>'] = actions.select_horizontal,
                ['<C-v>'] = actions.select_vertical,
                ['<C-t>'] = actions.select_tab,

                ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
                ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
                ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
                ['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,

                ['<Down>'] = actions.move_selection_next,
                ['<Up>'] = actions.move_selection_previous,
                ['gg'] = actions.move_to_top,
                ['G'] = actions.move_to_bottom,

                ['<C-u>'] = actions.preview_scrolling_up,
                ['<C-d>'] = actions.preview_scrolling_down,

                ['<PageUp>'] = actions.results_scrolling_up,
                ['<PageDown>'] = actions.results_scrolling_down,

                ['?'] = actions.which_key,

                ['k'] = actions.move_selection_next,
                ['l'] = actions.move_selection_previous,
                ['j'] = actions.move_to_top,
                ['M'] = actions.move_to_middle,
                [';'] = actions.move_to_bottom,
            },
        },
    },
    pickers = {
        live_grep = {
            addition_support = function(opts)
                return { '--hidden' }
            end,
        },
        find_files = {
            hidden = true,
        },
    },
}

require('plugins.config.project')
telescope.setup(options)
telescope.load_extension('projects')
telescope.load_extension('frecency')
telescope.load_extension('neoclip')
