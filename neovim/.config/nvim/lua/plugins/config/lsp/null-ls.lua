local present, null_ls = pcall(require, 'null-ls')
local utils = require('null-ls.utils')

if not present then
    return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- npm install --save-dev prettier

null_ls.setup({
    debug = false,
    root_dir = utils.root_pattern('composer.json', 'package.json', 'Makefile', '.git'), -- Add composer
    diagnostics_format = '#{m} (#{c}) [#{s}]', -- Makes PHPCS errors more readeable
    sources = {
        formatting.prettier.with({
            extra_filetypes = { 'toml', 'solidity' },
            extra_args = { '--no-semi', '--single-quote', '--jsx-single-quote' },
        }),
        null_ls.builtins.completion.spell, -- You still need to execute `:set spell`
        diagnostics.eslint, -- Add eslint to js projects
        diagnostics.phpcs.with({ -- Change how the php linting will work
            prefer_local = 'vendor/bin',
        }),
        formatting.stylua, -- You need to install stylua first: `brew install stylua`
        formatting.phpcbf.with({ -- Use the local installation first
            prefer_local = 'vendor/bin',
        }),
    },
})
