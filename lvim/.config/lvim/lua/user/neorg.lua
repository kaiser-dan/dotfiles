require("neorg").setup({
    load = {
      ["core.defaults"] = {}, -- Loads default behaviour
      ["core.concealer"] = {}, -- Adds pretty icons to your documents
      ["core.dirman"] = { -- Manages Neorg workspaces
        config = {
          workspaces = {
            notes = "~/notes",
            quicknotes = "~/notes/quicknotes",
            research = "~/notes/reseach",
          },
          default_workspace = "quicknotes",
        },
      },
    },
})
