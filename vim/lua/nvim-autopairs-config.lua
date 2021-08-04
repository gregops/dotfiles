local npairs = require('nvim-autopairs')
local remap = vim.api.nvim_set_keymap

npairs.setup{
  break_line_filetype = nil, -- enable this rule for all filetypes
  pairs_map = {
    ["'"] = "'",
    ['"'] = '"',
    ['('] = ')',
    ['['] = ']',
    ['{'] = '}',
    ['`'] = '`',
  },
  disable_filetype = { "TelescopePrompt" },
  html_break_line_filetype = {
    'html' , 'vue' , 'typescriptreact' , 'svelte' , 'javascriptreact'
  },
  -- ignore alphanumeric, operators, quote, curly brace, and square bracket
  ignored_next_char = "[%w%.%+%-%=%/%,\"'{%[]"
}

-- npairs.add_rules(require('nvim-autopairs.rules.endwise-lua'))
-- npairs.add_rules(require('nvim-autopairs.rules.endwise-ruby'))
