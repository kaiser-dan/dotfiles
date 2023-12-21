require("visual_studio_code").setup({
    priority = 100,
    config = function()
        vim.cmd([[colorscheme visual_studio_code]])
    end,
})

-- lvim.colorscheme = "visual_studio_code"
lvim.colorscheme = "sonokai"
