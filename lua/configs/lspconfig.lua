-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local configs = require "nvchad.configs.lspconfig"

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities
local servers = { "html", "cssls", "ts_ls", "rust_analyzer" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    commands = {
      OrganizeImports = {
        organize_imports,
        description = "Organize Imports",
      },
    },
    settings = {
      gopls = {
        completeUnimported = true,
        usePlaceholders = true,
        analyses = {
          unusedparams = true,
        },
      },
    },
  }
  lspconfig.prismals.setup {}
  -- lspconfig.volar.setup {
  --   on_attach = on_attach,
  --   filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
  --   init_options = {
  --     vue = {
  --       hybridMode = false,
  --     },
  --   },
  -- }
end
