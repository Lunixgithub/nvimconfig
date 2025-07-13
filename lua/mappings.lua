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

if not ok then
  return -- Skip setup if which-key isn't loaded yet
end

wk.add({
  { "<leader>f",  group = "file" }, -- group
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
  { "<leader>fb", function() print("hello") end,   desc = "Foobar" },
  { "<leader>fn", desc = "New File" },
  { "<leader>f1", hidden = true },                                      -- hide this keymap
  { "<leader>w",  proxy = "<c-w>",                 group = "windows" }, -- proxy to window mappings
  {
    "<leader>b",
    group = "buffers",
    expand = function()
      return require("which-key.extras").expand.buf()
    end
  },
  {
    -- Nested mappings are allowed and can be added in any order
    -- Most attributes can be inherited or overridden on any level
    -- There's no limit to the depth of nesting
    mode = { "n", "v" },                          -- NORMAL and VISUAL mode
    { "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
    { "<leader>w", "<cmd>w<cr>", desc = "Write" },
  }
})
