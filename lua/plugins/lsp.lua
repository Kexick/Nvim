return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({ ensure_installed = { "clangd", "cssls", "nixd" } })

    local lspconfig = require("lspconfig")
    local on_attach = function(_, bufnr)
      local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
      end
      map("n","gd", vim.lsp.buf.definition, "Goto definition")
      map("n","K", vim.lsp.buf.hover, "Hover")
      map("n","gr", vim.lsp.buf.references, "References")
      map("n","<leader>rn", vim.lsp.buf.rename, "Rename")
      map("n","<leader>ca", vim.lsp.buf.code_action, "Code actions")
      map("n","<leader>e", vim.diagnostic.open_float, "Line diagnostics")
      map("n","[d", vim.diagnostic.goto_prev, "Prev diagnostic")
      map("n","]d", vim.diagnostic.goto_next, "Next diagnostic")
    end

    lspconfig.clangd.setup({
      on_attach = on_attach,
      cmd = { "clangd", "--enable-config", "--completion-style=detailed" },
      init_options = { clangdFileStatus = true },
    })

    lspconfig.cssls.setup({ on_attach = on_attach })
    lspconfig.nixd.setup({ on_attach = on_attach })

    -- Add qmlls/hyprls here if needed; requires binaries available
  end
}
