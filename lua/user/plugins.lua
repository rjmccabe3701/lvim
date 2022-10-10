-- Additional Plugins
lvim.plugins = {
  -- "nvim-treesitter/playground",
  -- "mfussenegger/nvim-jdtls",
  -- "karb94/neoscroll.nvim",
  -- "j-hui/fidget.nvim",
  -- "windwp/nvim-ts-autotag",
  -- "kylechui/nvim-surround",
  -- "christianchiarulli/harpoon",
  -- "MattesGroeger/vim-bookmarks",
  -- "NvChad/nvim-colorizer.lua",
  -- "ghillb/cybu.nvim",
  -- "moll/vim-bbye",
  -- "folke/todo-comments.nvim",
  -- "windwp/nvim-spectre",
  -- "is0n/jaq-nvim",
  -- {
  --   "0x100101/lab.nvim",
  --   run = "cd js && npm ci",
  -- },
  -- "f-person/git-blame.nvim",
  -- "ruifm/gitlinker.nvim",
  -- "mattn/vim-gist",
  -- "mattn/webapi-vim",
  -- -- "folke/zen-mode.nvim",
  -- "lvimuser/lsp-inlayhints.nvim",
  "lunarvim/darkplus.nvim",
  "tpope/vim-fugitive",
  "tpope/vim-surround",
  { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} },
  -- "nvim-lualine/lualine.nvim"
  -- "lunarvim/templeos.nvim",
  -- {
  --   "SmiteshP/nvim-navic",
  --   requires = "neovim/nvim-lspconfig"
  -- },

  -- "fgheng/winbar.nvim"

  -- https://github.com/jose-elias-alvarez/typescript.nvim
  -- "rmagatti/auto-session",
  -- "rmagatti/session-lens"
}

lvim.builtin.nvimtree.active = false
lvim.builtin.lualine.active = true
require("dapui").setup({expand_lines = false})
-- lvim.builtin.lualine.options.globalstatus = false
local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  vim.keymap.set("n", "dI", function()
    --This will inspect the variable under the cursor
    dapui.eval()
    --Need to run twice to focus in the variable window
    dapui.eval()
  end)
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  --Unmap the variable inspect shortcut
  vim.keymap.del("n", "dI")
end
-- dap.listeners.before.event_exited["dapui_config"] = function()
--   dapui.close()
-- end
