local api = vim.api

-- Ensure file format is set to Unix before saving any file
vim.cmd([[
  autocmd BufWritePre * set ff=unix
]])
