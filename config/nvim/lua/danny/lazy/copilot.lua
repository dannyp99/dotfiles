return
{
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
        require("copilot").setup({
            panel = {
                enabled = false,
                auto_refresh = false,
                keymap = {
                    jump_prev = "[[",
                    jump_next = "]]",
                    accept = "<CR>",
                    refresh = "gr",
                    open = "<M-CR>",
                },
                layout = {
                    position = "bottom", -- | top | left | right
                    ratio = 0.4,
                    -- recommend a layout change

                },
            },
            suggestion = {
                enabled = false,
                auto_trigger = true,
                debounce = 75,
                keymap = {
                    accept = false,
                    accept_word = false,
                    accept_line = false,
                    next = "<M-]>",
                    prev = "<M-[>",
                    dismiss = "<C-]>",
                },
            },
            filetypes = {
                help = false,
                gitcommit = false,
                gitrebase = false,
                hgcommit = false,
                svn = false,
                cvs = false,
                ["."] = false,
            },
            on_status_update = require("lualine").refresh,
        })
    end
};
