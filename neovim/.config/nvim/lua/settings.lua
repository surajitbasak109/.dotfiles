local g = vim.g
local cmd = vim.cmd
local o = vim.o
local fn = vim.fn
local wo = vim.wo
local opt = vim.opt

cmd('set iskeyword+=-') -- treat dash separated words as a word text object
opt.shortmess:append{c = true, I = true}
cmd('set icm=split') -- Make substitution work in real time
opt.shada:append{':1000', '/1000'}
o.hidden = true -- Required to keep multiple buffers open multiple buffers
o.title = true
TERMINAL = fn.expand('$TERMINAL')
cmd('let &titleold="'..TERMINAL..'"')
o.titlestring="%<%F%=%l/%L - nvim"
cmd('set ww+=<,>,[,],h,l') -- move to next line with theses keys
cmd('syntax on') -- re-enable syntax highlighting
o.pumblend = 20 -- adds transparency to the pop menu
o.pumheight=10 -- makes p[op]-u[p]-m[enu] smaller
o.fenc = 'utf-8' -- set file encoding to utf8
o.ch = 2 -- more space for displaying messages (c[ommand]h[eight])
cmd('set cc=99999') -- fix indentation for now (c[olor]c[olumn])
o.sb = true -- Horizontal splits will automatically be below
o.tgc = true -- set term gui color (24-bit RGB color) that most terminals supports this
o.spr = true -- Vertical splits will automatically be to the right
opt.cole = 2 -- conceallevel, so that I can see `` in md files

-- Cursor
opt.cursorline = true
o.mouse = 'a' -- enable mouse
--[[
opt.guicursor = {
    'n-v-c:block',
    'i-ci-ve:ver25',
    'r-cr:hor20',
    'o:hor50',
    'a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor',
    'sm:block-blinkwait175-blinkoff150-blinkon175',
}
--]]
o.virtualedit = 'block'

-- Indent settings
o.expandtab = true -- expandtab, Converts tabs to spaces
o.shiftwidth = 4 -- Change the number of space characters inserted for indentation
opt.ts = 4 -- insert 2 spaces for a tab
opt.sts = 4 -- softtabstop
o.wrap = false -- Display long lines as just one line
-- [comment below if you want to use smart indent]
opt.ai = true -- set auto indent
opt.ci = true -- set copy indent
-- [Uncomment below if you want to use smart indent]
-- opt.si = true

wo.nu = true -- set numbered lines
wo.rnu = true -- set relative numbers
o.stal = 2 -- showtabline, always show tabs
o.smd = false -- showmode, We don't need to see things like -- INSERT -- anymore
o.backup = false -- This is recommended by coc
o.writebackup = false -- This is recommended by coc
wo.scl = "yes" -- signcolumn, always show the signcolumn, otherwise it would shift the text each time
-- opt.lazyredraw = true
o.updatetime = 300 -- Faster completion
o.timeoutlen = 300 -- By default timeoutlen is 1000 ms

-- Enable system clipboard by default
opt.clipboard = "unnamedplus"

-- GUI Font (guifont)
o.gfn = "'JetBrainsMono Nerd Font Mono', Victor Mono Medium, Operator Mono Lig, Operator Mono Book, Fira Code Retina, Consolas, 'Courier New', monospace" 

-- Default shell is zsh
o.shell = "/bin/zsh"

-- Completion (completeopt)
opt.cot = "menu,menuone,noselect"

-- Fillchars
vim.opt.fillchars = {
  vert = "│",
  fold = "⠀",
  eob = " ", -- suppress ~ at EndOfBuffer
  --diff = "⣿", -- alternatives = ⣿ ░ ─ ╱
  msgsep = "‾",
  foldopen = "▾",
  foldsep = "│",
  foldclose = "▸",
}

o.grepprg = 'rg --vimgrep --no-heading --smart-case'
o.formatprg = 'prettier --stdin-filepath=%'

g.netrw_keepdir=0
-- If already installed nvim-tree then disable the netrw file explorer
-- disable netrw at the very start of your init.lua (strongly advised)
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Set map leader to space
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true})
g.mapleader = ' '
