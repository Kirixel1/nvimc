-- ==================================================================================================================
--   Welcome to my personal configuration of Neovim in a single init.lua file! (only for version of Neovim 0.12.0+).
--   My configuration is divided by sections with keywords (END/BEGIN), for better navigation in the file.
--   All well documented, so anyone can understand what each option and setting means.
-- ==================================================================================================================


-- ==========================================================================================================
--                                              OPTIONS SECTION BEGIN
-- ==========================================================================================================

-- Basic settings
vim.opt.number = true                                                -- Visibility of line numbers
vim.opt.relativenumber = true                                        -- Relative number style (for jumping with counters)
vim.opt.cursorline = true                                            -- Highlight current line under the cursor
vim.opt.scrolloff = 10                                               -- Keep 15 lines above/below cursor
vim.opt.sidescrolloff = 10                                           -- Keep 15 columns left/right of cursor
vim.opt.wrap = false                                                 -- Off line wrapping
vim.opt.clipboard = 'unnamedplus'                                    -- Make system clipboard the same as Neovim registers for more convenient usage of yank/paste
vim.g.netrw_banner = false                                           -- Turn off the banner of the netrw built in explorer

-- Tabbing / indentation
vim.opt.shiftwidth = 4                                               -- Number of spaces to use for each step of indenting
vim.opt.expandtab = true                                             -- Use spaces instead of tabs
vim.opt.smartindent = true                                           -- Smart autoindenting on new lines
vim.opt.autoindent = true                                            -- Copy indent from current line
vim.opt.cindent = true                                               -- Enable c-style indentation
vim.opt.smarttab = true                                              -- Insert appropriate number of spaces on tab

-- Search settings
vim.opt.smartcase = true                                             -- Smart sensitive/not sensitive depending on case of the letter typed
vim.opt.incsearch = true                                             -- Show matches as you type
vim.opt.ignorecase = true                                            -- Ignore case in search patterns

-- Visual settings
vim.opt.termguicolors = true                                         -- Enable 24-bit colors for more color range

-- Folding settings
vim.opt.foldmethod = 'expr'                                          -- Use expression for folding
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'                 -- Use treesitter for folding
vim.opt.foldlevel = 99                                               -- Keep all folds open by default

-- Split behavior
vim.opt.splitbelow = true                                            -- Horizontal splits open below
vim.opt.splitright = true                                            -- Vertical splits open to the right

-- Behaviour settings
vim.opt.errorbells = false                                           -- Disable error sounds
vim.opt.mouse = ''                                                   -- Disable mouse support

-- Autocompletion options
vim.opt.complete:append('o')                                         -- Append omnicompletion to default
vim.opt.completeopt = { 'menuone', 'noselect', 'popup' }             -- Some minor completeopt settings (see ':help completeopt')
vim.opt.pumborder = 'single'                                         -- Single line autocompletion border box
vim.opt.pumheight = 5                                                -- Maximum elements of autocompletion

-- ==========================================================================================================
--                                        OPTIONS SECTION END
-- ==========================================================================================================


-- ==========================================================================================================
--                                        KEYMAPS SECTION BEGIN
-- ==========================================================================================================

-- Leader mappings
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>pv', '<cmd>Ex<CR>', { desc = 'Open netrw built in Neovim file explorer' })
vim.keymap.set('n', '<leader>it', '<cmd>InspectTree<CR>', { desc = 'Open tree-sitter inspection buffer' })
vim.keymap.set('n', '<leader>sk', '<cmd>ShowkeysToggle<CR>', { desc = 'Show keys in the down-right corner' })
vim.keymap.set('n', '<leader>O', 'o<esc>kO<Esc>j', { desc = 'Add empty lines' })
vim.keymap.set('n', '<leader>ot', function()
    vim.cmd('hor term')
    vim.cmd('normal i')
end, { desc = 'Opens terminal session in horizontal split below' })

vim.keymap.set('n', '<leader>ff', function()
    require('fzf-lua').files()
end, { desc = 'FZF find files in the current directory' })

vim.keymap.set('n', '<leader>fg', function()
    require('fzf-lua').live_grep()
end, { desc = 'FZF live grep' })

vim.keymap.set('n', '<leader>fb', function()
    require('fzf-lua').buffers()
end, { desc = 'FZF buffers' })

vim.keymap.set('n', '<leader>fh', function()
    require('fzf-lua').help_tags()
end, { desc = 'FZF help tags' })

-- Buffer switching
vim.keymap.set('n', 'gbn', '<cmd>bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', 'gbp', '<cmd>bprev<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', 'gbd', '<cmd>bdelete<CR>', { desc = 'Delete buffer' })

-- Improved scrolling
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down and center' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up and center' })

-- Improved next match
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next search result and center, also opens folded code if it was folded' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Previous search result and center, also opens folded code if it was folded' })

-- Stuff for convenience
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Terminal: switch to normal mode' })
vim.keymap.set('n', '<C-Enter>', 'o<Esc>', { desc = 'New line below without switchin to insert mode' })
vim.keymap.set('n', '<C-Backspace>', 'O<Esc>', { desc = 'New line above without switchin to insert mode' })
vim.keymap.set('n', '<C-,>', 'A,<Esc>', { desc = 'Comma at the end of the line' })
vim.keymap.set('n', '<C-;>', 'A;<Esc>', { desc = 'Dot and comma at the end of the line' })
vim.keymap.set('i', '<C-Space>', '<C-x><C-o>', { desc = 'Trigger omni completion' })

vim.keymap.set('n', '=wb', function()
    local view = vim.fn.winsaveview()
    vim.cmd('normal! gg=G')
    vim.cmd('lua MiniTrailspace.trim()')
    vim.fn.winrestview(view)
end, { desc = 'Reindent all the text in a file and delete all trailing spaces (unnecessary spaces)' })

vim.keymap.set('n', '<Esc>', '<Cmd>nohlsearch<CR>', { noremap = true, silent = true, desc = 'Clear search highlight on Escape' })

-- Window management remaps
vim.keymap.set('n', '<A-l>', '<cmd>vertical resize -9<CR>', { desc = 'Resize left' })
vim.keymap.set('n', '<A-j>', '<cmd>resize +6<CR>', { desc = 'Resize down' })
vim.keymap.set('n', '<A-k>', '<cmd>resize -6<CR>', { desc = 'Resize up' })
vim.keymap.set('n', '<A-h>', '<cmd>vertical resize +9<CR>', { desc = 'Resize right' })


-- ==========================================================================================================
--                                        KEYMAPS SECTION END
-- ==========================================================================================================


-- ==========================================================================================================
--                                    AUTOCOMMANDS SECTION BEGIN
-- ==========================================================================================================

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

-- Clear autoformatting of comments on new lines
vim.api.nvim_create_autocmd('FileType', {
    pattern = '*',
    callback = function()
        vim.opt_local.formatoptions:remove({ 'c', 'r', 'o' })
    end,
})

-- ==========================================================================================================
--                                    AUTOCOMMANDS SECTION END
-- ==========================================================================================================


-- ==========================================================================================================
--                                      LSP SECTION BEGIN
-- ==========================================================================================================

-- Servers setup
-- C and C++ language server
vim.lsp.config['clangd'] = {
    cmd = { 'clangd' },
    filetypes = { 'c', 'cpp' }
}

-- Assembly LSP
vim.lsp.config['asm-lsp'] = {
    cmd = { 'asm-lsp' },
    filetypes = { 'asm' }
}

-- Lua language server
vim.lsp.config['lua_ls'] = {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { '.luarc.json', '.luarc.jsonc', '.git' },
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim', 'MiniIcons' },
                disable = { 'inject-field', 'undefined-field', 'missing-fields' },
            },
            runtime = { version = 'LuaJIT' },
            workspace = {
                library = { vim.env.VIMRUNTIME },
                checkThirdParty = false,
            },
            telemetry = { enable = false },
        },
    },
}

-- LSP keymaps
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
    callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if not client then return end

        local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        -- Professional development keymaps
        map('gd', vim.lsp.buf.definition, 'Goto Definition')
        map('gr', vim.lsp.buf.references, 'Goto References')
        map('gI', vim.lsp.buf.implementation, 'Goto Implementation')
        map('<leader>D', vim.lsp.buf.type_definition, 'Type Definition')
        map('<leader>rn', vim.lsp.buf.rename, 'Rename')
        map('K', function() vim.lsp.buf.hover({ border = 'single', max_height = 25, max_width = 120 }) end, 'Hover Documentation')
        map('gD', vim.lsp.buf.declaration, 'Goto Declaration')

        -- Diagnostic keymaps
        map('<leader>d', vim.diagnostic.open_float, 'Open Diagnostic Float')
        map('[d', function() vim.diagnostic.jump({ count = -1, float = true }) end, 'Previous Diagnostic')
        map(']d', function() vim.diagnostic.jump({ count = 1, float = true }) end, 'Next Diagnostic')
        map('<leader>q', vim.diagnostic.setqflist, 'Open Diagnostic Quickfix')
        map('gK', function()
            local new_config = not vim.diagnostic.config().virtual_lines
            vim.diagnostic.config({ virtual_lines = new_config })
        end, 'Toggle diagnostic virtual_lines' )
    end,
})



-- Diagnostic config
vim.diagnostic.config({
    -- Floating diagnostic window border style
    float = {
        border = 'single',
    },
})

-- Enabling all LSPs
vim.lsp.enable( {'clangd', 'lua_ls', 'asm-lsp' } )

-- ==========================================================================================================
--                                      LSP SECTION END
-- ==========================================================================================================


-- ==========================================================================================================
--                                   PLUGINS SECTION BEGIN
-- ==========================================================================================================

-- Download plugins with built in package manager of Neovim
vim.pack.add( {
    'https://github.com/blazkowolf/gruber-darker.nvim',      -- Colorscheme
    'https://github.com/nvim-mini/mini.nvim',                -- A lot of useful small plugins are setting up 15 lines below
    'https://github.com/nvim-lualine/lualine.nvim',          -- Lua status line(path,     lsp status, etc)
    'https://github.com/ThePrimeagen/vim-be-good',           -- Small set of games to practice essential Vim motions
    'https://github.com/ibhagwan/fzf-lua',                   -- Fuzzy findig
    'https://github.com/mason-org/mason.nvim',               -- Lsp downloading plugin
    'https://github.com/nvim-treesitter/nvim-treesitter',    -- Treesitter(more accurate highlighting)
    'https://github.com/nvzone/showkeys',                    -- ShowKeys plugin for showing other people what you are pressing
    'https://github.com/Eandrju/cellular-automaton.nvim',    -- Useless but funny plugin, try: CellularAutomaton make_it_rain
    'https://github.com/brenoprata10/nvim-highlight-colors', -- Highlight color codes with relevant colors
    'https://github.com/NeogitOrg/neogit',                   -- Neovim integration with git
} )

-- Setup configuration for plugins
vim.cmd.colorscheme('gruber-darker')      -- Enable gruber-darker colorscheme
vim.cmd('packadd nvim.undotree')          -- Enable undotree butil in plugin(only in Neovim 0.12+)

-- Mini.nvim plugin
require('mini.align').setup()             -- Align module
require('mini.comment').setup()           -- Comments module (gcc)
require('mini.indentscope').setup()       -- Indentscope dashes module
require('mini.trailspace').setup()        -- Trailspaces module
require('mini.icons').setup()             -- Icons module
require('mini.operators').setup()         -- Operators module(mainly for exchanging text regions)
require('mini.surround').setup()          -- Surround module for surrounding selection with special symbols
MiniIcons.mock_nvim_web_devicons()        -- Integrates mini.icons with other plugins that can use icons
-- `HJKL` for moving visual selection (overrides H, L, J in Visual mode)
-- Mini move module for moving sections of code
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
        component_separators = { left = '|', right = '|' },
        section_separators = { left = '',    right = '' },
    },

    sections = {
        lualine_a = {'mode'},
        lualine_b = {'diff', 'diagnostics'},
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = {'encoding', 'fileformat', 'filetype', 'lsp_status'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
} )

-- Fzf-lua configuration
require('fzf-lua').setup( {
    files = {
        no_ignore = true, -- now I can see all the ignored files in fzf searching
    },
    lazy = false,
    dependencies = { 'nvim-mini/mini.icons' },
} )

-- Highlight colors with match color
require('nvim-highlight-colors').setup()

-- Mason configuration (empty/just setup)
require('mason').setup()

-- Tree-sitter configuration
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

-- Show keys configuration (mini widget thing that shows every key that you press for showing or teaching someone else)
require('showkeys').setup({
    maxkeys = 5,
    position = 'bottom-center',
    winopts = {
        height = 1,
    },
})

-- Neogit setup
require('neogit').setup()

-- ==========================================================================================================
--                                      ADDITIONAL TWEAKS SECTION BEGIN
-- ==========================================================================================================

-- Setting up highlight groups for diagnostic underlines (after loaded theme)
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', {
    sp = '#ff2400',
    underline = true,
})

vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', {
    sp = '#ffdd00',
    underline = true,
})

vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', {
    sp = '#46a0ff',
    underline = true,
})

vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', {
    sp = '#73c936',
    underline = true,
})

-- Skill issue?(Disabling arrow keys, so when you try to use them Neovim gonna bulling you with skill issue question <3)
local noarrows = true

if noarrows == true then
    local skillissue = function()
        print('skill issue?')
    end

    vim.keymap.set('n', '<Up>', skillissue, { desc = 'No arrow keys sorryyy' })
    vim.keymap.set('n', '<Down>', skillissue, { desc = 'No arrow keys sorryyy' })
    vim.keymap.set('n', '<Left>', skillissue, { desc = 'No arrow keys sorryyy' })
    vim.keymap.set('n', '<Right>', skillissue, { desc = 'No arrow keys sorryyy' })

end

-- ==========================================================================================================
--                         END OF THE CONFIG AND ALSO END OF THE ADDITIONAL SECTION
-- ==========================================================================================================
