local create_cmd, api, fn, opts = vim.api.nvim_create_user_command, vim.api, vim.fn, vim.opts

create_cmd("ToggleBackground", function ()
    if vim.o.background == 'dark' then
        vim.cmd'set bg=light'
    else
        vim.cmd'set bg=dark'
    end
end, {})

create_cmd('Scratch', function(opts)
    local buf = api.nvim_create_buf(false, false)
    vim.bo[buf].filetype = opts.args ~= '' and vim.trim(opts.args) or vim.bo.filetype
    vim.bo[buf].buftype = 'nofile'
    vim.bo[buf].bufhidden = 'hide'
    vim.bo[buf].swapfile = false
    if opts.range ~= 0 then
        local lines_to_copy = api.nvim_buf_get_lines(api.nvim_get_current_buf(), opts.line1 - 1, opts.line2, false)
        api.nvim_buf_set_lines(buf, 0, 1, false, lines_to_copy)
    end
    vim.cmd(('%s split'):format(opts.mods))
    api.nvim_win_set_buf(0, buf)
end, {range = 0, nargs = '?', complete = 'filetype'})
