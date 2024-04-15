-- Navigation 
---- Shift-key buffer navigation
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprev<CR>", opts)

---- Ranger
lvim.builtin.which_key.mappings["R"] = { "<cmd>RnvimrToggle<CR>", "Ranger VFE" }

-- Python file bindings
-- lvim.builtin.which_key.mappings["C"] = {
--   name = "Python",
--   ["c"] = { "<cmd>lua require('swenv.api').pick_venv()<CR>", "Choose Env" },
-- }

-- To-do comments
lvim.builtin.which_key.mappings["t"] = {
    name = "To-Do Comments",
    ["j"] = { "<cmd>lua require('todo-comments').jump_next()<CR>", "Jump to next todo comment" },
    ["k"] = { "<cmd>lua require('todo-comments').jump_prev()<CR>", "Jump to prev todo comment" },
    ["s"] = { "<cmd>TodoTelescope<CR>", "Search todo comments" },
    -- ["q"] = { "<cmd>TodoQuickFix<CR>", "Quick-fix list todo comments" },
    ["t"] = { "<cmd>TodoTrouble<CR>", "Examine todo comments"}
}

-- Symbols outline
lvim.builtin.which_key.mappings["o"] = { "<cmd>SymbolsOutline<CR>" , "Symbols outline" }

-- Neorg
lvim.builtin.which_key.mappings["n"] = {
    name = "Neorg",
    ["c"] = {"<cmd>Neorg toggle-concealer<CR>", "Toggle concealment"},
    ["e"] = {"<cmd>Neorg toc<CR>", "Open table of contents"},
    ["j"] = {"<cmd>Neorg journal today<CR>", "Today's journal entry"},
    ["q"] = {"<cmd>Neorg workspace quicknotes<CR>", "Quicknotes index"},
    ["r"] = {"<cmd>Neorg workspace research<CR>", "Research notes index"},
    -- Notes render
    ["m"] = {"<cmd>MarkdownPreviewToggle<CR>", "Toggle Markdown preview" },
}

-- Marks
lvim.builtin.which_key.mappings["m"] = { "<cmd>MarksQFListAll<CR>" , "List marks" }

-- Noice
lvim.builtin.which_key.mappings[','] = { "<cmd>NoiceDismiss<CR>", "Dismiss notifications" }

-- ToggleTerm
-- lvim.builtin.which_key.mappings['\\'] = { "<cmd>ToggleTerm<CR>", "Terminal (toggle)" }
