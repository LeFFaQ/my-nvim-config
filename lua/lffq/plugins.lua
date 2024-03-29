return {
  "nvim-lua/plenary.nvim",


  -- lsp + treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = function ()
      return require("lffq.configs.treesitter")
    end,
    config = function (_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end
  },

  {
    "williamboman/mason.nvim",
    cmd = {"Mason", "MasonInstall", "MasonUpdate"},
    config = function (_, opts)
      require("mason").setup()
    end
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    event = {"BufReadPost", "BufNewFile", "UIEnter"},
    config = function ()
      require("lffq.configs.lspconfig")
    end
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
        version = "v2.2.0",
        build = "make install_jsregexp"
      },
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path"
    },
    opts = function ()
      return require("lffq.configs.cmp")
    end,
    config = function (_, opts)
      require("cmp").setup(opts)
    end
  },

  -- tooling / utility
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-lua/plenary.nvim"
    },
    cmd = "Telescope",
    keys = {
      {"<leader>ff", function ()
        require("telescope.builtin").find_files()
      end, desc = "[F]ind [F]iles"},
      {"<leader>fb", function ()
          require("telescope.builtin").buffers()
      end, desc = "[F]ind [B]uffers"},
    {"<leader>ds", function ()
    require("telescope.builtin").lsp_document_symbols()
          end,"[D]ocument [S]ymbols"},
          {"<leader>ws", function ()
            require("telescope.builtin").lsp_dynamic_workspace_symbols()
      end, "[W]orkspace [S]ymbols"},

  },
    --  {"<leader>ds", function ()
    --    require("telescope.builtin").lsp_document_symbols()
    --  end},
    --  {"<leader>ws", function ()
    --    require("telescope.builtin").lsp_dynamic_workspace_symbols()
    --end}, }, opts = function ()
    --  eturn require("lffq.configs.telescope") 
    --end,
    config = function (_, opts)
      require("telescope").setup()
    end
  },
  {
    "NvChad/nvterm",
    config = function ()
      require("nvterm").setup {
          behavior = {
              auto_insert = false
          }
      }
    end
  },
  {
    "nvim-tree/nvim-web-devicons",
    config = function ()
      require("nvim-web-devicons").setup()
    end
  },
  {
      'nvim-lualine/lualine.nvim',
      lazy = false,
      dependencies = {'nvim-web-devicons'},
      config = function ()

          local wpm = require("wpm") 

          require("lualine").setup {
              sections = {
                  lualine_a = { 'mode' },
                  lualine_c = {'filename'},
                  lualine_x = { wpm.wpm },
                  lualine_y = {'encoding', 'fileformat', 'filetype'},
                  lualine_z = {'progress'},
              }
          }
    end
  },
  {
    "NvChad/nvim-colorizer.lua",
    event = "UIEnter",
    config = function ()
      require("colorizer").setup()

      vim.defer_fn(function ()
        require("colorizer").attach_to_buffer(0)
      end, 0)
    end,
  },
  {
    "jcdickinson/wpm.nvim",
    config = function()
        require("wpm").setup({
        })
    end
    },
  -- themes 
  {
    "deparr/tairiki.nvim",
    lazy = false,
    priority = 1000,
    config = function ()
      require("tairiki").setup {
          transparent = false
      }
      require("tairiki").load()
    end
  }
}
