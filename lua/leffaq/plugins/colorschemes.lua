return {
  "rebelot/kanagawa.nvim",
  priority = 1000,
  config = function()
    require("kanagawa").setup({
      
    })

    require("kanagawa").load("dragon")
  end
}
