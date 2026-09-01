return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        python = { "black" },
      },
      format_on_save = {
        lsp_format = "fallback",
      },
    })
    vim.keymap.set("n", "<leader>fm", function()
      require("conform").format({ lsp_format = "fallback" })
    end, { desc = "Format file" })
  end,
}
