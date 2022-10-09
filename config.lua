require "user.plugins"
require "user.options"
require "user.keymaps"
require "user.autocommands"
require "user.lsp"
require "user.neoscroll"
require "user.fidget"
require "user.harpoon"
require "user.cybu"
require "user.surround"
require "user.bookmark"
require "user.todo-comments"
require "user.jaq"
require "user.lab"
require "user.git"
-- require "user.zen-mode"
require "user.inlay-hints"
require "user.whichkey"
require "user.telescope"
require "user.go-ide"
-- require "user.navic"
-- require "user.winbar"
--
--Was trying to get navic to show the Go function names. Couldn't get it to work
--https://github.com/SmiteshP/nvim-navic
--It could be that the lunarvim lsp configuration is clobbering this. Need to figure
--out how to inject this into lunarvim.
--
-- local navic = require("nvim-navic")
-- require("lspconfig").gopls.setup {
--     on_attach = function(client, bufnr)
--         navic.attach(client, bufnr)
--     end
-- }
-- vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
-- vim.o.statusline = "%{%v:lua.require'nvim-navic'.get_location()%}"
-- --  OR
-- vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
