-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- Add back my cursor column.
-- shortens vim.opt(value) to just opt(key) via local variable assignment(=).
local opt = vim.opt
-- Adding back my Cursor column.
opt.cursorcolumn = true
