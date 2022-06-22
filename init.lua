-- 基础配置
require('basic')
-- Packer插件管理
require('plugins')
-- 主题设置
require('colorscheme')
-- 快捷键映射
require('keybindings')
-- 插件配置
require('plugin-config.nvim-tree')
-- 顶部标签栏
require('plugin-config.bufferline')
-- 底部信息栏
require('plugin-config.lualine')
-- 文件搜索
require('plugin-config.telescope')
-- 自定义首页
require('plugin-config.dashboard')
-- project
require('plugin-config.project')
-- 代码高亮
require('plugin-config.nvim-treesitter')
-- 内置LSP (新增)
require('lsp.setup')
-- 代码补全
require('lsp.cmp')
require('lsp.ui')
require('plugin-config.indent-blankline')
--require("lsp.formatter")
require('lsp.null-ls')
-- markdown
require('plugin-config.markdown')
require('plugin-config.nvim-autopairs')
require('plugin-config.comment')
