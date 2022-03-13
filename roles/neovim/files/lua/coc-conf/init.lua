local CocConf = {}

function CocConf.setup()
  -- Disabling ale lsp so coc can do it
  vim.g.ale_disable_lsp = 1

  -- Setup extensions for coc
  vim.g.coc_global_extensions = {
    'coc-json',
    'coc-tsserver',
    'coc-eslint',
    '@yaegassy/coc-ansible',
    'coc-go'
  }
end

return CocConf

