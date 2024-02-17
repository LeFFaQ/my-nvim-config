local cmp = require("cmp")
local luasnip = require("luasnip")

return {
  snippet = {
    expand = function (args)
      luasnip.lsp_expand(args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    ["C-d"] = cmp.mapping.scroll_docs(-4),
    ["C-f"] = cmp.mapping.scroll_docs(-4),
    ["C-Space"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ["<Tab>"] = cmp.mapping(function (fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumbpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, {"i","s"})
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = "buffer"},
    { name = "luasnip" },
    { name = "path" }
  }
}
