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
    { "<c-a>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
    { "<c-s>", "<cmd><C-U>TmuxNavigateDown<cr>" },
    { "<c-w>", "<cmd><C-U>TmuxNavigateUp<cr>" },
    { "<c-d>", "<cmd><C-U>TmuxNavigateRight<cr>" },
    { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
  }
}
