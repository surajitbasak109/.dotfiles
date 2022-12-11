local cmp = require('cmp') -- The complete engine
local luasnip = require('luasnip') -- The snippet engine
local lspkind = require('lspkind') -- Pretty icons on the automplete list

local buffer_fts = {
    'markdown',
    'toml',
    'yaml',
    'json',
}

local function contains(t, value)
    for _, v in pairs(t) do
        if v == value then
            return true
        end
    end
    return false
end

local compare = require('cmp.config.compare')
require('luasnip.loaders.from_vscode').lazy_load({})

local check_backspace = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

local icons = require('icons')
local kind_icons = icons.kind

vim.g.cmp_active = true

-- This is almost verbatin from the Github Page
cmp.setup({
    enabled = function()
        local buftype = vim.api.nvim_buf_get_option(0, 'buftype')
        if buftype == 'prompt' then
            return false
        end
        return vim.g.cmp_active
    end,
    preselect = cmp.PreselectMode.None,
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete({}),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<Right>'] = cmp.mapping.confirm({ select = true }),
        ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
        ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.jumpable(1) then
                luasnip.jump(1)
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif luasnip.expandable() then
                luasnip.expand({})
            elseif check_backspace() then
                -- cmp.complete()
                fallback()
            else
                fallback()
            end
        end, {
            'i',
            's',
        }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {
            'i',
            's',
        }),
    }),
    -- Where to look for auto-complete items.
    sources = {
        {
            name = 'nvim_lsp',
            filter = function(entry, ctx)
                local kind = require('cmp.types.lsp').CompletionItemKind[entry:get_kind()]
                if kind == 'Snippet' then
                    -- if kind == 'Snippet' and ctx.prev_context.filetype == 'java' then
                    return true
                end

                if kind == 'Text' then
                    return true
                end
            end,
            group_index = 2,
        },
        { name = 'nvim_lua', group_index = 2 },
        { name = 'luasnip', group_index = 2 },
        {
            keyword_length = 3,
            name = 'buffer',
            group_index = 2,
            filter = function(entry, ctx)
                if not contains(buffer_fts, ctx.prev_context.filetype) then
                    return true
                end
            end,
            option = {
                keyword_pattern = [[\k\+]],
            },
        },
        { name = 'nvim_lsp_signature_help' },
        {
            name = 'path',
            group_index = 2,
            option = {
                trailing_slash = true,
                label_trailing_slash = true,
            },
        },
    },
    sorting = {
        priority_weight = 2,
        comparators = {
            -- require("copilot_cmp.comparators").prioritize,
            -- require("copilot_cmp.comparators").score,
            compare.offset,
            compare.exact,
            -- compare.scopes,
            compare.score,
            compare.recently_used,
            compare.locality,
            -- compare.kind,
            compare.sort_text,
            compare.length,
            compare.order,
            -- require("copilot_cmp.comparators").prioritize,
            -- require("copilot_cmp.comparators").score,
        },
    },
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
    -- Improve the dropdown list display: Show incons and show where
    -- the automcomplete sugestion comes from
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text',
            menu = {
                buffer = '[Buf]',
                nvim_lsp = '[Lsp]',
                luasnip = '[Snip]',
                nvim_lua = '[Lua]',
                latex_symbols = '[Lat]',
            },
        }),
    },

    -- Show borders like the LSP autocomplte
    window = {
        documentation = false,
        -- documentation = cmp.config.window.bordered(),
    },
    -- Can be anoying so experiment with it
    -- experimental = {
    --    ghost_text = true,
    -- },
})

-- `/` cmdline setup.
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' },
    },
})

-- `:` cmdline setup.
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' },
    }, {
        {
            name = 'cmdline',
            option = {
                ignore_cmds = { 'Man', '!' },
            },
        },
    }),
})
