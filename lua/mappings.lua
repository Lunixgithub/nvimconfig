local map = vim.keymap.set

-- 1. Set all your keymaps normally without which-key
-- Use your existing map calls, for example:

-- general mappings
map("n", "<C-s>", "<cmd> w <CR>", { desc = "Save File" })
map("i", "jk", "<ESC>", { desc = "Exit Insert Mode" })
map("n", "<C-c>", "<cmd> %y+ <CR>", { desc = "Copy Whole File" })

-- nvim-tree
map("n", "<leader>E", "<cmd> NvimTreeToggle <CR>", { desc = "Toggle File Tree" })
map("n", "<leader>e", "<cmd> NvimTreeFocus <CR>", { desc = "Focus File Tree" })

-- telescope
map("n", "<leader>ff", "<cmd> Telescope find_files <CR>", { desc = "Find Files" })
map("n", "<leader>fo", "<cmd> Telescope oldfiles <CR>", { desc = "Recent Files" })
map("n", "<leader>fw", "<cmd> Telescope live_grep <CR>", { desc = "Live Grep" })
map("n", "<leader>gt", "<cmd> Telescope git_status <CR>", { desc = "Git Status" })



-- bufferline
map("n", "<Tab>", "<cmd> BufferLineCycleNext <CR>", { desc = "Next Buffer" })
map("n", "<S-Tab>", "<cmd> BufferLineCyclePrev <CR>", { desc = "Previous Buffer" })
map("n", "<C-q>", "<cmd> bd <CR>", { desc = "Close Buffer" })

-- comment.nvim
map("n", "<leader>/", "gcc", { remap = true, desc = "Toggle Comment Line" })
map("v", "<leader>/", "gc", { remap = true, desc = "Toggle Comment Selection" })

-- code action
map({ "n", "x" }, "<leader>ca", function()
  require("tiny-code-action").code_action()
end, { noremap = true, silent = true, desc = "Code Action" })

--  ormat
map("n", "<leader>fm", function()
  require("conform").format()
end, { desc = "Format File" })

-- safely require which-key and register groups if available
local ok, wk = pcall(require, "which-key")
if ok then
  wk.setup({})
  wk.register({
    { "<leader>ca", group = "Code Actions" },
    { "<leader>e",  group = "NvimTree" },
    { "<leader>f",  group = "Find" },
    { "<leader>g",  group = "Git" },
  })
end
