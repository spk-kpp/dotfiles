return {
    {
        "nvimtools/none-ls.nvim",
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.completion.spell,
                    null_ls.builtins.formatting.prettier,
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.formatting.isort,
                    null_ls.builtins.formatting.clang_format,
                    null_ls.builtins.formatting.shfmt,
                    --null_ls.builtins.formatting.djlint,
                },
            })
            vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
            vim.api.nvim_create_user_command("FormatPrettier", function()
                vim.lsp.buf.format({ name = "prettier" })
            end, {})
        end,
    },
}
