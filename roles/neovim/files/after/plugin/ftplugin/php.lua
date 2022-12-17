vim.g.php_cs_fixer_php_path = "php"
vim.cmd[[autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()]]
