local M = {}

---@param fn fun(buf: buffer, win: window)
function M.float(fn, opts)
    local buf = vim.api.nvim_create_buf(false, true)
    local vpad = 4
    local hpad = 10

    opts = vim.tbl_deep_extend("force", {
        relative = "editor",
        width = vim.o.columns - hpad * 2,
        height = vim.o.lines - vpad * 2,
        row = vpad,
        col = hpad,
        style = "minimal",
        border = "rounded",
        noautocmd = true,
    }, opts or {})

    local enter = opts.enter == nil and true or opts.enter
    local win = vim.api.nvim_open_win(buf, enter, opts)

    local function close()
        if vim.api.nvim_buf_is_valid(buf) then
            vim.api.nvim_buf_delete(buf, { force = true })
        end
        if vim.api.nvim_win_is_valid(win) then
            vim.api.nvim_win_close(win, true)
        end
        vim.cmd([[checktime]])
    end

    vim.keymap.set("n", "<ESC>", close, { buffer = buf, nowait = true })
    vim.keymap.set("n", "q", close, { buffer = buf, nowait = true })
    vim.api.nvim_create_autocmd({ "BufDelete", "BufLeave", "BufHidden" }, {
        once = true,
        buffer = buf,
        callback = close,
    })
    fn(buf, win)
end

function M.float_terminal(cmd, opts)
  M.float(function(buf, win)
    vim.fn.termopen(cmd)
    local autocmd = {
      "autocmd! TermClose <buffer> lua vim.cmd[[checktime]];",
      string.format("vim.api.nvim_win_close(%d, {force = true});", win),
      string.format("vim.api.nvim_buf_delete(%d, {force = true});", buf),
    }
    vim.cmd(table.concat(autocmd, " "))
    vim.cmd([[startinsert]])
  end, opts)
end

function M.hl()
    ---@type string[]
    local lines = {}

    local treesitter = {}
    for _, capture in pairs(vim.treesitter.get_captures_at_cursor(0)) do
        table.insert(treesitter, "- **@" .. capture .. "**")
    end
    if #treesitter > 0 then
        table.insert(lines, "# Treesitter")
        vim.list_extend(lines, treesitter)
    end

    local syntax = {}
    for _, i1 in ipairs(vim.fn.synstack(vim.fn.line("."), vim.fn.col("."))) do
        local i2 = vim.fn.synIDtrans(i1)
        local n1 = vim.fn.synIDattr(i1, "name")
        local n2 = vim.fn.synIDattr(i2, "name")
        table.insert(syntax, "- " .. n1 .. " -> **" .. n2 .. "**")
    end
    if #syntax > 0 then
        table.insert(lines, "# Syntax")
        vim.list_extend(lines, syntax)
    end

    local max_width = 10
    for _, line in ipairs(lines) do
        max_width = math.max(max_width, vim.fn.strwidth(line))
    end

    if vim.tbl_isempty(lines) then
        lines = { "No highlights under the cursor" }
        max_width = vim.fn.strwidth(lines[1])
    end

    M.markdown(table.concat(lines, "\n"), { title = "Highlights" })
end

function M.markdown(msg, opts)
    opts = vim.tbl_deep_extend("force", {
        title = "Debug",
        on_open = function(win)
            vim.wo[win].conceallevel = 3
            vim.wo[win].concealcursor = ""
            vim.wo[win].spell = false
            local buf = vim.api.nvim_win_get_buf(win)
            vim.treesitter.start(buf, "markdown")
        end,
    }, opts or {})
    require("notify").notify(msg, vim.log.levels.INFO, opts)
end

function M.toggle(option, silent)
    local info = vim.api.nvim_get_option_info(option)
    local scopes = { buf = "bo", win = "wo", global = "o" }
    local scope = scopes[info.scope]
    local options = vim[scope]
    options[option] = not options[option]
    if silent ~= true then
        if options[option] then
            M.info("enabled vim." .. scope .. "." .. option, "Toggle")
        else
            M.warn("disabled vim." .. scope .. "." .. option, "Toggle")
        end
    end
end

function M.warn(msg, name)
    vim.notify(msg, vim.log.levels.WARN, { title = name or "init.lua" })
end

function M.error(msg, name)
    vim.notify(msg, vim.log.levels.ERROR, { title = name or "init.lua" })
end

function M.info(msg, name)
    vim.notify(msg, vim.log.levels.INFO, { title = name or "init.lua" })
end

function M.clipman()
    local file = M.fqn("~/.local/share/clipman.json")
    if M.exists(file) then
        local f = io.open(file)
        if not f then
            return
        end
        local data = f:read("*a")
        f:close()

        -- allow empty files
        data = vim.trim(data)
        if data ~= "" then
            local ok, json = pcall(vim.fn.json_decode, data)
            if ok and json then
                local items = {}
                for i = #json, 1, -1 do
                    items[#items + 1] = json[i]
                end
                vim.ui.select(items, {
                    prompt = "Clipman",
                }, function(choice)
                    if choice then
                        vim.api.nvim_paste(choice, true, 1)
                    end
                end)
            else
                vim.notify(("failed to load clipman from %s"):format(file), vim.log.levels.ERROR)
            end
        end
    end
end

function M.requireConfig(fileName)
    local configFile = require ('plugins.config.' .. fileName)
    return configFile
end

return M
