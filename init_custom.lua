-- ============================================================
-- NEOVIM CONFIG — bare minimum
-- Rust / C / C++ | Catppuccin theme
-- ============================================================


-- ── LEADER ──────────────────────────────────────────────────
vim.g.mapleader      = " "
vim.g.maplocalleader = " "


-- ── OPTIONS ─────────────────────────────────────────────────
local o = vim.opt

o.number         = true
o.relativenumber = true
o.signcolumn     = "yes"
o.cursorline     = true

o.tabstop        = 4
o.shiftwidth     = 4
o.expandtab      = true
o.smartindent    = true

o.wrap           = false
o.scrolloff      = 8
o.sidescrolloff  = 8
o.splitright     = true
o.splitbelow     = true

o.ignorecase     = true
o.smartcase      = true
o.hlsearch       = false
o.incsearch      = true

o.swapfile       = false
o.backup         = false
o.undofile       = true

-- ── CLIPBOARD ───────────────────────────────────────────────
local function check_clipboard()
  if vim.env.WAYLAND_DISPLAY then
    if vim.fn.executable("wl-copy") == 0 then
      vim.notify(
        "Wayland detected but wl-clipboard not found! Run: sudo apt install wl-clipboard",
        vim.log.levels.WARN
      )
    end
  elseif vim.env.DISPLAY then
    if vim.fn.executable("xclip") == 0 and vim.fn.executable("xsel") == 0 then
      vim.notify(
        "X11 detected but no clipboard tool found! Run: sudo apt install xclip",
        vim.log.levels.WARN
      )
    end
  end
end

check_clipboard()

o.clipboard      = "unnamedplus"
o.termguicolors  = true
o.updatetime     = 50
o.timeoutlen     = 150


-- ── STATUSLINE ──────────────────────────────────────────────
o.statusline = " %{mode()} │ %f %m%r %= %y │ %l:%c │ %p%% "


-- ── NETRW ───────────────────────────────────────────────────
vim.g.netrw_banner    = 0
vim.g.netrw_liststyle = 3


-- ── TREESITTER (built-in parsers only) ──────────────────────
vim.api.nvim_create_autocmd("FileType", {
  pattern  = { "c", "lua", "vim", "vimdoc" },
  callback = function()
    pcall(vim.treesitter.start)
  end,
})


-- ── BOOTSTRAP lazy.nvim ─────────────────────────────────────
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- ── PLUGINS ─────────────────────────────────────────────────
require("lazy").setup({
  {
    "catppuccin/nvim",
    name     = "catppuccin",
    priority = 1000,
    opts = {
      flavour                = "mocha",
      transparent_background = true,
      term_colors            = true,
    },
  },
}, { ui = { border = "rounded" } })


-- ── COLORSCHEME ─────────────────────────────────────────────
vim.cmd("colorscheme catppuccin")


-- ── KEYMAPS ─────────────────────────────────────────────────
local map = function(mode, key, cmd, desc)
  vim.keymap.set(mode, key, cmd, { silent = true, desc = desc })
end

-- Window navigation
map("n", "<C-h>", "<C-w>h", "Window left")
map("n", "<C-j>", "<C-w>j", "Window down")
map("n", "<C-k>", "<C-w>k", "Window up")
map("n", "<C-l>", "<C-w>l", "Window right")

-- Scroll centered
map("n", "<C-d>", "<C-d>zz", "Scroll down")
map("n", "<C-u>", "<C-u>zz", "Scroll up")

-- Search results centered
map("n", "n", "nzzzv", "Next result")
map("n", "N", "Nzzzv", "Prev result")

-- Move selected lines up/down
map("v", "J", ":m '>+1<CR>gv=gv", "Move line down")
map("v", "K", ":m '<-2<CR>gv=gv", "Move line up")

-- Indent and stay in visual mode
map("v", "<", "<gv", "Indent left")
map("v", ">", ">gv", "Indent right")

-- Save
map({ "n", "i" }, "<C-s>", "<cmd>w<CR>", "Save")

-- Buffers
map("n", "<S-l>", "<cmd>bnext<CR>",        "Next buffer")
map("n", "<S-h>", "<cmd>bprevious<CR>",    "Prev buffer")
map("n", "<leader>bd", "<cmd>bdelete<CR>", "Delete buffer")

-- Clear search highlight
map("n", "<Esc>", "<cmd>nohl<CR>", "Clear highlights")

-- File explorer
map("n", "<leader>e", "<cmd>Ex<CR>", "File explorer")

-- Paste without losing clipboard
map("x", "<leader>p", '"_dP', "Paste keep register")

-- Replace word under cursor across file
map("n", "<leader>r", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", "Replace word")


-- ── AUTOCOMMANDS ────────────────────────────────────────────

-- Flash yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ timeout = 150 })
  end,
})

-- Strip trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    local pos = vim.api.nvim_win_get_cursor(0)
    vim.cmd([[%s/\s\+$//e]])
    vim.api.nvim_win_set_cursor(0, pos)
  end,
})

-- Return to last position when reopening a file
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    if mark[1] > 1 and mark[1] <= vim.api.nvim_buf_line_count(0) then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})

-- Close help/quickfix with q
vim.api.nvim_create_autocmd("FileType", {
  pattern  = { "help", "man", "qf", "checkhealth" },
  callback = function(ev)
    vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = ev.buf, silent = true })
  end,
})

-- Rebalance splits on terminal resize
vim.api.nvim_create_autocmd("VimResized", {
  callback = function() vim.cmd("wincmd =") end,
})
