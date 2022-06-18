local dap = require('dap')
local dapui = require('dapui')


-- Python Config
dap.adapters.python = {
  type = 'executable';
  command = '/home/agus/.virtualenvs/debugpy/bin/python';
  args = { '-m', 'debugpy.adapter' };
}


dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      local conda_path = os.getenv("CONDA_PREFIX") 
      if (conda_path ~= nil and vim.fn.executable(conda_path .. '/bin/python') == 1) then
        return conda_path .. '/bin/python'
      else
        return '/usr/bin/python3'
      end
    end;
  },
}


-- UI Config
vim.fn.sign_define('DapBreakpoint', {text='🟥', texthl='', linehl='', numhl=''})

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

dapui.setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- Expand lines larger than the window
  -- Requires >= 0.7
  expand_lines = vim.fn.has("nvim-0.7"),
  layouts = {
    { 
        elements = {
            { id = "breakpoints", size = 0.3 },
            { id = "scopes", size = 0.7 },
        },
        size = 40, 
        position = 'right',
    },
    {
        elements = {
            'repl',
        },
        size = 10,
        position = 'bottom',
      },
    },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = { 
    max_type_length = nil, -- Can be integer or nil.
  }
})
