<p align="center">
  <h1 align="center"><b>BASED</b> neovim config</h1>
</p>

Welcome to my **BASED** neovim configuration!

**BASED** means that my config is only one init.lua file no Lazy.nvim or other external package loaders dependencies.
You must have **neovim 0.12.0+** because it uses native plugin loading via `vim.pack.add()`.
So feel free to explore! It's well documented (I think) and self-explanatory.

Some of the keymaps taked from [vim.rtorr.com](https://vim.rtorr.com/) and also constantly updating when I explore new motions from help documentation `:h/:help`.

# Reference keymaps manual

### Leader Keymaps

Leader key = `<Space>`

| Key          | Action                               | Description                        |
| -----        | --------                             | -------------                      |
| `<leader>pv` | `:Ex`                                | Open netrw file explorer           |
| `<leader>sk` | `:ShowkeysToggle`                    | Toggle showkeys widget             |
| `<leader>O`  | `o<Esc>kO<Esc>j`                     | Add empty lines                    |
| `<leader>o`  | `init_selection`                     | Initialize incremental selection   |
| `<leader>i`  | `increment_node`                     | Incrementing initialized selection |
| `<leader>d`  | `decrement_node`                     | Decrementing initialized selection |
| `<leader>tn` | `tabnext`                            | Next tab                           |
| `<leader>tp` | `tabprevious`                        | Previous tab                       |
| `<leader>tc` | `tabclose`                           | Close tab                          |
| `<leader>to` | `tabnew`                             | Opens new tab                      |
| `<leader>ts` | `<cmd>lua MiniTrailspace.trim()<CR>` | Trim redundant spaces              |

### Buffer Switching

| Key   | Action     | Description     |
| ----- | --------   | -------------   |
| `gbn` | `:bnext`   | Next buffer     |
| `gbp` | `:bprev`   | Previous buffer |
| `gbd` | `:bdelete` | Delete buffer   |

### Improved Scrolling & Search

| Key     | Action    | Description                                |
| -----   | --------  | -------------                              |
| `<C-d>` | `<C-d>zz` | Scroll down and center cursor              |
| `<C-u>` | `<C-u>zz` | Scroll up and center cursor                |
| `n`     | `nzzzv`   | Next search result, center, open folds     |
| `N`     | `Nzzzv`   | Previous search result, center, open folds |

### Window Management

| Key             | Description                                                        |
| -----           | -------------                                                      |
| `<C-w> l`       | Move cursor to left window                                         |
| `<C-w> j`       | Move cursor to below window                                        |
| `<C-w> k`       | Move cursor to above window                                        |
| `<C-w> h`       | Move cursor to right window                                        |
| `<C-w><C-x>`    | Exchange current window with next one                              |
| `<C-w> H`       | Changes current window split state to right positon                |
| `<C-w> J`       | Changes current window split state to down positon                 |
| `<C-w> K`       | Changes current window split state to up positon                   |
| `<C-w> L`       | Changes current window split state to left positon                 |
| `<C-w> o`       | Closes all other windows except where cursor is                    |
| `<C-w> c(or q)` | Closes current window                                              |
| `<C-w> =`       | Make windows equally sized                                         |
| `<C-w> w`       | Move cursor to the focusable window below/right of the current one |
| `<C-w> v`       | Opens new window of the current buffer in the vertical split       |
| `<C-w> s`       | Opens new window of the current buffer in the horizontal split     |
| `<A-h>`         | Resize window right                                                |
| `<A-j>`         | Resize window down                                                 |
| `<A-k>`         | Resize window up                                                   |
| `<A-l>`         | Resize window left                                                 |

### Convenience

| Key                 | Action                           | Description                             |
| -----               | --------                         | -------------                           |
| `<C-Enter>`         | `o<Esc>`                         | New line below without insert mode      |
| `<C-Backspace>`     | `O<Esc>`                         | New line above without insert mode      |
| `<C-,>`             | `A,<Esc>`                        | Append comma at end of line             |
| `<C-;>`             | `A;<Esc>`                        | Append semicolon at end of line         |
| `=wb`               | `MiniTrailspace.trim()` + `gg=G` | Reindent all & trim trailing whitespace |
| `<Esc>`             | `:nohlsearch`                    | Clear search highlight                  |
| `<Esc><Esc>` (term) | `<C-\><C-n>`                     | Terminal: switch to normal mode         |

### Mini.nvim Mappings

| Key                       | Mode          | Action                           |
| -----                     | ------        | --------                         |
| `gcc`                     | Normal        | Toggle comment (MiniComment)     |
| `gc`                      | Visual        | Toggle comment (MiniComment)     |
| `H`                       | Visual        | Move selection left (MiniMove)   |
| `L`                       | Visual        | Move selection right (MiniMove)  |
| `J`                       | Visual        | Move selection down (MiniMove)   |
| `K`                       | Visual        | Move selection up (MiniMove)     |
| `ga + character to align` | Visual/Normal | Align text by character to align |
| `gX`                      | Visual/Normal | Exchanging text regions          |

### Fun stuff
So when you're using arrow keys it prints skill issue cause you use vim!
Arrow keys, mouse and other NOT efficient things are not respectful here >_<

| Key       | Action                  | Description        |
| -----     | --------                | -------------      |
| `<Up>`    | `print('skill issue?')` | Disabled arrow key |
| `<Down>`  | `print('skill issue?')` | Disabled arrow key |
| `<Left>`  | `print('skill issue?')` | Disabled arrow key |
| `<Right>` | `print('skill issue?')` | Disabled arrow key |

### Global

| Key                     | Description                                                 |
| -----                   | -------------                                               |
| `:h[elp] keyword`       | open help for keyword                                       |
| `:sav[eas] file`        | save file as                                                |
| `:clo[se]`              | close current pane                                          |
| `:ter[minal]`           | open a terminal window                                      |
| `:b[uffer] buffer_name` | edit buffer from the buffer list                            |
| `:fin[d] path_to_file`  | find file in 'path' and then :edit it. see also: 'findfunc' |
| `:ter[minal]`           | open a terminal window                                      |
| `K`                     | open man page for word under cursor                         |

### Macros

| Key   | Description            |
| ----- | -------------          |
| `qa`  | record macro a         |
| `q`   | stop recording macro   |
| `@a`  | run macro a            |
| `@@`  | rerun last run macro   |
| `5@q` | repeat macro q 5 times |

### Cursor movement

| Key           | Description                                                           |
| -----         | -------------                                                         |
| `h`           | move cursor left                                                      |
| `j`           | move cursor down                                                      |
| `k`           | move cursor up                                                        |
| `l`           | move cursor right                                                     |
| `gj`          | move cursor down (multi-line text)                                    |
| `gk`          | move cursor up (multi-line text)                                      |
| `H`           | move to top of screen                                                 |
| `M`           | move to middle of screen                                              |
| `L`           | move to bottom of screen                                              |
| `w`           | jump forwards to the start of a word                                  |
| `W`           | jump forwards to the start of a word (words can contain punctuation)  |
| `e`           | jump forwards to the end of a word                                    |
| `E`           | jump forwards to the end of a word (words can contain punctuation)    |
| `b`           | jump backwards to the start of a word                                 |
| `B`           | jump backwards to the start of a word (words can contain punctuation) |
| `ge`          | jump backwards to the end of a word                                   |
| `gE`          | jump backwards to the end of a word (words can contain punctuation)   |
| `%`           | move to matching character                                            |
| `0`           | jump to the start of the line                                         |
| `^`           | jump to the first non-blank character of the line                     |
| `$`           | jump to the end of the line                                           |
| `g_`          | jump to the last non-blank character of the line                      |
| `gg`          | go to the first line of the document                                  |
| `G`           | go to the last line of the document                                   |
| `5gg` or `5G` | go to line 5                                                          |
| `gd`          | move to local declaration                                             |
| `gD`          | move to global declaration                                            |
| `fx`          | jump to next occurrence of character x                                |
| `tx`          | jump to before next occurrence of character x                         |
| `Fx`          | jump to the previous occurrence of character x                        |
| `Tx`          | jump to after previous occurrence of character x                      |
| `;`           | repeat previous f, t, F or T movement                                 |
| `,`           | repeat previous f, t, F or T movement, backwards                      |
| `}`           | jump to next paragraph (or function/block, when editing code)         |
| `{`           | jump to previous paragraph (or function/block, when editing code)     |
| `zz`          | center cursor on screen                                               |
| `zt`          | position cursor on top of the screen                                  |
| `zb`          | position cursor on bottom of the screen                               |
| `Ctrl+e`      | move screen down one line (without moving cursor)                     |
| `Ctrl+y`      | move screen up one line (without moving cursor)                       |
| `Ctrl+b`      | move screen up one page (cursor to last line)                         |
| `Ctrl+f`      | move screen down one page (cursor to first line)                      |
| `Ctrl+d`      | move cursor and screen down 1/2 page                                  |
| `Ctrl+u`      | move cursor and screen up 1/2 page                                    |

### Insert mode

| Key               | Description                                                  |
| -----             | -------------                                                |
| `i`               | insert before the cursor                                     |
| `I`               | insert at the beginning of the line                          |
| `a`               | insert (append) after the cursor                             |
| `A`               | insert (append) at the end of the line                       |
| `o`               | append (open) a new line below the current line              |
| `O`               | append (open) a new line above the current line              |
| `ea`              | insert (append) at the end of the word                       |
| `Ctrl+h`          | delete the character before the cursor during insert mode    |
| `Ctrl+w`          | delete word before the cursor during insert mode             |
| `Ctrl+j`          | add a line break at the cursor position during insert mode   |
| `Ctrl+t`          | indent (move right) line one shiftwidth during insert mode   |
| `Ctrl+d`          | de-indent (move left) line one shiftwidth during insert mode |
| `Ctrl+n`          | insert (auto-complete) next match before the cursor          |
| `Ctrl+p`          | insert (auto-complete) previous match before the cursor      |
| `Ctrl+rx`         | insert the contents of register x                            |
| `Ctrl+ox`         | temporarily enter normal mode to issue one command x         |
| `Esc` or `Ctrl+c` | exit insert mode                                             |

### Editing

| Key      | Description                                                  |
| -----    | -------------                                                |
| `r`      | replace a single character                                   |
| `R`      | replace more than one character, until Esc is pressed        |
| `J`      | join line below to the current one with one space in between |
| `gJ`     | join line below to the current one without space in between  |
| `gwip`   | reflow paragraph                                             |
| `g~`     | switch case up to motion                                     |
| `gu`     | change to lowercase up to motion                             |
| `gU`     | change to uppercase up to motion                             |
| `cc`     | change (replace) entire line                                 |
| `c$`     | change (replace) to the end of the line                      |
| `ciw`    | change (replace) entire word                                 |
| `cw`     | change (replace) to the end of the word                      |
| `s`      | delete character and substitute text (same as cl)            |
| `S`      | delete line and substitute text (same as cc)                 |
| `xp`     | transpose two letters (delete and paste)                     |
| `u`      | undo                                                         |
| `U`      | restore (undo) last changed line                             |
| `Ctrl+r` | redo                                                         |
| `.`      | repeat last command                                          |
| `Ctrl+a` | increases the number                                         |
| `Ctrl+x` | decreases the number                                         |

### Marking text (visual mode)

| Key                    | Description                                       |
| -----                  | -------------                                     |
| `v`                    | start visual mode, mark lines, then do a command  |
| `V`                    | start linewise visual mode                        |
| `gv`                   | reselect previous selection                       |
| `o`                    | move to other end of marked area                  |
| `Ctrl+v`               | start visual block mode                           |
| `O`                    | move to other corner of block                     |
| `aw`                   | mark a word                                       |
| `ab`                   | a block with ()                                   |
| `aB`                   | a block with {}                                   |
| `at`                   | a block with <> tags                              |
| `ib`                   | inner block with ()                               |
| `iB`                   | inner block with {}                               |
| `it`                   | inner block with <> tags                          |
| `Esc` or `Ctrl+c`      | exit visual mode                                  |
| `Ctrl+v -> g+ctrl+a/x` | Inc/Decr sequence of numbers in visual block mode |

### Visual commands

| Key  | Description                           |
| ---  | -------------                         |
| `>`  | shift text right                      |
| `<`  | shift text left                       |
| `y`  | yank (copy) marked text               |
| `d`  | delete marked text                    |
| `~`  | switch case                           |
| `u`  | change marked text to lowercase       |
| `U`  | change marked text to uppercase       |
| `gv` | reselect the previously selected text |

### Registers

| Key    | Description                              |
| -----  | -------------                            |
| `:reg` | show registers content                   |
| `"xy`  | yank into register x                     |
| `"xp`  | paste contents of register x             |
| `"+y`  | yank into the system clipboard register  |
| `"+p`  | paste from the system clipboard register |

### Cut and paste

| Key           | Description                                                         |
| -----         | -------------                                                       |
| `yy`          | yank (copy) a line                                                  |
| `2yy`         | yank (copy) 2 lines                                                 |
| `yw`          | yank the characters of the word from cursor to start of next word   |
| `yiw`         | yank (copy) word under the cursor                                   |
| `yaw`         | yank word under the cursor and the space after or before it         |
| `y$`          | yank (copy) to end of line                                          |
| `p`           | put (paste) the clipboard after cursor                              |
| `P`           | put (paste) before cursor                                           |
| `gp`          | put after cursor and leave cursor after the new text                |
| `gP`          | put before cursor and leave cursor after the new text               |
| `dd`          | delete (cut) a line                                                 |
| `2dd`         | delete (cut) 2 lines                                                |
| `dw`          | delete the characters of the word from cursor to start of next word |
| `diw`         | delete (cut) word under the cursor                                  |
| `daw`         | delete word under the cursor and the space after or before it       |
| `:3,5d`       | delete lines starting from 3 to 5                                   |
| `:g/{pat}/d`  | delete all lines containing pattern                                 |
| `:g!/{pat}/d` | delete all lines not containing pattern                             |
| `d$`          | delete (cut) to the end of the line                                 |
| `x`           | delete (cut) character                                              |

### Indent text

| Key    | Description                                       |
| -----  | -------------                                     |
| `>>`   | indent (move right) line one shiftwidth           |
| `<<`   | de-indent (move left) line one shiftwidth         |
| `>%`   | indent a block with () or {} (cursor on brace)    |
| `<%`   | de-indent a block with () or {} (cursor on brace) |
| `>ib`  | indent inner block with ()                        |
| `>at`  | indent a block with <> tags                       |
| `3==`  | re-indent 3 lines                                 |
| `=%`   | re-indent a block with () or {} (cursor on brace) |
| `=iB`  | re-indent inner block with {}                     |
| `gg=G` | re-indent entire buffer                           |
| `]p`   | paste and adjust indent to current line           |

### Exiting

| Key              | Description                               |
| -----            | -------------                             |
| `:w`             | write (save) the file, but don't exit     |
| `:w !sudo tee %` | write out the current file using sudo     |
| `:wq` or `ZZ`    | write (save) and quit                     |
| `:q`             | quit (fails if there are unsaved changes) |
| `:q!` or `ZQ`    | quit and throw away unsaved changes       |
| `:wqa`           | write (save) and quit on all tabs         |

### Search and replace

| Key              | Description                                                          |
| -----            | -------------                                                        |
| `/pattern`       | search for pattern                                                   |
| `?pattern`       | search backward for pattern                                          |
| `\vpattern`      | 'very magic' pattern: no escaping needed                             |
| `n`              | repeat search in same direction                                      |
| `N`              | repeat search in opposite direction                                  |
| `:%s/old/new/g`  | replace all old with new throughout file                             |
| `:%s/old/new/gc` | replace all old with new throughout file with confirmations          |
| `:noh`           | remove highlighting of search matches                                |
| `*`              | search forward for the occurrence of the word nearest to the cursor  |
| `#`              | same as "*", but search backward                                     |

### Search in multiple files

| Key                   | Description                                  |
| -----                 | -------------                                |
| `:vim[grep] /pat/ {}` | search for pattern in multiple files         |
| `:cn`                 | jump to the next match                       |
| `:cp`                 | jump to the previous match                   |
| `:cope`               | open a window containing the list of matches |
| `:ccl`                | close the quickfix window                    |

### Tabs

| Key              | Description                                           |
| -----            | -------------                                         |
| `:tabnew`        | open a file in a new tab                              |
| `Ctrl+wT`        | move the current split window into its own tab        |
| `gt`             | move to the next tab                                  |
| `gT`             | move to the previous tab                              |
| `#gt`            | move to tab number #                                  |
| `:tabm #`        | move current tab to the #th position (indexed from 0) |
| `:tabc`          | close the current tab and all its windows             |
| `:tabo`          | close all tabs except for the current one             |
| `:tabdo command` | run the command on all tabs                           |

### Working with multiple files

| Key        | Description                                             |
| -----      | -------------                                           |
| `:e file`  | edit a file in a new buffer                             |
| `:bn`      | go to the next buffer                                   |
| `:bp`      | go to the previous buffer                               |
| `:bd`      | delete a buffer (close a file)                          |
| `:b #`     | go to a buffer by index #                               |
| `:b file`  | go to a buffer by file                                  |
| `:ls`      | list all open buffers                                   |
| `:sp file` | open a file in a new buffer and split window            |
| `:vs file` | open a file in a new buffer and vertically split window |
| `:vert ba` | edit all buffers as vertical windows                    |
| `:tab ba`  | edit all buffers as tabs                                |
| `Ctrl+ws`  | split window                                            |
| `Ctrl+wv`  | split window vertically                                 |
| `Ctrl+ww`  | switch windows                                          |
| `Ctrl+wq`  | quit a window                                           |
| `Ctrl+w=`  | make all windows equal height & width                   |

### Different

| Key                      | Description                                                                                                                       |
| -----                    | -------------                                                                                                                     |
| `zf`                     | manually define a fold up to motion                                                                                               |
| `zd`                     | delete fold under the cursor                                                                                                      |
| `za`                     | toggle fold under the cursor                                                                                                      |
| `zo`                     | open fold under the cursor                                                                                                        |
| `zc`                     | close fold under the cursor                                                                                                       |
| `zr`                     | reduce (open) all folds by one level                                                                                              |
| `zm`                     | fold more (close) all folds by one level                                                                                          |
| `zi`                     | toggle folding functionality                                                                                                      |
| `]c`                     | jump to start of next change                                                                                                      |
| `[c`                     | jump to start of previous change                                                                                                  |
| `do`                     | obtain (get) difference (from other buffer)                                                                                       |
| `dp`                     | put difference (to other buffer)                                                                                                  |
| `:diffthis`              | make current window part of diff                                                                                                  |
| `:dif`                   | update differences                                                                                                                |
| `:diffoff`               | switch off diff mode for current window                                                                                           |
| `:read[r] file.c`        | inserts the text from the file.c                                                                                                  |
| `:r !shell_command`      | inserts the output info from the shell_command                                                                                    |
| `:put x`                 | put the text from register x after the cursor                                                                                     |
| `:reg`                   | open register contents history                                                                                                    |
| `Ctrl+f in command mode` | opens additional buffer when you can continue to type commands with all the motions available                                     |
| `Ctrl+]`                 | jump to the definition of the keyword under the cursor. same as ":tag {name}", where {name} is the keyword under or after cursor. |
| `Ctrl+T`                 | jump to count older entry in the tag stack                                                                                        |
| `g]`                     | like ctrl-], but use ":tselect" instead of ":tag"                                                                                 |


### Documentation commands(Mostly multi repeat/search and replace/patterns topics)

| Topic              | Vim help                   | What it covers                                        |
| ---------------    | -----------------          | ----------------------------------------------------- |
| `:g` (global)      | `:help :g`                 | Pattern-based multi-line command execution            |
| `:normal`          | `:help :normal`            | Execute Normal mode commands from command-line        |
| `:s` (substitut)   | `:help :s`                 | Search & replace syntax                               |
| Pattern/atoms      | `:help pattern`            | All regex atoms, quantifiers, magic                   |
| Character classes  | `:help /character-classes` | `\s`, `\d`, `\w`, `\a`, `\l`, `\u`, `\x`              |
| Quantifiers        | `:help /multi`             | `*`, `\+`, `\=`, `\{n,m}`, `\{-}`                     |
| Groups & capture   | `:help /\(\)`              | `\(\)`, `\|` (alternation), `\1`                      |
| Backreferences     | `:help /\1`                | `\1` – `\9`                                           |
| Pattern atoms list | `:help pattern-atoms`      | All pattern atoms by category (ordinary, multi, etc.) |
| Range syntax       | `:help range`              | Line ranges (`.`, `$`, `%`, `'<,'>`, etc.)            |
| Flags for `:s`     | `:help :s_flags`           | `g`, `c`, `i`, `I`, `n`, `e`, ...                     |
| Macros/registers   | `:help registers`          | Recording (`q`), replay (`@`), registers              |

### File Managament(Dired)

| Key                 | Description                                                    |
| ------------------- | ---------------------------------------------------            |
| `<CR>`              | Open the file or directory at the cursor.                      |
| `d`                 | Create new directories and files.                              |
| `M`                 | Mark directories and files (both in normal and visual mode).   |
| `C`                 | Copy files.                                                    |
| `X`                 | Move files.                                                    |
| `P`                 | Paste files in the current directory.                          |
| `D`                 | Delete directories and files (both in normal and visual mode). |
| `R`                 | Rename directories and files.                                  |
| `MD`                | Delete marked files.                                           |
| `MC`                | Copy marked files.                                             |
| `MX`                | Move marked files.                                             |
| `_`                 | Go to the parent directory.                                    |
| `-`                 | Go back to previous directory.                                 |
| `!`                 | Apply any command to directories/files under cursor.           |
| `&`                 | Apply any command to marked directories and files.             |
| `.`                 | Toggle show_hidden.                                            |
| `,`                 | Change sort_order.                                             |
| `c`                 | Toggle colors.                                                 |
| `*`                 | Toggle filetype icons.                                         |
| `(`                 | Toggle hiding/showing file details.                            |
| `q`                 | Quit the 'dired' interface.                                    |

