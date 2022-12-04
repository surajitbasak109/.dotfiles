local present, null_ls = pcall(require, "null-ls")
local utils = require('null-ls.utils')

if not present then
    return
end

null_ls.setup({
    root_dir = utils.root_pattern("composer.json", "package.json", "Makefile", ".git"), -- Add composer
    diagnostics_format = "#{m} (#{c}) [#{s}]",    -- Makes PHPCS errors more readeable
    sources = {
        null_ls.builtins.completion.spell,        -- You still need to execute `:set spell`
        null_ls.builtins.diagnostics.eslint,      -- Add eslint to js projects
        null_ls.builtins.diagnostics.phpcs.with({ -- Change how the php linting will work
            prefer_local = "vendor/bin",
        }),
        null_ls.builtins.formatting.stylua,       -- You need to install stylua first: `brew install stylua`
        null_ls.builtins.formatting.phpcbf.with({ -- Use the local installation first
            prefer_local = "vendor/bin",
        }),
    }
})
