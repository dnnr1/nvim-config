-- ================================
--         Mason Configuration
-- ================================

return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "b0o/schemastore.nvim",
  },
  cmd = "Mason",
  event = { "BufReadPre", "BufNewFile" },
  build = ":MasonUpdate",
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
      max_concurrent_installers = 10,
    })
    mason_lspconfig.setup({
      automatic_installation = true,
      automatic_enable = true,
      ensure_installed = {
        "bashls",
        "dockerls",
        "jsonls",
        "ts_ls",
        "html",
        "cssls",
        "tailwindcss",
        "lua_ls",
        "emmet_ls",
        "prismals",
        "clangd",
        "pyright",
        "rust_analyzer",
        "marksman",
      },
    })
    mason_tool_installer.setup({
      ensure_installed = {
        -- Formatters
        "prettierd",
        "stylua",
        "black", 
        "isort", 
        "shfmt",
        -- Linters
        "eslint_d",
        "markdownlint",
        "shellcheck",
        "flake8",
        -- Debug Adapters
        "js-debug-adapter",
        "debugpy", 
      },
    })

    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local capabilities = cmp_nvim_lsp.default_capabilities()
    
    capabilities.textDocument.completion.completionItem = {
      documentationFormat = { "markdown", "plaintext" },
      snippetSupport = true,
      preselectSupport = true,
      insertReplaceSupport = true,
      labelDetailsSupport = true,
      deprecatedSupport = true,
      commitCharactersSupport = true,
      tagSupport = { valueSet = { 1 } },
      resolveSupport = {
        properties = {
          "documentation",
          "detail",
          "additionalTextEdits",
        },
      },
    }
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = { 
            version = "LuaJIT",
            path = vim.split(package.path, ";"),
          },
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = { enable = false },
          hint = { enable = true },
        },
      },
    })

    -- TS/JS optimized settings  
    lspconfig.ts_ls.setup({
      capabilities = capabilities,
      settings = {
        typescript = {
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
        },
        javascript = {
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
        },
      },
    })

    lspconfig.emmet_ls.setup({
      capabilities = capabilities,
      filetypes = {
        "html",
        "typescriptreact", 
        "javascriptreact",
        "css",
        "sass",
        "scss",
        "less",
        "svelte",
        "vue",
      },
    })

    -- JSON Language Server with schema support
    local has_schemastore, schemastore = pcall(require, "schemastore")
    lspconfig.jsonls.setup({
      capabilities = capabilities,
      settings = {
        json = {
          schemas = has_schemastore and schemastore.json.schemas() or {},
          validate = { enable = true },
        },
      },
    })

    -- Configure remaining servers with default settings
    local servers = { "bashls", "dockerls", "html", "cssls", "tailwindcss", "prismals", "clangd", "pyright", "rust_analyzer", "marksman" }
    for _, server in ipairs(servers) do
      lspconfig[server].setup({
        capabilities = capabilities,
      })
    end
  end,
}
