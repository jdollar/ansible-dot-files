-- enables use of .editorconfig files
return {
  'editorconfig/editorconfig-vim',
  config = function()
    vim.g.EditorConfig_exclude_patterns = { 'fugitive://.*' }
  end
}
