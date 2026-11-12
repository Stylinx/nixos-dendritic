return {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = true,
    keys = {
        { "<leader>cc", "<cmd>ClaudeCode<cr>",           desc = "Toggle Claude Code" },
        { "<leader>cf", "<cmd>ClaudeCodeFocus<cr>",      desc = "Focus Claude Code" },
        { "<leader>cs", "<cmd>ClaudeCodeSend<cr>",       mode = "v",                 desc = "Send selection to Claude" },
        { "<leader>ca", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept Claude diff" },
        { "<leader>cd", "<cmd>ClaudeCodeDiffDeny<cr>",   desc = "Deny Claude diff" },
    },
}
