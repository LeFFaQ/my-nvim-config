local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath
  })
end

vim.opt.rtp:prepend(lazypath)


local plugins = require("lffq.plugins")
-- if opts is needed
local opts = {
  defaults = { lazy = true },
  install = {
    missing = true,
    colorscheme = { "tairiki" }
  }
}
require("lazy").setup(plugins, opts)
