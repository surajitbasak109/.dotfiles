local lsp_installer_present, lsp_installer = pcall(require, "nvim-lsp-installer")
local lspkind_present, lspkind = pcall(require, "lspkind")

if not lsp_installer_present then
    return
end

if not lspkind_present then
    return
end

-- Add icons to the popup
lspkind.init({
    mode = "symbol",
})

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }

local on_attach = function (client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<c-k>", "<cmd>lua vim.lsp.signature_help()<cr>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wa", "<cmd>lua vim.lsp.add_workspace_folder()<cr>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>wr", "<cmd>lua vim.lsp.remove_workspace_folder()<cr>", opts)
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<space>wl",
        "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
        opts
    )
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

local settings = {
    intelephense = {
        stubs = {
            "apache", "bcmath", "bz2", "calendar", "com_dotnet", "Core", "ctype", "curl", "date",
            "dba", "dom", "enchant", "exif", "FFI", "fileinfo", "filter", "fpm", "ftp", "gd", "gettext",
            "gmp", "hash", "iconv", "imap", "intl", "json", "ldap", "libxml", "mbstring", "meta", "mysqli",
            "oci8", "odbc", "openssl", "pcntl", "pcre", "PDO", "pdo_ibm", "pdo_mysql", "pdo_pgsql", "pdo_sqlite", "pgsql",
            "Phar", "posix", "pspell", "readline", "Reflection", "session", "shmop", "SimpleXML", "snmp", "soap",
            "sockets", "sodium", "SPL", "sqlite3", "standard", "superglobals", "sysvmsg", "sysvsem", "sysvshm", "tidy",
            "tokenizer", "xml", "xmlreader", "xmlrpc", "xmlwriter", "xsl", "Zend OPcache", "zip", "zlib",
            "phpunit",
        },
        diagnostics = { enable = true },
    },
    Lua = {
        diagnostics = {
            globals = { "vim" },
        }
    },
    json = {
        schemas = {
            {
                description = "NPM configuration file",
                fileMatch = {
                    "package.json",
                },
                url = "https://json.schemastore.org/package.json",
            },
        },
    },
}

-- Add borders to the popup you get when you "hover" (<S-k>)
local handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded", }),
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
}

-- Add capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Equivalent (but not equal) to lspconfig.<langserver>.setup{}
lsp_installer.on_server_ready(function(server)
    server:setup({
        on_attach = on_attach,
        settings = settings,
        handlers = handlers,
        capabilities = capabilities,
    })
end)

-- De clutter the editor by only showing diagnostic messages when the cursor is over the error
vim.diagnostic.config({
    virtual_text = false, -- Do not show the text in front of the error
    float = {
        border = "rounded",
    },
})
