vim.opt.clipboard = "unnamedplus"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  {
    "scottmckendry/cyberdream.nvim",
    priority = 1000,
    opts = {
      transparent = true,
      italic_comments = true,
      borderless_pickers = true,
      terminal_colors = true,
      saturation = 1.2,
      variant = "default",
      colors = {
        magenta = "#ff3366",
        purple = "#dd2255",
        blue = "#ff5533",
        cyan = "#ff6644",
        green = "#ffaa44",
        red = "#ff2222",
        orange = "#ff7733",
        yellow = "#ffbb55",
      },
      highlights = {
        Keyword = { fg = "#ff3366", bold = true },
        Function = { fg = "#ff7733", bold = true },
        Identifier = { fg = "#ff5555" },
        Number = { fg = "#ff5555" },
        String = { fg = "#ff7777" },
        Type = { fg = "#ff7733", italic = true },
        Comment = { fg = "#cc6655", italic = true },
        Title = { fg = "#ff5588", bold = true },
        Visual = { bg = "#992233", fg = "#ffccaa" },
        Search = { bg = "#dd3355", fg = "#ffffff" },
        IncSearch = { bg = "#ff5588", fg = "#ffffff" },
        StatusLine = { bg = "#1a0a10", fg = "#ff8866" },
        StatusLineNC = { bg = "#0a0508", fg = "#cc8866" },
        LineNr = { fg = "#cc7766" },
        CursorLineNr = { fg = "#ff6688", bold = true },
        CursorLine = { bg = "#2a0a15" },
        WarningMsg = { fg = "#ff6644", bold = true },
        ErrorMsg = { fg = "#ff3333", bold = true },
        DiagnosticError = { fg = "#ff4433" },
        DiagnosticWarn = { fg = "#ff8866" },
        DiagnosticInfo = { fg = "#ffaa77" },
        DiagnosticHint = { fg = "#ffaa88" },
      },
    },
    config = function()
      vim.cmd("colorscheme cyberdream")
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        view = { width = 32, side = "left", preserve_window_proportions = false, signcolumn = "no" },
        renderer = {
          highlight_opened_files = "all",
          highlight_git = true,
          indent_markers = { enable = true },
          icons = { show = { file = true, folder = true, folder_arrow = true, git = true } },
        },
        update_focused_file = { enable = true, update_root = false },
        filters = { dotfiles = false },
      })
      vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })

      vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "NvimTreeCursorLine", { bg = "#3a0a18" })
      vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg = "#ff8866" })
      vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg = "#ff5588", bold = true })
      vim.api.nvim_set_hl(0, "NvimTreeFileName", { fg = "#ffbb88" })
      vim.api.nvim_set_hl(0, "NvimTreeOpenedFile", { fg = "#ff6688", bold = true, underline = true })
      vim.api.nvim_set_hl(0, "NvimTreeGitDirty", { fg = "#ffaa66" })
      vim.api.nvim_set_hl(0, "NvimTreeGitDeleted", { fg = "#ff5555" })
      vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { fg = "#ff8866" })
      vim.api.nvim_set_hl(0, "NvimTreeRootFolder", { fg = "#ff5588", bold = true })
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = { theme = "cyberdream", section_separators = "", component_separators = "", transparent = true },
      })
    end,
  },
})

vim.cmd([[
  highlight Normal guibg=NONE
  highlight NormalNC guibg=NONE
  highlight SignColumn guibg=NONE
  highlight EndOfBuffer guibg=NONE
  highlight LineNr guibg=NONE
]])

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local ok, api = pcall(require, "nvim-tree.api")
    if ok and api and api.tree then
      api.tree.open()
      api.tree.find_file({ open = true, focus = false })
    end
  end,
})

vim.cmd([[
  highlight Normal guifg=#ffccaa guibg=NONE
  highlight NormalNC guifg=#ffbb99 guibg=NONE
  highlight Title guifg=#ff3366 gui=bold
  highlight NonText guifg=#cc6688
  highlight EndOfBuffer guifg=#ff6699

  highlight LineNr guifg=#cc6688 guibg=NONE
  highlight CursorLineNr guifg=#ff6699 gui=bold
  highlight CursorLine guibg=#2a0a14

  highlight StatusLine guibg=#1a0a10 guifg=#ff6699
  highlight StatusLineNC guibg=#0a0508 guifg=#cc6688

  highlight Visual guibg=#882233 guifg=#ffccdd
  highlight Search guibg=#ff3366 guifg=#1a0a14
  highlight IncSearch guibg=#ff6699 guifg=#ffffff

  highlight WarningMsg guifg=#ffaa77 gui=bold
  highlight ErrorMsg guifg=#ff2244 gui=bold

  highlight DiffAdd guibg=#2a4422 guifg=#ffccaa
  highlight DiffChange guibg=#442211 guifg=#ffccaa
  highlight DiffDelete guibg=#441122 guifg=#ff6688
  highlight DiagnosticError guifg=#ff3344
  highlight DiagnosticWarn guifg=#ffaa77

  highlight! @string guifg=#ffaa88
  highlight! @number guifg=#ff8888
  highlight! @boolean guifg=#ff8888
  highlight! @type guifg=#ffaa77
  highlight! @keyword guifg=#ff3366 gui=bold
  highlight! @function guifg=#ffaa77 gui=bold
  highlight! @comment guifg=#cc8899 gui=italic
  highlight! @variable guifg=#ffccaa
  highlight! @constant guifg=#ff8888

  highlight! Identifier guifg=#ffccaa
  highlight! Constant guifg=#ff8888
  highlight! Number guifg=#ff8888
  highlight! Boolean guifg=#ff8888
  highlight! String guifg=#ffaa88
  highlight! Type guifg=#ffaa77
  highlight! Keyword guifg=#ff3366 gui=bold
  highlight! Function guifg=#ffaa77 gui=bold
  highlight! Statement guifg=#ff3366 gui=bold
  highlight! Comment guifg=#cc8899 gui=italic

  highlight! cssPseudoClass guifg=#ff6699
  highlight! cssClassName guifg=#ffbb99
  highlight! cssTagName guifg=#ff6688
  highlight! cssAttr guifg=#ffaa77
  highlight! cssImportant guifg=#ff3366 gui=bold
  highlight! Directory guifg=#ff6699
]])

vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NvimTreeCursorLine", { bg = "#2a0a15" })
vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg = "#ff7799" })
vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg = "#ff5577", bold = true })
vim.api.nvim_set_hl(0, "NvimTreeEmptyFolderName", { fg = "#cc6688" })
vim.api.nvim_set_hl(0, "NvimTreeFileName", { fg = "#ffbb99" })
vim.api.nvim_set_hl(0, "NvimTreeOpenedFile", { fg = "#ff6699", bold = true, underline = true })
vim.api.nvim_set_hl(0, "NvimTreeGitDirty", { fg = "#ffaa77" })
vim.api.nvim_set_hl(0, "NvimTreeGitDeleted", { fg = "#ff3344" })
vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { fg = "#ff7799" })
vim.api.nvim_set_hl(0, "NvimTreeRootFolder", { fg = "#ff3366", bold = true })
vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", { fg = "#442222" })

vim.cmd([[
  highlight! PreProc guifg=#ff6699
  highlight! cssPseudoClassId guifg=#ff6699
  
  highlight! Substitute guifg=#ffaa77 gui=bold
  highlight! SpecialComment guifg=#ffaa77
  highlight! ReadOnly guifg=#ffaa77
  
  highlight! MsgArea guifg=#ffccaa
  highlight! MsgSeparator guifg=#ff6699
]])

vim.cmd([[
  highlight! Question guifg=#ffaa77 gui=bold
  highlight! WarningMsg guifg=#ffaa77 gui=bold
  highlight! MoreMsg guifg=#ffaa77
  highlight! ModeMsg guifg=#ffaa77
  highlight! Substitute guifg=#ffaa77
  highlight! Special guifg=#ffaa77
  highlight! SpecialKey guifg=#ffaa77
  highlight! Title guifg=#ffaa77
  highlight! DiagnosticWarn guifg=#ffaa77
  highlight! Error guifg=#ff2244
  highlight! ErrorMsg guifg=#ff2244 gui=bold
  highlight! Debug guifg=#ff6699
  highlight! Directory guifg=#ff6699
  highlight! Search guifg=#1a0a14 guibg=#ff3366
  highlight! IncSearch guifg=#ffffff guibg=#ff6699
  highlight! String guifg=#ffaa88
  highlight! Number guifg=#ff8888
  highlight! Boolean guifg=#ff8888
  highlight! Character guifg=#ffaa99
  highlight! Constant guifg=#ff8888
  highlight! Type guifg=#ffaa77
  highlight! Identifier guifg=#ffccaa
  highlight! Function guifg=#ffaa77 gui=bold
  highlight! Keyword guifg=#ff3366 gui=bold
  highlight! Statement guifg=#ff3366 gui=bold
  highlight! Comment guifg=#cc8899 gui=italic
  highlight! cssPseudoClass guifg=#ff6699
  highlight! cssPseudoClassId guifg=#ff6699
  highlight! cssClassName guifg=#ffbb99
  highlight! cssTagName guifg=#ff6688
  highlight! cssAttr guifg=#ffaa77
  highlight! cssImportant guifg=#ff3366 gui=bold
  highlight! PreProc guifg=#ff6699
]])

vim.api.nvim_set_hl(0, "WarningMsg", { fg = "#ffaa77", bold = true })
vim.api.nvim_set_hl(0, "Substitute", { fg = "#ffaa77", bold = true })
vim.api.nvim_set_hl(0, "Question", { fg = "#ffaa77", bold = true })
vim.api.nvim_set_hl(0, "MoreMsg", { fg = "#ffaa77" })
vim.api.nvim_set_hl(0, "ModeMsg", { fg = "#ffaa77" })
vim.api.nvim_set_hl(0, "PreProc", { fg = "#ff6699" })
