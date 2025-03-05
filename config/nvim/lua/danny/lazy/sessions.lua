return {
    "rmagatti/auto-session",
    lazy = false,
    keys = {
        { '<leader>ls', '<cmd>SessionSearch<CR>', desc = 'Session search'}
    },
    opts = {
        suppressed_dirs = {"~/", "~/Projects", "~/Downloads", "/"},
        session_lens = {
            buftypes_to_ignore = {},
            load_on_setup = true,
            theme_conf = { border = true },
            previewer = false,
        },
    }
    --[[ config = function()
        require("auto-session").setup({
            suppressed_dirs = {"~/", "~/Projects", "~/Downloads", "/"},
            session_lens = {
                buftypes_to_ignore = {},
                load_on_setup = true,
                theme_conf = { border = true },
                previewer = false,
            },
            vim.keymap.set("n", "<leader>ls", require("auto-session.session-lens").search_session, {
                noremap = true,
            }),
        })
    end ]]
}
