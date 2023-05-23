return {
  "MunifTanjim/prettier.nvim",
  config = function()
    require("prettier").setup {
      bin = 'prettierd',
      formatCommand = 'prettierd "${INPUT}"',
      formatStdin = true,
      filetypes = {
        "css", "graphql", "html", "javascript", "javascriptreact", "json", "less", "markdown", "scss", "typescript",
        "typescriptreact", "vue", "yaml"
      },
    }
  end,
}
