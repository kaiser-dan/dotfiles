-- Navigation extras
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprev<CR>", opts)

lvim.builtin.which_key.mappings["R"] = { "<cmd>RnvimrToggle<CR>", "Ranger VFE" }

-- Python file bindings
lvim.builtin.which_key.mappings["C"] = {
  name = "Python",
  ["c"] = { "<cmd>lua require('swenv.api').pick_venv()<CR>", "Choose Env" },
}

-- To-do comments
lvim.builtin.which_key.mappings["t"] = {
    name = "To-Do Comments",
    ["j"] = { "<cmd>lua require('todo-comments').jump_next()<CR>", "Jump to next todo comment" },
    ["k"] = { "<cmd>lua require('todo-comments').jump_prev()<CR>", "Jump to prev todo comment" },
    ["s"] = { "<cmd>TodoTelescope<CR>", "Search todo comments" },
    ["q"] = { "<cmd>TodoQuickFix<CR>", "Quick-fix list todo comments" },
    ["f"] = { "<cmd>TodoTrouble<CR>", "Examine todo comments"}
}

-- Symbols outline
lvim.builtin.which_key.mappings["o"] = { "<cmd>SymbolsOutline<CR>" , "Symbols outline" }

-- Neorg
lvim.builtin.which_key.mappings["n"] = {
    name = "Neorg",
    ["q"] = { "<cmd>Neorg workspace quicknotes<CR>", "Quicknotes index"},
    ["n"] = { "<LocalLeader>nn<CR>", "New note" },
}
