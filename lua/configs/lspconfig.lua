local configs = require("nvchad.configs.lspconfig")

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "clangd", "angularls", "eslint", "yamlls", "sqlls", "docker_compose_language_service"}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_init = on_init,
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Custom setup for Angular
lspconfig.angularls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  -- Add the custom paths for your monorepo structure
  on_new_config = function(new_config)
    new_config.cmd = {
      "ngserver", 
      "--stdio", 
      "--tsProbeLocations", 
      "/Users/artembrusnik/repos/monorepo-frontend/node_modules", 
      "--ngProbeLocations", 
      "/Users/artembrusnik/repos/monorepo-frontend/node_modules"
    }
  end,
}
