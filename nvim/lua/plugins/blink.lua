return {
  "saghen/blink.cmp",
  opts = {
    cmdline = {
      enabled = true,
      keymap = { preset = "cmdline" },
      sources = function()
        local type = vim.fn.getcmdtype()

        if type == "/" or type == "?" then
          return { "buffer" }
        end
        if type == ":" or type == "@" then
          return { "cmdline" }
        end
        return {}
      end,
      completion = {
        menu = { auto_show = true },
        ghost_text = { enabled = true },
      },
    },
    sources = {
      per_filetype = { sql = "dadbod" },
      providers = {
        dadbod = { module = "vim_dadbod_completion.blink" },
      },
    },
  },
}
