-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- Extend plugins
require("user/plugins")

-- Set global options
require("user/options")

-- Create custom global bindings
require("user/keymaps")
require("user/harpoon")

-- Specify language servers
require("user/lsp")

-- Specify debug adapters
require("user/dap")

-- Core plugin overloading
require("user/treesitter")

-- User plugins
require("user/symbols-outline")
require("user/todo-comments")
require("user/octo")
require("user/neorg")
require("user/usage")

-- *Aesthetics*
require("user/colors")

vim.cmd([[set conceallevel=2]])
