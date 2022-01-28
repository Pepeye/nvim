local status_ok, dap = pcall(require, "dap")
if not status_ok then
  return
end

dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {
    vim.fn.stdpath("data") .. "/dapinstall/jsnode_dbg/" ..
      '/vscode-node-debug2/out/src/nodeDebug.js'
  }
}

dap.configurations.javascript = {
  {
    type = 'node2',
    request = 'launch',
    program = '${workspaceFolder}/${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal'
  }
}