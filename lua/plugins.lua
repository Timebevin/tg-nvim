local packer = require('packer')
packer.startup({
    function(use)
        -- Packer 可以管理自己本身
        use('wbthomason/packer.nvim')

        -- 插件列表...
        -- colorschemes 主题
        -- tokyonight
        use('folke/tokyonight.nvim')
        -- OceanicNext
        use('mhartington/oceanic-next')
        -- gruvbox
        use({ 'ellisonleao/gruvbox.nvim', requires = { 'rktjmp/lush.nvim' } })
        -- nord
        use('shaunsingh/nord.nvim')
        -- onedark
        use('ful1e5/onedark.nvim')
        -- nightfox
        use('EdenEast/nightfox.nvim')
        -- 侧边树插件
        use({ 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' })
        -- bufferline (新增)
        use({ 'akinsho/bufferline.nvim', requires = { 'kyazdani42/nvim-web-devicons', 'moll/vim-bbye' } })
        -- lualine (新增)
        use({ 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons' } })
        use('arkav/lualine-lsp-progress')
        -- telescope （新增）
        use({ 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } })
        -- telescope 拓展插件
        use('LinArcX/telescope-env.nvim')
        -- dashboard-nvim (新增)
        use('glepnir/dashboard-nvim')
        -- project
        use('ahmedkhalf/project.nvim')
        -- treesitter （新增）
        use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
        --------------------- LSP --------------------
        -- lspconfig
        use({ 'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer' })
        -- 补全引擎
        use('hrsh7th/nvim-cmp')
        use({ 'neoclide/coc.nvim', branch = 'release' })
        -- snippet 引擎
        use('hrsh7th/vim-vsnip')
        -- 补全源
        use('hrsh7th/cmp-vsnip')
        use('hrsh7th/cmp-nvim-lsp') -- { name = nvim_lsp }
        use('hrsh7th/cmp-buffer') -- { name = 'buffer' },
        use('hrsh7th/cmp-path') -- { name = 'path' }
        use('hrsh7th/cmp-cmdline') -- { name = 'cmdline' }

        -- 常见编程语言代码段
        use('rafamadriz/friendly-snippets')
        -- ui
        use('onsails/lspkind-nvim')
        -- indent-blankline
        use('lukas-reineke/indent-blankline.nvim')
        use('tami5/lspsaga.nvim')
        -- 代码格式化
        -- use("mhartington/formatter.nvim")
        use({ 'jose-elias-alvarez/null-ls.nvim', requires = 'nvim-lua/plenary.nvim' })
        use({ 'jose-elias-alvarez/nvim-lsp-ts-utils', requires = 'nvim-lua/plenary.nvim' })
        -- JSON 增强
        use('b0o/schemastore.nvim')
        -- java,go debug
        -- use('dradtke/vim-dap')
        use('eliba2/vim-node-inspect')
        -- git
        use('airblade/vim-gitgutter')
        use('github/copilot.vim')
        use('easymotion/vim-easymotion')
        use('jamshedvesuna/vim-markdown-preview')
        use('gko/vim-coloresque')
        use('kevinhwang91/rnvimr')
        -- html实时预览插件
        -- use('spf13/vim-preview')
        -- 括号补全插件
        use('windwp/nvim-autopairs')
        -- 注释插件
        use('numToStr/Comment.nvim')
    end,
    config = {
        -- 并发数限制
        max_jobs = 16,
        -- 自定义源
        git = {
            -- default_url_format = 'https://hub.fastgit.xyz/%s',
            --default_url_format = 'https://mirror.ghproxy.com/%s',
            --default_url_format = 'https://gitcode.net/mirrors/%s',
            --default_url_format = 'https://gitclone.com/github.com/%s',
            default_url_format = 'https://github.com/%s',
            --default_url_format = 'https://gitee.com/%s',
        },
    },
})

pcall(
    vim.cmd,
    [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerInstall
    augroup end
  ]]
)
