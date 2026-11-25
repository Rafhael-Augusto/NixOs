{ config, pkgs, ... }:

{

    environment.systemPackages = with pkgs; [
        nodejs_22
        typescript-language-server
        typescript
        tailwindcss-language-server
        vscode-langservers-extracted
        prettierd
        ripgrep
        fd
    ];

    programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;

        configure = {
            packages.myPlugins = with pkgs.vimPlugins; {
                start = [
                    telescope-nvim
                    nvim-treesitter.withAllGrammars
                    nvim-lspconfig
                    nvim-cmp
                    cmp-nvim-lsp
                    luasnip
                    vim-nix
                    nvim-tree-lua
                ];
            };

            customRC = ''
                set tabstop=4
                set shiftwidth=4
                set softtabstop=4
                set expandtab
                set autoindent
                set ignorecase
                set smartcase
                set clipboard=unnamedplus
                set number
                set relativenumber
                set cursorline
                
                lua << EOF
                vim.api.nvim_create_autocmd("FileType", {
                    pattern = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
                    callback = function() vim.treesitter.start() end,
                })

                vim.lsp.enable({ "ts_ls", "tailwindcss", "html", "cssls" })

                local cmp = require("cmp")
                cmp.setup({
                    snippet = { expand = function(args) require("luasnip").lsp_expand(args.body) end },
                    mapping = cmp.mapping.preset.insert({
                        ["<C-Space>"] = cmp.mapping.complete(),
                        ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    }),
                    sources = { { name = "nvim_lsp" } },
                })

                local builtin = require("telescope.builtin")
                vim.keymap.set("n", "<leader>ff", builtin.find_files)
                vim.keymap.set("n", "<leader>fg", builtin.live_grep)
                vim.keymap.set("n", "<leader>fb", builtin.buffers)

                require("nvim-tree").setup()
                vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
                EOF
            '';
        };
    };
}
