local status, lspconfig = pcall(require, 'lspconfig')
local masonStatus, Mason = pcall(require, 'mason')
local masonLspStatus, masonLsp = pcall(require, 'mason-lspconfig')
local cmpLspStatus, cmpLsp = pcall(require, 'cmp_nvim_lsp')

if (not status) then
  print('lspconfig is not installed')
  return
end

if not (masonStatus) then
  print('mason is not installed')
  return
end

if not (masonLspStatus) then
  print('mason-lspconfig is not installed')
  return
end

if not (cmpLspStatus) then
  print('cmp_nvim_lsp is not installed')
  return
end

local opts = { noremap=true, silent=true }

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    -- Create your keybindings here...
    vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  end
})

Mason.setup()
masonLsp.setup({
  ensure_installed = {
    -- Replace these with whatever servers you want to install
    'html',
    'lua_ls',
    'yamlls',
    'dockerls',
    'cssls',
    'cssmodules_ls',
    'docker_compose_language_service',
    'eslint',
    'marksman',
    'powershell_es',
    'pyright',
    'bashls',
  }
})

--local lspconfig = require('lspconfig')
local lsp_capabilities = cmpLsp.default_capabilities()

masonLsp.setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      capabilities = lsp_capabilities,
    })
  end,
})

