-- swagger previewer
return {
  "vinnymeller/swagger-preview.nvim",
  build = "npm install -g swagger-ui-watcher",
  config = function()
    require("swagger-preview").setup({
      port = 55999,
      host = "localhost",
    })
  end
}
