return {
  "mfussenegger/nvim-dap",
  keys = {
    { "<F5>",       function() require("dap").continue() end,          desc = "DAP continue" },
    { "<F10>",      function() require("dap").step_over() end,         desc = "DAP step over" },
    { "<F11>",      function() require("dap").step_into() end,         desc = "DAP step into" },
    { "<F12>",      function() require("dap").step_out() end,          desc = "DAP step out" },
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "DAP breakpoint" },
  },
  config = function()
    local dap = require("dap")

    dap.adapters.gdb = {
      type = "executable",
      command = "gdb",
      args = { "--interpreter=dap" },
    }

    dap.configurations.cpp = {
      {
        name = "Launch",
        type = "gdb",
        request = "launch",
        program = function()
          return vim.fn.input("Executable: ", vim.fn.getcwd() .. "/build/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      },
    }
    dap.configurations.c = dap.configurations.cpp
  end,
}
