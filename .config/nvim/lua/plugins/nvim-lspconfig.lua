return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      ruby_lsp = {
        cmd = { "bundle", "exec", "ruby-lsp" },
        init_options = {
          formatter = "auto",
        },
      },
      solargraph = {
        enabled = lsp == "solargraph",
      },
      rubocop = {
        -- If Solargraph and Rubocop are both enabled as an LSP,
        -- diagnostics will be duplicated because Solargraph
        -- already calls Rubocop if it is installed
        enabled = formatter == "rubocop" and lsp ~= "solargraph",
      },
      standardrb = {
        enabled = formatter == "standardrb",
      },

      tsserver = {},
      eslint = {},
    },
  },
}
