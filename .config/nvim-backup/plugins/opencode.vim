" OpenCode configuration
lua << EOF
require('opencode').setup({
  window = {
    position = 'center',
    width = 0.8,
    height = 0.8,
  },
  auto_start = true,
  cmd = { "opencode" },
})
vim.env.PATH = vim.env.PATH
  .. ":" .. vim.fn.expand("~/.cargo/bin")
  .. ":" .. vim.fn.expand("~/.nvm/versions/node/v20.18.3/bin")

-- Keymaps
local opencode = require("opencode")
vim.keymap.set("n", "<leader>oA", function() opencode.ask() end, { desc = "Ask opencode" })
vim.keymap.set("n", "<leader>oa", function() opencode.ask("@cursor: ") end, { desc = "Ask opencode about this" })
vim.keymap.set("v", "<leader>oa", function() opencode.ask("@selection: ") end, { desc = "Ask opencode about selection" })
vim.keymap.set("n", "<leader>ot", function() opencode.toggle() end, { desc = "Toggle embedded opencode" })
vim.keymap.set("n", "<leader>on", function() opencode.command("session_new") end, { desc = "New session" })
vim.keymap.set("n", "<leader>oy", function() opencode.command("messages_copy") end, { desc = "Copy last message" })
vim.keymap.set("n", "<S-C-u>", function() opencode.command("messages_half_page_up") end, { desc = "Scroll messages up" })
vim.keymap.set("n", "<S-C-d>", function() opencode.command("messages_half_page_down") end, { desc = "Scroll messages down" })
vim.keymap.set({ "n", "v" }, "<leader>op", function() opencode.select_prompt() end, { desc = "Select prompt" })
vim.keymap.set("n", "<leader>oe", function() opencode.prompt("Explain @cursor and its context") end, { desc = "Explain code near cursor" })
EOF

