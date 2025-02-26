return {

    -- LSP Support
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        {"hrsh7th/nvim-cmp"},
        {"hrsh7th/cmp-nvim-lsp"},
        {"hrsh7th/cmp-buffer"},
        {"saadparwaiz1/cmp_luasnip"},
        {"onsails/lspkind.nvim"},
        {
            "zbirenbaum/copilot-cmp",
            config = function()
                require("copilot_cmp").setup()
            end
        },

        -- Snippets
        {"L3MON4D3/LuaSnip"},
    },
    config = function()
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('user_lsp_attach', {clear = true}),
            callback = function(event)
                local opts = {buffer = event.buf}

                vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
                vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
                vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
                vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
                vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
                vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)
                vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
                vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
                vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
                vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
            end,
        })

        local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = {'jdtls', 'rust_analyzer'},
            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup({
                        capabilities = lsp_capabilities,
                    })
                end,
                lua_ls = function()
                    require('lspconfig').lua_ls.setup({
                        capabilities = lsp_capabilities,
                        settings = {
                            Lua = {
                                runtime = {
                                    version = 'LuaJIT'
                                },
                                diagnostics = {
                                    globals = {'vim'},
                                },
                                workspace = {
                                    library = {
                                        vim.env.VIMRUNTIME,
                                    }
                                }
                            }
                        }
                    })
                end,
            }
        })

        local cmp = require('cmp')
        local cmp_select = {behavior = cmp.SelectBehavior.Select}
        local lspkind = require('lspkind')
        local luasnip = require('luasnip')
        local check_backspace = function()
            local col = vim.fn.col(".") - 1
            return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
        end

        cmp.setup({
            sources = cmp.config.sources({
                {name = 'nvim_lsp'},
                {name = 'luasnip'},
                {name = 'copilot'}
            }, {
                {name = 'buffer'},
            }),
            formatting = {
                format = lspkind.cmp_format({
                    mode = 'symbol',
                    max_width = 50,

                    symbol_map = { Copilot = "" }
                })
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({select = true}),
                ['<C-Space>'] = cmp.mapping.complete(),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif require("copilot.suggestion").is_visible() then
                        require("copilot.suggestion").accept()
                    elseif luasnip.expandable() then
                        luasnip.expand()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    elseif check_backspace() then
                        fallback()
                    else
                        fallback()
                    end
                end, {
                    "i",
                    "s",
                }),
            }),
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
        })
    end
}
