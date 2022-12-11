local present, mason = pcall(require, 'mason')
if not present then
    return
end

local mason_lspconfig_present, mason_lspconfig = pcall(require, 'mason-lspconfig')

if not mason_lspconfig_present then
    return
end

local servers = {
    'cssls',
    'cssmodules_ls',
    'emmet_ls',
    'html',
    'jsonls',
    'sumneko_lua',
    'tsserver',
    'pyright',
    'yamlls',
    'bashls',
    'clangd',
    'intelephense',
}

local settings = {
    ui = {
        border = 'rounded',
        icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗',
        },
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
}

mason.setup(settings)

mason_lspconfig.setup({
    ensure_installed = servers,
    automatic_installation = true,
})

local lspconfig_present, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_present then
    return
end

local opts = {}

local handlers = require('plugins.config.lsp.handlers')

for _, server in ipairs(servers) do
    opts = {
        on_attach = handlers.on_attach,
        capabilities = handlers.capabilities,
    }

    server = vim.split(server, '@')[1]

    if server == 'intelephense' then
        local intelephense_opts = require('plugins.config.lsp.settings.intelephense')
        opts = vim.tbl_deep_extend('force', intelephense_opts, opts)
    end

    if server == 'jsonls' then
        local jsonls_opts = require('plugins.config.lsp.settings.jsonls')
        opts = vim.tbl_deep_extend('force', jsonls_opts, opts)
    end

    if server == 'yamlls' then
        local yamlls_opts = require('plugins.config.lsp.settings.yamlls')
        opts = vim.tbl_deep_extend('force', yamlls_opts, opts)
    end

    if server == 'sumneko_lua' then
        local neodev_prsent, neodev = pcall(require, 'neodev')
        if not neodev_prsent then
            return
        end
        -- local sumneko_opts = require "plugins.config.lsp.settings.sumneko_lua"
        -- opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
        -- opts = vim.tbl_deep_extend("force", require("lua-dev").setup(), opts)
        neodev.setup({
            --   -- add any options here, or leave empty to use the default settings
            -- lspconfig = opts,
            lspconfig = {
                on_attach = opts.on_attach,
                capabilities = opts.capabilities,
            },
        })
        lspconfig.sumneko_lua.setup({
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' },
                    },
                    completion = {
                        callSnippet = 'Replace',
                    },
                },
            },
        })
        goto continue
    end

    if server == 'tsserver' then
        local tsserver_opts = require('plugins.config.lsp.settings.tsserver')
        opts = vim.tbl_deep_extend('force', tsserver_opts, opts)
    end

    if server == 'pyright' then
        local pyright_opts = require('plugins.config.lsp.settings.pyright')
        opts = vim.tbl_deep_extend('force', pyright_opts, opts)
    end

    if server == 'emmet_ls' then
        local emmet_ls_opts = require('plugins.config.lsp.settings.emmet_ls')
        opts = vim.tbl_deep_extend('force', emmet_ls_opts, opts)
    end

    lspconfig[server].setup(opts)
    ::continue::
end

-- TODO: add something to installer later
-- require("lspconfig").motoko.setup {}
