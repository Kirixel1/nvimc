<p align="center">
  <h1 align="center">Neovim Configuration</h1>
</p>

Welcome to my minimal Neovim configuration!

**Minimal** — only two files (one really, the other is just a note) and no
Lazy.nvim or other package loaders. You must have **Neovim 0.12.0+** because
it uses native plugin loading via `vim.pack.add()`.
So feel free to explore! It's well documented (I think) and self-explanatory,
so nothing too difficult.

<p align="center">
  <h1 align="center">Neovim Sheet Note</h1>
</p>


This Note is divided on two section:
1. Config special key bindings
2. Motions. All the vim motions/operators/keys that I'm using and some not(all taked from this site: [vim.rtorr.com](https://vim.rtorr.com/) and puted into Motions section)

# Config special key bindings

### Leader Keymaps

Leader key = `<Space>`

| Key          | Action                     | Description                         |
| -----        | --------                   | -------------                       |
| `<leader>pv` | `:Ex`                      | Open netrw file explorer            |
| `<leader>it` | `:InspectTree`             | Open tree-sitter inspection buffer  |
| `<leader>sk` | `:ShowkeysToggle`          | Toggle showkeys widget              |
| `<leader>O`  | `o<Esc>kO<Esc>j`           | Add empty lines                     |
| `<leader>ff` | `fzf-lua.files()`          | Find files (FZF)                    |
| `<leader>fg` | `fzf-lua.live_grep()`      | Live grep (FZF)                     |
| `<leader>fb` | `fzf-lua.buffers()`        | List buffers (FZF)                  |
| `<leader>fh` | `fzf-lua.help_tags()`      | Search help tags (FZF)              |

### Buffer Switching

| Key             | Action     | Description                                                     |
| -----           | --------   | -------------                                                   |
| `gbn`           | `:bnext`   | Next buffer                                                     |
| `gbp`           | `:bprev`   | Previous buffer                                                 |
| `gbd`           | `:bdelete` | Delete buffer                                                   |
| `Ctrl+w Ctrl+x` |            | Swap windows places(between two buffers of the same split type) |
| `Ctrl+w H`      |            | Changes current window split state to right positon             |
| `Ctrl+w J`      |            | Changes current window split state to down positon              |
| `Ctrl+w K`      |            | Changes current window split state to up positon                |
| `Ctrl+w L`      |            | Changes current window split state to left positon              |

### Improved Scrolling & Search

| Key     | Action    | Description                                |
| -----   | --------  | -------------                              |
| `<C-d>` | `<C-d>zz` | Scroll down and center cursor              |
| `<C-u>` | `<C-u>zz` | Scroll up and center cursor                |
| `n`     | `nzzzv`   | Next search result, center, open folds     |
| `N`     | `Nzzzv`   | Previous search result, center, open folds |

### Window Management

| Key     | Action                | Description          |
| -----   | --------              | -------------        |
| `<C-h>` | `<C-w><C-h>`          | Move to left window  |
| `<C-j>` | `<C-w><C-j>`          | Move to below window |
| `<C-k>` | `<C-w><C-k>`          | Move to above window |
| `<C-l>` | `<C-w><C-l>`          | Move to right window |
| `<A-h>` | `:vertical resize +9` | Resize window right  |
| `<A-j>` | `:resize +6`          | Resize window down   |
| `<A-k>` | `:resize -6`          | Resize window up     |
| `<A-l>` | `:vertical resize -9` | Resize window left   |

### Convenience

| Key                 | Action                            | Description                             |
| -----               | --------                          | -------------                           |
| `<C-Enter>`         | `o<Esc>`                          | New line below without insert mode      |
| `<C-Backspace>`     | `O<Esc>`                          | New line above without insert mode      |
| `<C-,>`             | `A,<Esc>`                         | Append comma at end of line             |
| `<C-;>`             | `A;<Esc>`                         | Append semicolon at end of line         |
| `==`                | `MiniTrailspace.trim()` + `ggVG=` | Reindent all & trim trailing whitespace |
| `<Esc>`             | `:nohlsearch`                     | Clear search highlight                  |
| `<Esc><Esc>` (term) | `<C-\><C-n>`                      | Terminal: switch to normal mode         |

### LSP Keymaps

| Key          | Action                            | Description                     |
| -----        | --------                          | -------------                   |
| `gd`         | `vim.lsp.buf.definition`          | Go to definition                |
| `gr`         | `vim.lsp.buf.references`          | Go to references                |
| `gI`         | `vim.lsp.buf.implementation`      | Go to implementation            |
| `<leader>rn` | `vim.lsp.buf.rename`              | Rename symbol                   |
| `K`          | `vim.lsp.buf.hover()`             | Hover documentation             |
| `[d`         | `vim.diagnostic.jump({count=-1})` | Previous diagnostic             |
| `]d`         | `vim.diagnostic.jump({count=1})`  | Next diagnostic                 |
| `<leader>d`  | `vim.diagnostic.open_float`       | Open diagnostic float           |
| `gK`         | `Toggle virtual_lines`            | Toggle diagnostic virtual lines |
| `<leader>D`  | `vim.lsp.buf.type_definition`     | Type definition                 |
| `gD`         | `vim.lsp.buf.declaration`         | Go to declaration               |
| `<leader>q`  | `vim.diagnostic.setqflist`        | Open diagnostic quickfix        |

### Mini.nvim Mappings

| Key                       | Mode   | Action                           |
| -----                     | ------ | --------                         |
| `gcc`                     | Normal | Toggle comment (MiniComment)     |
| `gc`                      | Visual | Toggle comment (MiniComment)     |
| `H`                       | Visual | Move selection left (MiniMove)   |
| `L`                       | Visual | Move selection right (MiniMove)  |
| `J`                       | Visual | Move selection down (MiniMove)   |
| `K`                       | Visual | Move selection up (MiniMove)     |
| `ga + character to align` | Visual | Align text by character to align |

### Miscellaneous

| Key       | Action                  | Description        |
| -----     | --------                | -------------      |
| `<Up>`    | `print('skill issue?')` | Disabled arrow key |
| `<Down>`  | `print('skill issue?')` | Disabled arrow key |
| `<Left>`  | `print('skill issue?')` | Disabled arrow key |
| `<Right>` | `print('skill issue?')` | Disabled arrow key |

# Motions

### Global

| Key               | Description                         |
| -----             | -------------                       |
| `:h[elp] keyword` | open help for keyword               |
| `:sav[eas] file`  | save file as                        |
| `:clo[se]`        | close current pane                  |
| `:ter[minal]`     | open a terminal window              |
| `K`               | open man page for word under cursor |

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

### Marks and positions

| Key        | Description                                        |
| -----      | -------------                                      |
| `:marks`   | list of marks                                      |
| `ma`       | set current position for mark A                    |
| `` `a ``   | jump to position of mark A                         |
| `` y`a ``  | yank text to position of mark A                    |
| `` `0 ``   | go to the position where Vim was previously exited |
| `` `" ``   | go to the position when last editing this file     |
| `` `. ``   | go to the position of the last change in this file |
| ``` ```    | go to the position before the last jump            |
| `:ju`      | list of jumps                                      |
| `Ctrl+i`   | go to newer position in jump list                  |
| `Ctrl+o`   | go to older position in jump list                  |
| `:changes` | list of changes                                    |
| `g,`       | go to newer position in change list                |
| `g;`       | go to older position in change list                |
| `Ctrl+]`   | jump to the tag under cursor                       |

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
| `Ctrl+wx`  | exchange current window with next one                   |
| `Ctrl+w=`  | make all windows equal height & width                   |
| `Ctrl+wh`  | move cursor to the left window (vertical split)         |
| `Ctrl+wl`  | move cursor to the right window (vertical split)        |
| `Ctrl+wj`  | move cursor to the window below (horizontal split)      |
| `Ctrl+wk`  | move cursor to the window above (horizontal split)      |
| `Ctrl+wH`  | make current window full height at far left             |
| `Ctrl+wL`  | make current window full height at far right            |
| `Ctrl+wJ`  | make current window full width at the very bottom       |
| `Ctrl+wK`  | make current window full width at the very top          |

### Different

| Key                 | Description                                    |
| -----               | -------------                                  |
| `zf`                | manually define a fold up to motion            |
| `zd`                | delete fold under the cursor                   |
| `za`                | toggle fold under the cursor                   |
| `zo`                | open fold under the cursor                     |
| `zc`                | close fold under the cursor                    |
| `zr`                | reduce (open) all folds by one level           |
| `zm`                | fold more (close) all folds by one level       |
| `zi`                | toggle folding functionality                   |
| `]c`                | jump to start of next change                   |
| `[c`                | jump to start of previous change               |
| `do`                | obtain (get) difference (from other buffer)    |
| `dp`                | put difference (to other buffer)               |
| `:diffthis`         | make current window part of diff               |
| `:dif`              | update differences                             |
| `:diffoff`          | switch off diff mode for current window        |
| `:read[r] file.c`   | inserts the text from the file.c               |
| `:r !shell_command` | inserts the output info from the shell_command |
| `:put x`            | put the text from register x after the cursor  |
| `:reg`              | open register contents history                 |


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

