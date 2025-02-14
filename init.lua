--[[

=====================================================================
====================       KICKSTART.NVIM        ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================


-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = false

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`
--

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- vim and system clipboard are kept independent. Can still access system
-- clipboard using + or * registers as needed. Custom bind provided to access
-- system clipboard in keymaps.lua

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Display the last line of text if it exceeds the screen
vim.opt.display = "lastline"

-- Better tab completion and list longest match
vim.opt.wildmode = { "list", "longest" }

-- Set the text width for line wrapping
vim.opt.textwidth = 80

-- Remove octal support from number formats
vim.opt.nrformats:remove("octal")

-- Set tab-related options
vim.opt.tabstop = 3
vim.opt.shiftwidth = 3  -- Same as tabstop
vim.opt.softtabstop = 3  -- Same as shiftwidth

-- Folding method (manual fold control)
vim.opt.foldmethod = "manual"

-- leader shortcuts wait longer
vim.opt.timeoutlen = 200

-- turn off neovide animations
vim.g.neovide_position_animation_length = 0
vim.g.neovide_cursor_animation_length = 0.00
vim.g.neovide_cursor_trail_size = 0
vim.g.neovide_cursor_animate_in_insert_mode = false
vim.g.neovide_cursor_animate_command_line = false
vim.g.neovide_scroll_animation_far_lines = 0
vim.g.neovide_scroll_animation_length = 0.00

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to force a plugin to be loaded.
  --

  -- Here is a more advanced example where we pass configuration
  -- options to `gitsigns.nvim`. This is equivalent to the following Lua:
  --    require('gitsigns').setup({ ... })
  --

  -- NOTE: Plugins can also be configured to run Lua code when they are loaded.
  --
  -- This is often very useful to both group configuration, as well as handle
  -- lazy loading plugins that don't need to be loaded immediately at startup.
  --
  -- For example, in the following configuration, we use:
  --  event = 'VimEnter'
  --
  -- which loads which-key before all the UI elements are loaded. Events can be
  -- normal autocommands events (`:help autocmd-events`).
  --
  -- Then, because we use the `opts` key (recommended), the configuration runs
  -- after the plugin has been loaded as `require(MODULE).setup(opts)`.

   

  -- NOTE: Plugins can specify dependencies.
  --
  -- The dependencies are proper plugin specifications as well - anything
  -- you do for a plugin at the top level, you can do for a dependency.
  --
  -- Use the `dependencies` key to specify the dependencies of a particular plugin

  {
    'preservim/vim-markdown', ft = 'markdown',

    init = function()
      -- disable vim-markdown folding
      vim.g.vim_markdown_folding_disabled = 1

      -- Don't use default keybinds
      vim.g.vim_markdown_no_default_key_mappings = 1

      -- Autoshrink TOCs
      vim.g.vim_markdown_toc_autofit = 1

      -- Indentation for new lists
      vim.g.vim_markdown_new_list_item_indent = 0
      vim.g.vim_markdown_auto_insert_bullets = 0

      -- Format strikethrough text
      vim.g.vim_markdown_strikethrough = 1

      -- Conceal markdown formatting
      vim.g.vim_markdown_conceal = 2

    end,
  },

  { 'ojroques/nvim-hardline' },

  {
    'preservim/vim-pencil', ft = { 'markdown', 'text' },
    init = function()
      -- set wrap mode to soft, by default
      vim.cmd([[let g:pencil#wrapModeDefault = 'soft']])
    end,

  },

  {'preservim/vim-litecorrect', ft = { 'markdown', 'text' }, },

  {"rose-pine/neovim", name = "rose-pine" },

  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc', 'python', 'java' },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
  },

  -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
  -- Or use telescope!
  -- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
  -- you can continue same window with `<space>sr` which resumes last telescope search
})

require("rose-pine").setup({
    variant = "moon", -- auto, main, moon, or dawn
    dark_variant = "moon", -- main, moon, or dawn
    dim_inactive_windows = false,
    extend_background_behind_borders = true,

    enable = {
        terminal = true,
        legacy_highlights = false, -- Improve compatibility for previous versions of Neovim
        migrations = true, -- Handle deprecated options automatically
    },

    styles = {
        bold = true,
        italic = true,
        transparency = false,
    },

    groups = {
        border = "muted",
        link = "iris",
        panel = "surface",

        error = "love",
        hint = "iris",
        info = "foam",
        note = "pine",
        todo = "rose",
        warn = "gold",

        git_add = "foam",
        git_change = "rose",
        git_delete = "love",
        git_dirty = "rose",
        git_ignore = "muted",
        git_merge = "iris",
        git_rename = "pine",
        git_stage = "iris",
        git_text = "rose",
        git_untracked = "subtle",

        h1 = "iris",
        h2 = "foam",
        h3 = "rose",
        h4 = "gold",
        h5 = "pine",
        h6 = "foam",
    },

    palette = {
        -- Override the builtin palette per variant
        -- moon = {
        --     base = '#18191a',
        --     overlay = '#363738',
        -- },
    },

    highlight_groups = {
        -- Comment = { fg = "foam" },
        -- VertSplit = { fg = "muted", bg = "muted" },
    },

    before_highlight = function(group, highlight, palette)
        -- Disable all undercurls
        -- if highlight.undercurl then
        --     highlight.undercurl = false
        -- end
        --
        -- Change palette colour
        -- if highlight.fg == palette.pine then
        --     highlight.fg = palette.foam
        -- end
    end,
})

-- vim.cmd("colorscheme rose-pine")
-- vim.cmd("colorscheme rose-pine-main")
vim.cmd("colorscheme rose-pine-moon")
-- vim.cmd("colorscheme rose-pine-dawn")

require('hardline').setup {
 bufferline = false,  -- disable bufferline
  bufferline_settings = {
    exclude_terminal = false,  -- don't show terminal buffers in bufferline
    show_index = false,        -- show buffer indexes (not the actual buffer numbers) in bufferline
  },
  theme = 'default',   -- change theme
  sections = {         -- define sections
    {class = 'mode', item = require('hardline.parts.mode').get_item},
    {class = 'high', item = require('hardline.parts.git').get_item, hide = 100},
    {class = 'med', item = require('hardline.parts.filename').get_item},
    '%<',
    {class = 'med', item = '%='},
    {class = 'low', item = require('hardline.parts.wordcount').get_item, hide = 100},
    {class = 'error', item = require('hardline.parts.lsp').get_error},
    {class = 'warning', item = require('hardline.parts.lsp').get_warning},
    {class = 'warning', item = require('hardline.parts.whitespace').get_item},
    {class = 'high', item = require('hardline.parts.filetype').get_item, hide = 60},
    {class = 'mode', item = require('hardline.parts.line').get_item},
  },
}


-- MAP IDEAS 

-- EDITING VIMRC
-- ==============
-- <leader>ev opens vimrc in horizontal split
vim.keymap.set('n', '<leader>ev', ':split $MYVIMRC<cr>', { noremap = true })
-- ==============


-- WRAPPING/UNWRAPPING HIGHLIGHTED TEXT IN PARENTHESES
-- ==================================================
-- maps to wrap selected region in (), "", '', {}, <>, [], **, and __
vim.keymap.set('v', '<leader>(', '<esc>`><esc>a)<esc>`<i(<esc>', { noremap = true })
vim.keymap.set('v', '<leader>"', '<esc>`><esc>a"<esc>`<i"<esc>', { noremap = true })
vim.keymap.set('v', '<leader>\'', '<esc>`><esc>a\'<esc>`<i\'<esc>', { noremap = true }) 
vim.keymap.set('v', '<leader>{', '<esc>`><esc>a}<esc>`<i{<esc>', { noremap = true }) 
vim.keymap.set('v', '<leader><', '<esc>`><esc>a><esc>`<i<<esc>', { noremap = true }) 
vim.keymap.set('v', '<leader>]', '<esc>`><esc>a]<esc>`<i[<esc>', { noremap = true }) 
vim.keymap.set('v', '<leader>*', '<esc>`><esc>a*<esc>`<i*<esc>', { noremap = true }) 
vim.keymap.set('v', '<leader>_', '<esc>`><esc>a_<esc>`<i_<esc>', { noremap = true })

-- deletes the parentheses that surround the highlighted text
vim.keymap.set('v', '<leader>)', '<esc>`>x`<x>', { noremap = true })
-- ==================================================

-- MOVE CURSOR TO BEGINNING AND END OF LINE
-- ========================================
vim.keymap.set('n', 'H', '_', { noremap = true })
vim.keymap.set('v', 'H', '_', { noremap = true })
vim.keymap.set('o', 'H', '_', { noremap = true })

vim.keymap.set('n', 'L', '$', { noremap = true })
vim.keymap.set('v', 'L', '$', { noremap = true })
vim.keymap.set('o', 'L', '$', { noremap = true })
-- ========================================

-- QUICK EXIT INSERT-MODE 
-- ======================
vim.keymap.set('i', 'jk', '<esc>', { noremap = true })
vim.keymap.set('i', '<esc>', '<nop>', { noremap = true })
-- =====================

-- QUICK INSERT-MODE
-- =================
vim.keymap.set('n', 'fd', 'i', { noremap = true })
vim.keymap.set('n', 'i', '<nop>', { noremap = true })
-- ================

-- QUICK NETRW
-- ==========
vim.keymap.set('n', '<leader>e', ':Ex<cr>', { noremap = true })
-- ==========

-- OPEN VIM-MARKDOWN TOC
-- =====================
vim.keymap.set('n', '<leader>toc', ':Toc<cr>', { noremap = true })
-- =====================

-- QUICK PASTE FROM SYSTEM CLIPBOARD
-- QUICK COPY TO SYSTEM CLIBOARD
-- =================================
vim.keymap.set('n', '<leader>p', '"*p', { noremap = true })
vim.keymap.set('v', '<leader>p', '"*p', { noremap = true })
vim.keymap.set('n', '<leader>P', '"*P', { noremap = true })
vim.keymap.set('v', '<leader>P', '"*P', { noremap = true })
vim.keymap.set('n', '<leader>y', '"*y', { noremap = true })
vim.keymap.set('v', '<leader>y', '"*y', { noremap = true })
vim.keymap.set('o', '<leader>y', '"*y', { noremap = true })
-- =================================

-- QUICK WRITE
-- QUICK QUIT
-- ===========
vim.keymap.set('n', '<leader>w', ':w<cr>', { noremap = true })
vim.keymap.set('v', '<leader>w', ':w<cr>', { noremap = true })
vim.keymap.set('n', '<leader>q', ':q<cr>', { noremap = true })
vim.keymap.set('v', '<leader>q', ':q<cr>', { noremap = true })
vim.keymap.set('n', '<leader>wq', ':wq<cr>', { noremap = true })
vim.keymap.set('v', '<leader>wq', ':wq<cr>', { noremap = true })
-- ===========

-- QUICK SPLIT NAVIGATION
-- ======================
vim.keymap.set('n', '<c-h>', '<c-w>h', { noremap = true })
vim.keymap.set('n', '<c-j>', '<c-w>j', { noremap = true })
vim.keymap.set('n', '<c-k>', '<c-w>k', { noremap = true })
vim.keymap.set('n', '<c-l>', '<c-w>l', { noremap = true })
-- ======================

-- INTUITIVE REDO
-- ==============
vim.keymap.set('n', 'U', '<c-r>', { noremap = true })
-- ==============

-- INTUITIVE YANK-TO-END-OF-LINE
-- =============================
vim.keymap.set('n', 'Y', 'y$', { noremap = true })
-- =============================

-- FIND NEXT MISSPELLING + CENTER
-- ==============================
vim.keymap.set('n', ']s', ']szz', { noremap = true })
vim.keymap.set('n', '[s', '[szz', { noremap = true })
-- ==============================

-- INSERT MODE PASTE
-- =================
vim.keymap.set('i', '<c-p>', '<c-o>p', { noremap = true })
-- =================

-- CREATE UNDO POINTS ON PUNCTUATION
-- =================================
vim.keymap.set('i', '!', '!<C-g>u', { noremap = true })
vim.keymap.set('i', ',', ',<C-g>u', { noremap = true })
vim.keymap.set('i', '.', '.<C-g>u', { noremap = true })
vim.keymap.set('i', ';', ';<C-g>u', { noremap = true })
vim.keymap.set('i', '"', '"<C-g>u', { noremap = true })
vim.keymap.set('i', "'", "'<C-g>u", { noremap = true })
vim.keymap.set('i', '(', '(<C-g>u', { noremap = true })
vim.keymap.set('i', ')', ')<C-g>u', { noremap = true })
-- =================================

-- ALIAS 'V' COMMAND TO CLEAR SEARCH
-- ================================
vim.keymap.set('n', 'v', ':noh<cr>', { noremap = true })
-- ================================

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
