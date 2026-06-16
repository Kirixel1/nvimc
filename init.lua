-- ==================================================================================================================
--   Welcome to my personal configuration of Neovim in a single init.lua file! (only for version of Neovim 0.12.0+).
--   All well documented, so anyone can understand what each option and setting means.
-- ==================================================================================================================

-- Basic .opt settings
vim.opt.number         = true                                                         -- Visibility of line numbers
vim.opt.relativenumber = true                                                         -- Relative number style (for jumping with counters)
vim.opt.cursorline     = true                                                         -- Highlight current line under the cursor
vim.opt.scrolloff      = 10                                                           -- Keep 10 lines above/below cursor
vim.opt.sidescrolloff  = 10                                                           -- Keep 10 columns left/right of cursor
vim.opt.wrap           = false                                                        -- Off line wrapping
vim.opt.clipboard      = 'unnamedplus'                                                -- Makes clipboard behaviour natural
vim.g.netrw_banner     = false                                                        -- Turn off the banner of the netrw built in explorer
vim.opt.shiftwidth     = 4                                                            -- Number of columns that make up one level of (auto)indentation
vim.opt.tabstop        = 4                                                            -- How many columns displays \t character
vim.opt.softtabstop    = 4                                                            -- How many columns cursor should move when using <Tab> key when inserting it
vim.opt.expandtab      = true                                                         -- Use spaces instead of tabs when inserting \t char
vim.opt.smartindent    = true                                                         -- Smart autoindenting on new lines
vim.opt.autoindent     = true                                                         -- Copy indent from current line
vim.opt.cindent        = true                                                         -- Enable c-style indentation
vim.opt.smartcase      = true                                                         -- Smart sensitive/not sensitive depending on case of the letter typed
vim.opt.incsearch      = true                                                         -- Show matches as you type
vim.opt.ignorecase     = true                                                         -- Ignore case in search patterns
vim.opt.termguicolors  = true                                                         -- Enable 24-bit colors for more color range
vim.opt.swapfile       = false                                                        -- Disables creating of the swap file(reserve copy) for the current buffer
vim.opt.foldmethod     = 'expr'                                                       -- Use expression for folding
vim.opt.foldexpr       = 'v:lua.vim.treesitter.foldexpr()'                            -- Use treesitter for folding
vim.opt.foldlevel      = 99                                                           -- Keep all folds open by default
vim.opt.splitbelow     = true                                                         -- Horizontal splits open below
vim.opt.splitright     = true                                                         -- Vertical splits open to the right
vim.opt.errorbells     = false                                                        -- Disable error sounds
vim.opt.complete:append('o')                                                          -- Append omnicompletion to default
vim.opt.completeopt    = { 'menuone', 'noselect', 'popup', 'fuzzy' }                  -- Some minor completeopt settings (see ':help completeopt')
vim.opt.pumborder      = 'single'                                                     -- Single line autocompletion border box
vim.opt.pumheight      = 5                                                            -- Maximum elements of autocompletion

-- Key maps
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pv', '<cmd>Dired<CR>',                                    { desc = 'Opens dired file manager' })
vim.keymap.set('n', '<leader>sk', '<cmd>ShowkeysToggle<CR>',                           { desc = 'Show keys in the down-center of the screen' })
vim.keymap.set('n', '<leader>O',  'o<esc>kO<Esc>j',                                    { desc = 'Add empty lines' })
vim.keymap.set('n', '<leader>cm', '<cmd>Compile<CR>',                                  { desc = 'Enters compilation mode' })
vim.keymap.set('n', '<leader>tn', '<cmd>tabnext<CR>',                                  { desc = 'Next tab' })
vim.keymap.set('n', '<leader>tp', '<cmd>tabprevious<CR>',                              { desc = 'Previous tab' })
vim.keymap.set('n', '<leader>tc', '<cmd>tabclose<CR>',                                 { desc = 'Close tab' })
vim.keymap.set('n', '<leader>to', '<cmd>tabnew<CR>',                                   { desc = 'Opens new tab' })
vim.keymap.set({'v', 'n'}, '<leader>mm', '<cmd>MCstart<CR>',                           { desc = 'Enters multicursor mode' })
vim.keymap.set({'v', 'n'}, '<leader>ts', '<cmd>lua MiniTrailspace.trim()<CR>',         { desc = 'Trim redundant spaces' })
vim.keymap.set('n', 'gbn', '<cmd>bnext<CR>',                                           { desc = 'Next buffer' })
vim.keymap.set('n', 'gbp', '<cmd>bprev<CR>',                                           { desc = 'Previous buffer' })
vim.keymap.set('n', 'gbd', '<cmd>bdelete<CR>',                                         { desc = 'Delete buffer' })
vim.keymap.set('n', '<C-d>', '<C-d>zz',                                                { desc = 'Scroll down and center' })
vim.keymap.set('n', '<C-u>', '<C-u>zz',                                                { desc = 'Scroll up and center' })
vim.keymap.set('n', 'n', 'nzzzv',                                                      { desc = 'Next search result and center, also opens folded code if it was folded' })
vim.keymap.set('n', 'N', 'Nzzzv',                                                      { desc = 'Previous search result and center, also opens folded code if it was folded' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>',                                       { desc = 'Terminal: switch to normal mode' })
vim.keymap.set('n', '<C-Enter>', 'o<Esc>',                                             { desc = 'New line below without switchin to insert mode' })
vim.keymap.set('n', '<C-Backspace>', 'O<Esc>',                                         { desc = 'New line above without switchin to insert mode' })
vim.keymap.set('n', '<C-,>', 'A,<Esc>',                                                { desc = 'Comma at the end of the line' })
vim.keymap.set('n', '<C-;>', 'A;<Esc>',                                                { desc = 'Dot and comma at the end of the line' })
vim.keymap.set('n', '<Esc>', '<Cmd>nohlsearch<CR>',                                    { noremap = true, silent = true, desc = 'Clear search highlight on Escape' })
vim.keymap.set('n', '<A-l>', '<cmd>vertical resize -9<CR>',                            { desc = 'Resize left' })
vim.keymap.set('n', '<A-j>', '<cmd>resize +6<CR>',                                     { desc = 'Resize down' })
vim.keymap.set('n', '<A-k>', '<cmd>resize -6<CR>',                                     { desc = 'Resize up' })
vim.keymap.set('n', '<A-h>', '<cmd>vertical resize +9<CR>',                            { desc = 'Resize right' })
vim.keymap.set('n', '=wb', function()
    local view = vim.fn.winsaveview()
    vim.cmd('normal! gg=G')
    vim.cmd('lua MiniTrailspace.trim()')
    vim.fn.winrestview(view)
end,                                                                                   { desc = 'Reindent all the text in a file and delete all trailing spaces (unnecessary spaces)' })

-- Highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.hl.on_yank({
            higroup = 'Visual',
            timeout = 400,
        })
    end
})

-- Restore last cursor position when reopening a file
local last_cursor_group = vim.api.nvim_create_augroup('LastCursorGroup', {})
vim.api.nvim_create_autocmd('BufReadPost', {
    group = last_cursor_group,
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- Download plugins with built in package manager of Neovim
vim.pack.add( {
    'https://github.com/blazkowolf/gruber-darker.nvim',                   -- Colorscheme
    'https://github.com/nvim-mini/mini.nvim',                             -- A lot of useful small plugins are setting up 15 lines below
    'https://github.com/nvim-lualine/lualine.nvim',                       -- Lua status line(path, lsp status, etc)
    'https://github.com/ThePrimeagen/vim-be-good',                        -- Small set of games to practice essential Vim motions
    'https://github.com/nvim-treesitter/nvim-treesitter',                 -- Treesitter(more accurate highlighting)
    'https://github.com/nvzone/showkeys',                                 -- ShowKeys plugin for showing other people what you are pressing
    'https://github.com/Eandrju/cellular-automaton.nvim',                 -- Useless but funny plugin, try: CellularAutomaton make_it_rain
    'https://github.com/brenoprata10/nvim-highlight-colors',              -- Highlight color codes with relevant colors
    'https://github.com/NeogitOrg/neogit',                                -- Neovim integration with git
    'https://github.com/shushtain/nvim-treesitter-incremental-selection', -- Return back incremental selection function from treesitter plugin
    'https://github.com/ej-shafran/compile-mode.nvim',                    -- Compilation mode plugin like in Emacs
    'https://github.com/nvim-lua/plenary.nvim',                           -- That's dependency for compilation mode plugin and some others, like Neogit also
    'https://github.com/X3eRo0/dired.nvim',                               -- Dired like file managament similar to Emacs
    'https://github.com/MunifTanjim/nui.nvim',                            -- Dependency for dired.nvim
    'https://github.com/smoka7/multicursors.nvim',                        -- Multicursors plugin
    'https://github.com/nvimtools/hydra.nvim',                            -- Dependency for multicursor plugin
} )

vim.cmd('packadd nvim.undotree')                    -- Enable undotree butil in plugin(only in Neovim 0.12+)
vim.cmd.colorscheme('gruber-darker')                -- Enable gruber-darker colorscheme
require('mini.align').setup()                       -- Align module
require('mini.comment').setup()                     -- Comments module
require('mini.trailspace').setup()                  -- Trailspaces module
require('mini.icons').setup()                       -- Icons module
require('mini.operators').setup({                   -- Operators module(mainly for exchanging text regions)
    exchange = {
        prefix = 'gX',
        reindent_linewise = true,
    },
})
MiniIcons.mock_nvim_web_devicons()                  -- Integrates mini.icons with other plugins that can use icons

-- `HJKL` for moving visual selection (overrides H, L, J in Visual mode)
require('mini.move').setup({
    mappings = {
        left  = 'H',
        right = 'L',
        down  = 'J',
        up    = 'K',

        -- Disable move motions for normal mode
        line_left = '',
        line_right = '',
        line_down = '',
        line_up = '',
    }
})

-- Lualine.nvim configuration
require('lualine').setup( {

    options = {
        globalstatus = true, -- Set one global lualine for all the windows(even if you have multiple splits)
        component_separators = { left = '', right = '' },
        section_separators = { left = '',    right = '' },
    },

    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'diff' },
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
} )

require('neogit').setup()
require('dired').setup({})
require('nvim-highlight-colors').setup()
require('nvim-treesitter').setup({
    sync_install = false, -- Disable sync install of parsers
    auto_install = true, -- Automatically installs missing Treesitter language parsers when you open a file for which the parser is not yet installed
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    ensure_installed = {
        'c',
        'cpp',
        'lua',
        'pascal',
        'vim',
        'vimdoc',
        'query',
        'markdown',
        'markdown_inline',
        'html',
        'css',
    },

    -- Indent enable = true allowing it to apply correct indentation for complex syntax
    -- (like multiline expressions or specific language blocks) where traditional autoindent might fail
    indent = {
        enable = true
    },

})

-- Incremental selection setup
local tsis = require('nvim-treesitter-incremental-selection')
vim.keymap.set('n', '<leader>o', tsis.init_selection)
vim.keymap.set('v', '<leader>i', tsis.increment_node)
vim.keymap.set('v', '<leader>d', tsis.decrement_node)

-- Compile mode setup(mainly default configuration with some personal tweaks)
vim.g.compile_mode = {
    default_command = '',
    baleia_setup = false,
    bang_expansion = false,
    directory_change_matchers = {},
    error_regexp_table = {},
    error_ignore_file_list = {},
    error_threshold = require('compile-mode').level.WARNING,
    auto_jump_to_first_error = false,
    error_locus_highlight = 500,
    use_diagnostics = false,
    recompile_no_fail = false,
    ask_about_save = true,
    ask_to_interrupt = true,
    buffer_name = '*compilation*',
    time_format = '%a %b %e %H:%M:%S',
    hidden_output = {},
    environment = nil,
    clear_environment = false,
    input_word_completion = false,
    hidden_buffer = false,
    focus_compilation_buffer = true,
    auto_scroll = false,
    use_circular_error_navigation = false,
    debug = false,
    use_pseudo_terminal = false,
}

-- Show keys configuration (mini widget thing that shows every key that you press for showing or teaching someone else)
require('showkeys').setup({
    maxkeys = 5,
    position = 'bottom-center',
    winopts = {
        height = 1,
    },
})

-- Multicursors setup
require('multicursors').setup({
    hint_config = false,
})

