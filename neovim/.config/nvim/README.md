# NeoVim Configuration with Lua

Before setting up our `nvim` configuration we need to learn about :Explore. I just need to know about basic operations in netrw file explorer.

So to create file we can press `%` in normal mode when the file browser is open. It will prompt for a file name, and we need to add a file whatever we want i.e. foo.txt. And when we hit enter after writing the file name with the extension the file will open in a new buffer screen.

One thing to remember that if you have more than one window/pane open you can navigate them using `<c-w><c-w>` where `c` is `CTRL` in your keyboard.

Now if you want to rename or move your file you can press 'R' in the file browser when your cursor is on the file. When prompted you can rename that file or move it to the other directory.

Now if I need to create a directory I can simply press `d` and when prompted I will write the directory name and hit enter.

__Note__: You will notice that when you navigate to a directory and create a file it will create that file inside your working directory not in the sub directory you just visited. So, to prevent that you can set in your vimrc file i.e. init.lua file:

```lua
vim.g.netrw_keepdir=0
```

Please check [Awesome neovim plugins](https://github.com/rockerBOO/awesome-neovim) for more...

## Installed Plugins

| Plugin         | Description  | Dependencies |
|----------------|:--------------:|-----------|
| [which-key.nvim](https://github.com/folke/which-key.nvim) | displays a popup with possible key bindings of the command you started typing |  |
| [ZenMode](https://github.com/folke/zen-mode.nvim) | Distraction-free coding |  |
| [noice.nvim](https://github.com/folke/noice.nvim) | Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu. | [MunifTanjim/nui.nvim](https://github.com/MunifTanjim/nui.nvim) <br> [rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify)|
| [folke/twilight.nvim](https://github.com/folke/twilight.nvim) | dims inactive portions of the code you're editing using TreeSitter. |  |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | is a highly extendable fuzzy finder over lists. Built on the latest awesome features from neovim  core. Telescope is centered around modularity, allowing for easy customization. |  |
| [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) | A dark and light Neovim theme written in Lua ported from the Visual Studio Code TokyoNight theme |  |
| [nord.nvim](https://github.com/shaunsingh/nord.nvim) | Nord.nvim is meant to be a modern colorscheme written in lua for NeoVim that supports a lot of the new features added to NeoVim like built-in LSP and TreeSitter |  |
| [dracula](https://github.com/dracula/vim) | Dracula theme |  |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | Add fancy indent markers, which integrate nicely with treesitter and shows the current context |  |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | A blazing fast and easy to configure Neovim statusline written in Lua. | [lualine-lsp-progress](https://github.com/arkav/lualine-lsp-progress) <br/> [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) <br/> [github-notifications.nvim](https://github.com/rlch/github-notifications.nvim) |
| [fidget.nvim](https://github.com/j-hui/fidget.nvim) | Standalone UI for nvim-lsp progress. Eye candy for the impatient. |  |
| [nvim-colorizer](https://github.com/norcalli/nvim-colorizer.lua) | A high-performance color highlighter for Neovim |  |
| [squlite.lua](https://github.com/kkharji/sqlite.lua) | SQLite/LuaJIT binding and a highly opinionated wrapper for storing, retrieving, caching, and persisting SQLite databases. | Install package in debian based OS: `sudo apt-get install sqlite3 libsqlite3-dev # Ubuntu` |
| [nvim-neoclip.lua](https://github.com/AckslD/nvim-neoclip.lua) | Clipboard manager for neovim | [squlite.lua](https://github.com/kkharji/sqlite.lua) |
| [telescope-frecency.nvim](https://github.com/nvim-telescope/telescope-frecency.nvim) | A telescope.nvim extension that offers intelligent prioritization when selecting files from your editing history. | [squlite.lua](https://github.com/kkharji/sqlite.lua) |
| [suda.vim](https://github.com/lambdalisue/suda.vim) | is a plugin to read or write files with sudo command. |  |
| [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) | Preview markdown on your modern browser with synchronised scrolling and flexible configuration |  |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | File browser |  |
| [karb94/neoscroll.nvim](https://github.com/karb94/neoscroll.nvim) | A smooth scrolling for neovim |  |
| [lewis6991/gitsigns.nvim](https://github.comlewis6991/gitsigns.nvim) | Git integration for buffers |  |
| [vim-commentary](https://github.comtpope/vim-commentary) | Comment stuff out |  |
| [vim-fugitive](https://github.comtpope/vim-fugitive) | The git plugin so good, it should be illegal |  |
| [vim-rhubarb](https://github.com/tpope/vim-rhubarb) | GitHub extension for fugitive.vim |  |
| [vim-surround](https://github.com/tpope/vim-surround) | Quoting/parenthesizing made simple |  |
| [pear-tree](https://github.com/tmsvg/pear-tree) | A painless, powerful Vim auto-pair plugin. |  |
| [vCoolor.vim](https://github.com/KabbAmine/vCoolor.vim) | vCoolor is a Vim plugin that allows using a color picker/selector directly from the editor. |  |
| []() |  |  |
| []() |  |  |
| []() |  |  |
| []() |  |  |

## Useful Articles
[Writing useful lua functions to my neovim](https://dev.to/voyeg3r/writing-useful-lua-functions-to-my-neovim-14ki)
