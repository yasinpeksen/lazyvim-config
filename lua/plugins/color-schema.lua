return {
  -- add catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    auto_integrations = true,
    opts = { flavor = "mocha" },
  },

  -- configure lazyvim to load catppuccin
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
