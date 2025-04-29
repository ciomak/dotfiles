return {
  "olimorris/codecompanion.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
  opts = {
    strategies = {
      chat = { adapter = "ollama" },
      inline = { adapter = "ollama" },
    },
    adapters = {
      ollama = function()
        return require("codecompanion.adapters").extend("ollama", {
          env = {
            url = "http://ollama.infra-01-local.homelab",
            api_key = "NONE",
          },
          headers = {
            ["Content-Type"] = "application/json",
            ["Authorization"] = "Bearer $(api_key)",
          },
          parameters = {
            sync = true,
          },
          schema = {
            model = {
              default = "qwen3:8b",
            },
          },
        })
      end,
      gemini = function()
        return require("codecompanion.adapters").extend("gemini", {
          env = {
            api_key = "cmd: cat ~/.config/nvim/lua/config/gemini-api",
          },
          schema = {
            model = {
              default = "gemini-2.0-flash",
            },
          },
        })
      end,
    },
  },
}
