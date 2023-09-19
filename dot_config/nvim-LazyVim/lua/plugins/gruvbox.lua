return {
  -- Add gruvbox theme plugin.
  { "ellisonleao/gruvbox.nvim" },
  -- Configure LV to use the gruvbox theme.
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
