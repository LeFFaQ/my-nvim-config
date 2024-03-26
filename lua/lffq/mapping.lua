local M = {}

local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local term_opts = {silent = true}

vim.g.mapleader = ' '

M.lspconfig = {
  {"<leader>rn", vim.lsp.buf.rename, "[R]e[N]ame"},
  {"<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction"},

  {"gd", vim.lsp.buf.definition, "[G]oto [D]efinition"},
  {"gr", function ()
    require("telescope.builtin").lsp_references()
  end, "[G]oto [R]eference"},
  {"gi", vim.lsp.buf.implementation, "[G]oto [I]mplementaion"},
  {"<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition"},
  {"<leader>ds", function ()
    require("telescope.builtin").lsp_document_symbols()
  end,"[D]ocument [S]ymbols"},
  {"<leader>ws", function ()
    require("telescope.builtin").lsp_dynamic_workspace_symbols()
  end, "[W]orkspace [S]ymbols"},

  {"K", vim.lsp.buf.hover, "Hover Documentation"},
  {"<C-k>", vim.lsp.buf.signature_help, "Signature Document"},

  {"gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration"},
  {"<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder"},
  {"<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder"},
  {"<leader>wl", function ()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, "[W]orkspaces [L]ist"},
  {"<leader>ff", function() 
      require("telescope.builtin").find_files()
   end, "[F]ind [f]iles"},
   {"<leader>fb", function() 
      require("telescope.builtin").buffers()
   end, "[F]ind [b]uffers"},
   
}

-- terminal mapping
map({'n', 't'}, "<A-i>", function ()
  require("nvterm.terminal").toggle "float"
end, opts)

map({'n', 't'}, "<A-h>", function ()
  require("nvterm.terminal").toggle "horizontal"
end, opts)

map({'n', 't'}, "<A-v>", function ()
  require("nvterm.terminal").toggle "vertical"
end, opts)

map('n', "<leader>v", function ()
  require("nvterm.terminal").new "vertical"
end, opts)
map('n', "<leader>h", function ()
  require("nvterm.terminal").new "horizontal"
end, opts)

map('n', "<leader>i", function ()
  require("nvterm.terminal").new "float"
end, opts)

map('t', "<C-x>",
  vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true)
, opts)


-- Moving in INSERT mode
map('i', "<C-h>", "<left>", { noremap = true })
map('i', "<C-j>", "<down>", { noremap = true })
map('i', "<C-k>", "<up>", { noremap = true })
map('i', "<C-l>", "<right>", { noremap = true })

-- Moving between windows
map('n', "<C-h>", "<C-w>h", { noremap = true })
map('n', "<C-j>", "<C-w>j", { noremap = true })
map('n', "<C-k>", "<C-w>k", { noremap = true })
map('n', "<C-l>", "<C-w>l", { noremap = true })

-- Resize windows
map('n', '<C-left>', ":vertical resize -2<CR>", {silent = true})
map('n', '<C-down>', ":resize +2<CR>", {silent = true})
map('n', '<C-up>', ":resize -2<CR>", {silent = true})
map('n', '<C-right>', ":resize +2<CR>", {silent = true})

-- Fast normal mode
map('i', 'jk', '<ESC>', opts)
-- Save file
map('n', '<C-s>', ":w<CR>")

return M

