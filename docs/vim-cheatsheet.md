# Vim Cheat Sheet

## Movements and insert

This commands are for normal mode:

| Command | Action |
|:-------:|:--------|
| `w` | Beginning of the next word |
| `b` |	Beginning of the previous word |
| `e` |	End of the next word |
| `$` |	End of line |
| `f<char>` |	Go to forward to the next character. Pe. fx |
| `{` |	Go to previous paragraph (empty line) |
| `}` |	Go to next paragraph (empty line) |
| `A` |	Add text at the end of the line |
| `I` |	Add text at the beginning of the line |
| `zz` |	Place the current line in the middle of the editor window |
| `z<enter>` |	Place the current line at the top of the editor window |

## Advanced movement commands

All this commands are for normal mode:

| Command | Action |
|:-------:|:--------|
| `gg` |	Go to beginning of file |
| `G` |	Go to end of file |
| `<C-f>` |	Page Down (Page Forward) |
| `<C-b>` |	Page Up (Page Backward) |
| `gd` |	Go to definition of word or function in current file |
| `gf` |	To to definition in other file |
| `16G` |	Go to line 16 |
| `<C-o>` |	Previous position or previous buffer (useful when using gd or gf) |
| `<C-i>` |	Next position or next buffer |

## Advanced save
This commands are for normal mode:

| Command | Action |
|:-------:|:--------|
| `#,#w file-name.txt` |	Saves part of a file to a new file |
| `:r file-name.txt` |	Inserts contents of file-name.txt in current position |

## Delete Undo/Redo
This commands are for normal mode:

| Command | Action |
|:-------:|:--------|
| `x` |	Cut (Works in visual mode too) |
| `s` |	Cut (Substitute) char and place in insert mode |
| `de` |	Delete to end of word |
| `d0` |	Delete to the beginning of the line |
| `db` |	Delete back |
| `dfx` |	Delete until the next x |
| `:.,$d` |	Delete until the end of the buffer |
| `u` |	Undo |
| `U` |	Undo on the whole line |
| `<C-r>` |	Redo |

## Repeat
Most commands, when preceded by a number, are executed multiple times:

| Command | Action |
|:-------:|:--------|
| `6dw` |	Delete next 6 words |
| `6dd` |	Delete next 6 lines |
| `.	Redo` | last change action |
| `;	Redo` | last character find f{char} |

## Clipboard
| Command | Action |
|:-------:|:--------|
|`y<movement>` |	Copy (Yank). <movement> can be h, j, l, k, w, e, $, 0 |
|`p` |	Paste it after the cursor |
|`dd` |	Delete line |
|`O` |	Paste over the current line |
|`P` |	Paste under the current line |

The last 2 command work to add a new line before or after the current line if you haven't yanked anything yet

# Registers
It's like a clipboard history

| Command | Action |
|:-------:|:--------|
|`:reg, :reg [char]` |	List registers. Show contents of one register |
|`"<char>p` |	Paste contents of register. Pe. "rp register r. "2p Pastes register 2 |
|`"<char>y` |	Yank text to the named register <char>. Pe "ry |
|`"<char>x` |	Cut text to register |
|`<C-r><char>` |	Paste the contents of register in insert mode |
|`""` |	The register used when Copy (y), Cut (x) or Substitute (s) |
|`"0-"9` |	Last yanked elements being "0 the newest ( "0p is the same as p) |
|`"%` |	Current file path starting from the project root |

- When you create a macro with q, p.e. qw, the steps of the macro will be sotred in the register w
- :let @W='i;' (Uppercase W) will append a new step to the register w (lowercase w)

## Changes
| Command | Action |
|:-------:|:--------|
|`r` |	Replace current character |
|`R` |	Overwrite content (replace) until you escape |
|`ciw` |	Change Inside word no matter the position |
|`cip` |	Change Inside paragraph (between empty lines) no matter the position |
|`ci)` |	Change (inside) the contents until the next ) |

## Folding
| Command | Action |
|:-------:|:--------|
|`zi` |	Fold enable |
|`zf2j` |	Fold the next 2 lines |
|`:20,40 fo` |	Fold from line 20 to 40 |
|`zfa}` |	Fold until the next } |
|`zo zO` |	Open current fold. Open recursively |
|`zc zC` |	Close current fold. Close recursively |
|`za zA` |	Toggle current fold. Toggle recursively |
|`zm zM` |	Reduce fold level by one. Close all folds |
|`zr zR` |	Increase fold level by one. Increase recursively |

- With set foldmethod=marker the {{{ and }}} symbols will be used as markers
- Use foldlevel (pe foldlevel=99) to fold all levels

## Search
| Command | Action |
|:-------:|:--------|
|`/` |	Search |
|`?` |	Search backwards |
|`*` |	Search for the word under the cursor |
|`n` |	Next result |
|`N` |	Previous result |

## Search & Replace
| Command | Action |
|:-------:|:--------|
|`:s/original/new/g` |	Search and replace in the complete line |
|`:%s/original/new/gc` |	Search in all document asking if do the change (c) |

## Visual
| Command | Action |
|:-------:|:--------|
|`v` |	Start the visual (Use jkhl to move the selection) |
|`v$` |	Select until the end of line |
|`vip` |	Select current paragraph (content between empty lines) |
|`V` |	Visual the complete line (Use jk to move the selection) |

## Splits
| Command | Action |
|:-------:|:--------|
|`:sp, :vs` |	Split and Vertical split |
|`:only` |	Focus on a splt |
|`gi` |	Open in split in NERDTree |

## QuickFix and Location List
| Command | Action |
|:-------:|:--------|
|`:copen` |	Open error list |
|`:cclose` |	Close error list |
|`:cnext` |	Go to next error |

## Debug utilities
| Command | Action |
|:-------:|:--------|
|`Ctrl-g` |	Show file status |
|`:verbose` | imap <tab>	Find if the <tab> key is defined |
|`:verbose` | imap <C-p>	Find if the <ctrl>p key is defined |
|`:lopen, :lclose` |	Open/closes the location list. Used by plugins like ALE to show a list of errors |
|`:copen, :close` |	Open/Closes/Focuses the list of errors |

## Native Autocomplete
| Command | Action |
|:-------:|:--------|
|`<C-x><C-p>` |	Autocomplete with an already present word |

- Native autocomplete works by searching the current buffer

## Sessions
| Command | Action |
|:-------:|:--------|
|`:mks <path>` |	Saves the current session to a path. Better if it's a hidden dir |

## Markers and Macros
| Command | Action |
|:-------:|:--------|
|`m<character>` |	Creates a marker with the name `<character` |
|`'<character>` |	Jumps to marker. (Use backtick to include column ) |

## Spell
Spell needs to have set spell option active on .vimrc and optionally use set spelllang=en_us. I use es_co for Spanish Colombia.

Command	Action
| Command | Action |
|:-------:|:--------|
| `z=` |	Search for alternatives of the current word |
| `zg` |	Add current word to dictionary |
| `zw` |	Remove current word from dictionary |
| `]s` |	Jump to next spell error |
| `[s` |	Jump to previous spell error |
