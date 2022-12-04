local present, indentBlankline = pcall(require, "indent-blankline")

if not present then
    return
end

vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

indentBlankline.setup {
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
    filetype_exclude = {
        "startify",
        "dashboard",
        "dotooagenda",
        "log",
        "fugitive",
        "gitcommit",
        "packer",
        "vimwiki",
        "markdown",
        "json",
        "txt",
        "vista",
        "help",
        "todoist",
        "NvimTree",
        "peekaboo",
        "git",
        "TelescopePrompt",
        "undotree",
        "flutterToolsOutline",
        "", -- for all buffers without a file type
    },
    buftype_exclude = { "help", "terminal", "nofile" },
    use_treesitter = true,
    show_current_context = true,
    max_indent_increase = 1,
    context_patterns = {
        "table",
        "class",
        "function",
        "method",
        "^if",
        "while",
        "for",
        "with",
        "func_literal",
        "block",
        "try",
        "except",
        "argument_list",
        "object",
        "dictionary",
        "element",
    },
    space_char_blankline = " ",
}
