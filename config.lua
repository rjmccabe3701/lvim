require "user.plugins"
require "user.options"
-- require "user.keymaps"
-- require "user.autocommands"
-- require "user.lsp"
-- require "user.neoscroll"
-- require "user.fidget"
-- require "user.harpoon"
-- require "user.cybu"
-- require "user.surround"
-- require "user.bookmark"
-- require "user.todo-comments"
-- require "user.jaq"
-- require "user.lab"
-- require "user.git"
-- require "user.zen-mode"
-- require "user.inlay-hints"
-- require "user.whichkey"
-- require "user.telescope"
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
--
--

-- Returns current code context (used in lualine
local current_treesitter_context = function()
  local f = require'nvim-treesitter'.statusline({
    indicator_size = 100,
    type_patterns = {"class", "function", "method", "interface", "type_spec", "table"}
    -- type_patterns = {"class", "function", "method", "interface", "type_spec", "table", "if_statement", "for_statement", "for_in_statement"}
  })
  local fun_name = string.format("%s", f) -- convert to string, it may be a empty ts node
  if fun_name == "vim.NIL" then
    return " "
  end
  return " " .. fun_name
end

-- Override Lvim's lualine
lvim.builtin.lualine.on_config_done = function()

   require('lualine').setup {
     options = {
       icons_enabled = false,
       theme = 'onedark',
       component_separators = '|',
       section_separators = '',
       globalstatus = true
     },
     sections = {
       lualine_a = {'mode'},
       lualine_b = {'branch', 'diff', 'diagnostics'},
       lualine_c = {'filename'},
       lualine_x = {current_treesitter_context, 'encoding', 'fileformat', 'filetype'},
       lualine_y = {'progress'},
       lualine_z = {'location'}
     },
   }
end


function Map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function Nmap(shortcut, command)
  Map('n', shortcut, command)
end

function Imap(shortcut, command)
  Map('i', shortcut, command)
end

function Tmap(shortcut, command)
  Map('t', shortcut, command)
end

function Vmap(shortcut, command)
  Map('v', shortcut, command)
end


--Window movements
Nmap("<C-h>", "<C-w>h")
Nmap("<C-j>", "<C-w>j")
Nmap("<C-l>", "<C-w>l")
Nmap("<C-k>", "<C-w>k")
--Window movements in terminal mode
-- TODO: doesn't seem to work
Tmap("<C-h>", "<C-w>h")
Tmap("<C-j>", "<C-w>j")
Tmap("<C-l>", "<C-w>l")
Tmap("<C-k>", "<C-w>k")

--Cycle thru quickfix list
Nmap("[q", ":cn<CR>")
Nmap("]q", ":cp<CR>")

-- Paste over currently selected text without yanking it
Vmap("p", '"_dP')

-- Move text up and down
Map("v", "<C-j>", ":m .+1<CR>==")
Map("v", "<C-k>", ":m .-2<CR>==")
Map("x", "J", ":move '>+1<CR>gv-gv")
Map("x", "K", ":move '<-2<CR>gv-gv")
Map("x", "<C-j>", ":move '>+1<CR>gv-gv")
Map("x", "<C-k>", ":move '<-2<CR>gv-gv")

Nmap(",e", "<cmd>Explore<CR>")
Nmap(",s", "<cmd>Vexplore<CR>")
-- Nmap(",e", "<cmd>e <C-R>=expand(\"%:p:h\") . \"/\" <CR>")


--In visual move type "S-" and does a custom surround
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "cpp",
    "c",
  },
  callback = function()
    vim.cmd [[
      let b:surround_45 = "#if 0\n\r\n#endif\n"
    ]]
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "markdown",
  },
  callback = function()
    vim.cmd [[
      let b:surround_45 = "```\n\r\n```"
    ]]
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "python",
  },
  callback = function()
    vim.cmd [[
      let b:surround_45 = "\"\"\"\n\r\n\"\"\""
    ]]
  end,
})

lvim.builtin.which_key.mappings['s']['s'] = {"<cmd>Telescope grep_string<cr>", "Find String"}

