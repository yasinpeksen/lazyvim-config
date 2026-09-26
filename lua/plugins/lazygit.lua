return {
  "folke/snacks.nvim",
  opts = {
    lazygit = {
      config = {
        os = {
          editPreset = "nvim-remote",
          edit = '[ -z "$NVIM" ] && (nvim -- {{filename}}) || (nvim --server "$NVIM" --remote-send "q" && nvim --server "$NVIM" --remote {{filename}})',
        },
      },
    },
  },
}
