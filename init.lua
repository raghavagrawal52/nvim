-- Options

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.signcolumn = "yes"
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.hlsearch = true
vim.opt.breakindent = true
vim.opt.wrap = true
vim.opt.scrolloff = 22
vim.opt.hlsearch = true
vim.opt.guifont = "Iosevaka:h1"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.textwidth = 80

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.HINT] = " ",
    },
  },
  virtual_text = true,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Plugins
vim.pack.add({
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/saghen/blink.cmp",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/mason-org/mason-lspconfig.nvim",
  "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/folke/which-key.nvim",
  "https://github.com/junegunn/vim-easy-align",
  "https://github.com/supermaven-inc/supermaven-nvim",
  "https://github.com/folke/snacks.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/MeanderingProgrammer/render-markdown.nvim",
  "https://github.com/folke/lazydev.nvim",
  --colorschemes
  "https://github.com/blazkowolf/gruber-darker.nvim",
  "https://github.com/tjdevries/colorbuddy.nvim",
  "https://github.com/rktjmp/lush.nvim",
  "https://github.com/zenbones-theme/zenbones.nvim",
})


vim.cmd.packadd("nvim.undotree")

-- Setups

require("colorbuddy").setup()
vim.cmd.colorscheme "neobones"

require("nvim-treesitter.install").update("all")
require("telescope").setup({})
require('lualine').setup({})
-- require("supermaven-nvim").setup({})

require('render-markdown').setup({
  file_types = { "markdown", "vimwiki" },
})

require("oil").setup({
  columns = {
    "icon",
    "permissions",
    "size",
    "mtime",
  },
  view_options = {
    show_hidden = true,
  },
})

require("blink.cmp").setup({
  completion = {
    documentation = {
      auto_show = true,
    },
  },
  keymap = {
    ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
    ["<C-n>"] = { "select_next", "fallback_to_mappings" },

    ["<C-y>"] = { "select_and_accept", "fallback" },
    ["<C-e>"] = { "cancel", "fallback" },
    ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },

    ["<Tab>"] = { "snippet_forward", "fallback" },
    ["<S-Tab>"] = { "snippet_backward", "fallback" },

    ["<C-b>"] = { "scroll_documentation_up", "fallback" },
    ["<C-f>"] = { "scroll_documentation_down", "fallback" },

    ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
  },
  fuzzy = {
    implementation = "lua",
  },
})

-- Image viewer
---@type table
local snacks = require("snacks")
snacks.setup({
  image = {
    enabled = true,
    doc = {
      enabled = true,
      inline = true,
      float = true,
      max_width = 80,
      max_height = 40,
    },
  }
})

-- LSP
local lsp_servers = {
  lua_ls = {
    Lua = { workspace = { library = vim.api.nvim_get_runtime_file("lua", true) } },
  },
  clangd = {},
  rust_analyzer = {},
  zls = {},
}

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
  ensure_installed = vim.tbl_keys(lsp_servers),
})

for server, config in pairs(lsp_servers) do
  vim.lsp.config(server, {
    settings = config,

    on_attach = function(_, bufnr)
      vim.keymap.set("n", "grd", vim.lsp.buf.definition, { buffer = bufnr, desc = "vim.lsp.buf.definition()" })
      vim.keymap.set("n", "grf", vim.lsp.buf.format, { buffer = bufnr, desc = "vim.lsp.buf.format()" })
    end,
  })
end

-- KeyMaps

vim.keymap.set("n", "<leader>fc", "<cmd>tabe ~/.config/nvim/init.lua<CR>")
vim.keymap.set("n", "<C-c>", "<cmd>nohlsearch<CR>")
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-N>")
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set({ "n", "x" }, "ga", "<Plug>(EasyAlign)", { desc = "Easy align" })

require("which-key").setup({
  spec = {
    { "<leader>f", group = "[S]earch", icon = { icon = "", color = "green" } },
  },
})
local pickers = require("telescope.builtin")
vim.keymap.set("n", "<leader>fp", pickers.builtin, { desc = "[S]earch Builtin [P]ickers" })
vim.keymap.set("n", "<leader><leader>", pickers.buffers, { desc = "[S]earch [B]uffers" })
vim.keymap.set("n", "<leader>ff", pickers.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>fw", pickers.grep_string, { desc = "[S]earch Current [W]ord" })
vim.keymap.set("n", "<leader>fg", pickers.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>fr", pickers.resume, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>fh", pickers.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>fm", pickers.man_pages, { desc = "[S]earch [M]anuals" })

local function qf_jump(cmd)
  return function()
    vim.cmd(cmd)
    vim.cmd("normal! zvzz") -- open folds + center
  end
end

vim.keymap.set("n", "]q", qf_jump("cnext"), { desc = "Next quickfix" })
vim.keymap.set("n", "[q", qf_jump("cprevious"), { desc = "Prev quickfix" })

vim.keymap.set("n", "<leader>1", "1gt")
vim.keymap.set("n", "<leader>2", "2gt")
vim.keymap.set("n", "<leader>3", "3gt")
vim.keymap.set("n", "<leader>4", "4gt")
vim.keymap.set("n", "<leader>5", "5gt")
vim.keymap.set("n", "<leader>6", "6gt")
vim.keymap.set("n", "<leader>7", "7gt")
vim.keymap.set("n", "<leader>8", "8gt")
vim.keymap.set("n", "<leader>9", "9gt")

vim.api.nvim_create_autocmd({ 'TermRequest' }, {
  desc = 'Handles OSC 7 dir change requests',
  callback = function(ev)
    local val, n = string.gsub(ev.data.sequence, '\027]7;file://[^/]*', '')
    if n > 0 then
      -- OSC 7: dir-change
      local dir = val
      if vim.fn.isdirectory(dir) == 0 then
        vim.notify('invalid dir: ' .. dir)
        return
      end
      vim.b[ev.buf].osc7_dir = dir
      if vim.api.nvim_get_current_buf() == ev.buf then
        vim.cmd.lcd(dir)
      end
    end
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  once = true,
  callback = function()
    require("lazydev").setup({
      library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } },
    })
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local save = vim.fn.winsaveview()
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.winrestview(save)
  end,
})

_G._myconfig = _G._myconfig or {}

local function config_tabline()
  -- 'tabline'
  vim.cmd [[highlight TabLineSel guibg=bg guifg=fg ctermbg=white ctermfg=black]]
  _G._myconfig.tablabel = function(n)
    local buflist = vim.fn.tabpagebuflist(n)
    local winnr = vim.fn.tabpagewinnr(n)
    local tabdir = vim.fn.getcwd(-1, n)
    local has_tabdir = vim.fn.getcwd(-1, -1) ~= tabdir
    if has_tabdir then
      return ('CWD: %s/'):format(vim.fn.fnamemodify(tabdir, ':t'))
    end
    local bufname = vim.fn.bufname(buflist[winnr])
    local isdir = bufname:sub(#bufname) == '/'
    local name = vim.fn.fnamemodify(bufname, isdir and ':h:t' or ':t') .. (isdir and '/' or '')
    name = name:len() > 20 and name:sub(1, 20) .. '…' or name
    return name == '' and 'No Name' or ' ' .. name
  end
  _G._myconfig.tabline = function()
    local s = ''
    for i = 1, vim.fn.tabpagenr('$') do
      -- Highlight group.
      local hlgroup = (i == vim.fn.tabpagenr() and '%#TabLineSel#' or '%#TabLine#')
      -- %T: set the tabpage number (for mouse clicks).
      s = s .. ('%s%%%dT %%{v:lua._myconfig.tablabel(%d)} '):format(hlgroup, i, i)
    end
    -- After last tab: Fill with TabLineFill. Reset tabpage nr. Right-align the "close" (X) button.
    return s .. '%#TabLineFill#%T%=%#TabLine#%999XX'
  end

  vim.go.tabline = '%!v:lua._myconfig.tabline()'
end

config_tabline()
require("my.ctrl_s_shell")

vim.pack.add({
  "https://github.com/mfussenegger/nvim-dap",
  "https://github.com/rcarriga/nvim-dap-ui",
  "https://github.com/nvim-neotest/nvim-nio",
  "https://github.com/theHamsta/nvim-dap-virtual-text",
})

local dap = require("dap")
local dapui = require("dapui")

dapui.setup()
require("nvim-dap-virtual-text").setup()

-- Auto open/close the UI
dap.listeners.before.attach.dapui_config           = function() dapui.open() end
dap.listeners.before.launch.dapui_config           = function() dapui.open() end
dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
dap.listeners.before.event_exited.dapui_config     = function() dapui.close() end

-- configure codelldb adapter
dap.adapters.codelldb                              = {
  type = "server",
  port = "${port}",
  executable = {
    command = "codelldb",
    args = { "--port", "${port}" },
  },
}

dap.configurations.rust                            = {
  {
    name = "Launch",
    type = "codelldb",
    request = "launch",
    program = function()
      vim.fn.jobstart("cargo build", { wait = true })
      return vim.fn.input(
        "Path to executable: ",
        vim.fn.getcwd() .. "/target/debug/",
        "file"
      )
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
    sourceLanguages = { "rust" },
  },
}

dap.configurations.zig                             = {
  {
    name = "Launch",
    type = "codelldb",
    request = "launch",
    program = function()
      local out = vim.fn.system({ "zig", "build", "-Doptimize=Debug" })
      if vim.v.shell_error ~= 0 then
        error("zig build failed:\n" .. out)
      end
      return vim.fn.getcwd() .. "/zig-out/bin/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
  },
}

-- Keymaps (formerly the `keys` table)
local map                                          = vim.keymap.set
map("n", "<leader>db", function() require("dap").toggle_breakpoint() end, { desc = "Toggle breakpoint" })
map("n", "<leader>dc", function() require("dap").continue() end, { desc = "Continue" })
map("n", "<leader>di", function() require("dap").step_into() end, { desc = "Step into" })
map("n", "<leader>do", function() require("dap").step_over() end, { desc = "Step over" })
map("n", "<leader>dO", function() require("dap").step_out() end, { desc = "Step out" })
map("n", "<leader>dr", function() require("dap").repl.toggle() end, { desc = "Toggle REPL" })
map("n", "<leader>du", function() require("dapui").toggle() end, { desc = "Toggle DAP UI" })
map("n", "<leader>dt", function() require("dap").terminate() end, { desc = "Terminate" })
