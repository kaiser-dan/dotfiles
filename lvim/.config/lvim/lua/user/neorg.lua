require("neorg").setup({
    load = {
      ["core.defaults"] = {}, -- Loads default behaviour
      ["core.concealer"] = {}, -- Adds pretty icons 
      ["core.dirman"] = { -- Manages Neorg workspaces
        config = {
          workspaces = {
            notes = "~/notes",
            quicknotes = "~/notes/quicknotes",
            research = "~/notes/research",
            meetings = "~/notes/meetings",
            teaching = "~/notes/teaching",
            personal = "~/notes/personal",
          },
          default_workspace = "quicknotes",
        },
      },
    },
})

-- Increase concealment by default
vim.cmd([[set conceallevel=2]])
