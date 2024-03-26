local config = require("lspconfig")
local builtin = require("telescope.builtin")

local mappings = require("lffq.mapping").lspconfig

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local on_attach = function (_, bufnr)
  local map = function (keys, func, desc)
    if desc then
      desc = "LSP: " .. desc
    end
    vim.keymap.set("n", keys, func, {buffer = bufnr, desc = desc})
  end

  for _, value in pairs(mappings) do
    map(value[1], value[2], value[3])
  end

  vim.api.nvim_buf_create_user_command(bufnr, "Format", function ()
    vim.lsp.buf.format()
  end, { desc = "Format current buffer with LSP" })
end


local servers = {
  clangd = {},
  csharp_ls = {},
  gopls = {},
  html = {}, 
  dartls = {},
}

local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({
  ensure_installed = vim.tbl_keys(servers)
})

servers["tsserver"] = {
    cmd = {"typescript-language-server", "--stdio"}
}

mason_lspconfig.setup_handlers({
  function (server)
    require("lspconfig")[server].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server]
    })
  end
})
