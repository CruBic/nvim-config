-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "ts_ls", "sqlls", "yamlls", 'eslint' }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- Special configuration for Angular Language Server
lspconfig.angularls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  root_dir = lspconfig.util.root_pattern("angular.json", "project.json"),
  on_new_config = function(new_config)
    -- Path to Mason's angular-language-server installation
    local mason_path = vim.fn.expand("~/.local/share/nvim/mason/packages/angular-language-server")
    -- Monorepo paths
    local monorepo_root = vim.fn.expand("$MONOREPO_PATH")

    -- Tell the server to look in multiple potential locations
    new_config.cmd = {
      "ngserver",
      "--stdio",
      "--tsProbeLocations",
      -- Look in Mason's installation
      mason_path .. "/node_modules",
      -- Look in monorepo root
      monorepo_root .. "/node_modules",
      -- Look in potential nested locations
      monorepo_root .. "/src/node_modules",
      monorepo_root .. "/packages/*/node_modules",
      "--ngProbeLocations",
      -- Same pattern for Angular packages
      mason_path .. "/node_modules",
      monorepo_root .. "/node_modules",
      monorepo_root .. "/src/node_modules",
      monorepo_root .. "/packages/*/node_modules"
    }
  end,
}
