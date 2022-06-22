local status, comment = pcall(require, 'Comment')
if not status then
    vim.notify('没有找到 Comment')
    return
end

local status, ft = pcall(require, 'Comment.ft')
if not status then
    vim.notify('没有找到 Comment.ft')
    return
end

-- 1. Using set function

-- Just set only line comment
ft.set('yaml', '#%s')

-- Or set both line and block commentstring
-- You can also chain the set calls
ft.set('javascript', { '//%s', '/*%s*/' }).set('conf', '#%s')

-- 2. Metatable magic

-- One filetype at a time
ft.javascript = { '//%s', '/*%s*/' }
ft.yaml = '#%s'

-- Multiple filetypes
ft({ 'go', 'rust' }, { '//%s', '/*%s*/' })
ft({ 'toml', 'graphql' }, '#%s')

-- 3. Get the whole set of commentstring
ft.lang('lua') -- { '--%s', '--[[%s]]' }
ft.lang('javascript') -- { '//%s', '/*%s*/' }

comment.setup({
    ---Add a space b/w comment and the line
    ---@type boolean|fun():boolean
    padding = true,

    ---Whether the cursor should stay at its position
    ---NOTE: This only affects NORMAL mode mappings and doesn't work with dot-repeat
    ---@type boolean
    sticky = true,

    ---Lines to be ignored while comment/uncomment.
    ---Could be a regex string or a function that returns a regex string.
    ---Example: Use '^$' to ignore empty lines
    ---@type string|fun():string
    ignore = nil,

    ---LHS of toggle mappings in NORMAL + VISUAL mode
    ---@type table
    toggler = {
        ---Line-comment toggle keymap
        line = 'gcc',
        ---Block-comment toggle keymap
        block = 'gbc',
    },

    ---LHS of operator-pending mappings in NORMAL + VISUAL mode
    ---@type table
    opleader = {
        ---Line-comment keymap
        line = 'gc',
        ---Block-comment keymap
        block = 'gb',
    },

    ---LHS of extra mappings
    ---@type table
    extra = {
        ---Add comment on the line above
        above = 'gcO',
        ---Add comment on the line below
        below = 'gco',
        ---Add comment at the end of line
        eol = 'gcA',
    },
    extended = {
        'g>[count]{motion}',
    },
    ---Create basic (operator-pending) and extended mappings for NORMAL + VISUAL mode
    ---NOTE: If `mappings = false` then the plugin won't create any mappings
    ---@type boolean|table
    mappings = {
        ---Operator-pending mapping
        ---Includes `gcc`, `gbc`, `gc[count]{motion}` and `gb[count]{motion}`
        ---NOTE: These mappings can be changed individually by `opleader` and `toggler` config
        basic = true,
        ---Extra mapping
        ---Includes `gco`, `gcO`, `gcA`
        extra = true,
        ---Extended mapping
        ---Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
        extended = true,
    },

    ---Pre-hook, called before commenting the line
    ---@type fun(ctx: CommentCtx):string
    -- NOTE: The example below is a proper integration and it is RECOMMENDED.
    pre_hook = nil,
    ---Post-hook, called after commenting is done
    ---@type fun(ctx: CommentCtx)
    post_hook = nil,
})
