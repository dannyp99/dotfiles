return
{
    'github/copilot.vim',
    setup = function ()
        vim.g.copilot_enabled = 1
        vim.keymap.set('i', '<C-.>', '<Plug>(copilot-next)', { noremap = false })
        vim.keymap.set('i', '<C-,>', '<Plug>(copilot-previous)', { noremap = false })
    end,
};
