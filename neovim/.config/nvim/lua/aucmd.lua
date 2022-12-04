-- Highlight on yank
vim.cmd([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]])

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
