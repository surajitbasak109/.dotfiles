-- Highlight on yan
local api = vim.api
local fn = vim.fn
local opt_local = vim.opt_local

api.nvim_create_autocmd('TextYankPost', {
    group = api.nvim_create_augroup('hl_yank', {}),
    callback = function() vim.highlight.on_yank() end,
})

api.nvim_create_autocmd('TermOpen', {
    group = api.nvim_create_augroup('terminal_settings', {}),
    callback = function()
        vim.opt.bufhidden = 'hide'
        vim.opt.number = false
    end,
})

api.nvim_create_augroup('no_cursorline_in_insert_mode', {})
api.nvim_create_autocmd({'InsertLeave', 'WinEnter'}, {
    group = 'no_cursorline_in_insert_mode',
    callback = function()
        opt_local.cursorline = true
    end,
})

api.nvim_create_autocmd({'InsertEnter', 'WinLeave'}, {
    group = 'no_cursorline_in_insert_mode',
    callback = function()
        opt_local.cursorline = false
    end,
})

api.nvim_create_autocmd('QuickFixCmdPost', {
    pattern = {'grep', 'helpgrep'},
    group = api.nvim_create_augroup('quickfix', {}),
    command = 'cwindow',
})

api.nvim_create_autocmd('BufReadPost', {
    group = api.nvim_create_augroup('restore_curpos', {}),
    callback = function()
        if fn.line("'\"") >= 1 and fn.line("'\"") <= fn.line('$') and not opt_local.filetype:get():match('commit') then
            fn.execute('normal! g`"')
        end
    end,
})

-- Jump to last line when opening a file
vim.cmd([[
	au BufWinEnter * if line("'\"") > 0 && line("'\"") <= line("$") | execute 'normal! g`"zvzz' | endif
]])

-- Change directory to the current buffer
vim.cmd("autocmd BufEnter * silent! lcd %:p:h")

-- Make containing directory if missing
vim.cmd("autocmd BufWritePre * silent! Mkdir! ")

-- Run PackerCompile after saving init.lua
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerCompile
  augroup end
]])
