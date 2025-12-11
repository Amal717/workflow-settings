return {
  -- 1. Configure the Catppuccin plugin
  -- This ensures it is properly set up, even if it was manually installed
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- Load early
  },

  -- 2. Ensure LazyVim uses the theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
}
