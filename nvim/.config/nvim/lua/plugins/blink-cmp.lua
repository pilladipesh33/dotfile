return {
  {
    "blink.cmp",
    dependencies = "rafamadriz/friendly-snippets",
    version = "*",
    opts = {
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },
      completion = {
        accept = { auto_brackets = { enabled = false } },
      },
      keymap = {
        preset = "default",
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
    },
    opts_extend = { "sources.default" },
  },
}
