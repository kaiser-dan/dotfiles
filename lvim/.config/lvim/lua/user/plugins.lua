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
    -- "pwntester/octo.nvim",
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
    {
        "christoomey/vim-tmux-navigator",
        lazy = false,
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
            -- { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    },
    "kevinhwang91/rnvimr",
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2"
    },
    "chentoast/marks.nvim",
    -- Aesthetics
    "askfiy/visual_studio_code",
    "ellisonleao/gruvbox.nvim",
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
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {},
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({})
        end
    },
    {
        "m4xshen/hardtime.nvim",
        dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
        opts = {}
    },
    -- Unknown
    "stevearc/dressing.nvim",
}
