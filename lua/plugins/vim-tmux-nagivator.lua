-- The plugin will allow you to navigate seamlessly between
-- vim and tmux splits using a consistent set of hotkeys.
-- https://github.com/christoomey/vim-tmux-navigator
return {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
    "TmuxNavigatorProcessList",
  },
  keys = {
    { "<c-h>", "<cmd> TmuxNavigateLeft <cr>", { desc = "Focus split left" } },
    { "<c-j>", "<cmd> TmuxNavigateDown <cr>", { desc = "Focus spit down" } },
    { "<c-k>", "<cmd> TmuxNavigateUp <cr>", { desc = "Focus split up" } },
    { "<c-l>", "<cmd> TmuxNavigateRight <cr>", { desc = "Focus split right" } },
    { "<c-Left>", "<cmd> TmuxNavigateLeft <cr>", { desc = "Focus split left" } },
    { "<c-Down>", "<cmd> TmuxNavigateDown <cr>", { desc = "Focus spit down" } },
    { "<c-Up>", "<cmd> TmuxNavigateUp <cr>", { desc = "Focus split up" } },
    { "<c-Right>", "<cmd> TmuxNavigateRight <cr>", { desc = "Focus split right" } },
  },
}
