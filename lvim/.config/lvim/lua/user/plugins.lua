lvim.plugins = {
    -- Notes
    {
        "nvim-neorg/neorg",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    "folke/todo-comments.nvim",
    "simrat39/symbols-outline.nvim",
    -- Git
    "kdheepak/lazygit.nvim",
    "pwntester/octo.nvim",
    -- DAPs and Testing
    "nvim-neotest/neotest",
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },
    -- Python
    "ChristianChiarulli/swenv.nvim",
    "mfussenegger/nvim-dap-python",
    "nvim-neotest/neotest-python",
    -- Navigation
    "kevinhwang91/rnvimr",
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2"
    },
    "chentoast/marks.nvim",
    -- Aesthetics
    "askfiy/visual_studio_code",
    "fenetikm/falcon",
    "folke/tokyonight.nvim",
    "glepnir/zephyr-nvim",
    "sainnhe/everforest",
    "sainnhe/sonokai",
    "sainnhe/edge",
    "sainnhe/gruvbox-material",
    "rcarriga/nvim-notify",
    -- Miscellaneous productivity
    "gaborvecsei/usage-tracker.nvim",
    {
        'VonHeikemen/fine-cmdline.nvim',
        dependencies = { "MunifTanjim/nui.nvim" }
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    -- Unknown
    "stevearc/dressing.nvim",
}
