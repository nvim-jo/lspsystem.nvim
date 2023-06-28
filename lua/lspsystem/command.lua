local command = {}

local subcommands = {
  lsp_finder = function()
    require('lspsystem.finder'):lsp_finder()
  end,
  peek_definition = function()
    require('lspsystem.definition'):peek_definition(1)
  end,
  goto_definition = function()
    require('lspsystem.definition'):goto_definition(1)
  end,
  peek_type_definition = function()
    require('lspsystem.definition'):peek_definition(2)
  end,
  goto_type_definition = function()
    require('lspsystem.definition'):goto_definition(2)
  end,
  rename = function(arg)
    require('lspsystem.rename'):lsp_rename(arg)
  end,
  hover_doc = function(arg)
    require('lspsystem.hover'):render_hover_doc(arg)
  end,
  show_workspace_diagnostics = function(arg)
    require('lspsystem.showdiag'):show_diagnostics({ workspace = true, arg = arg })
  end,
  show_line_diagnostics = function(arg)
    require('lspsystem.showdiag'):show_diagnostics({ line = true, arg = arg })
  end,
  show_buf_diagnostics = function(arg)
    require('lspsystem.showdiag'):show_diagnostics({ buffer = true, arg = arg })
  end,
  show_cursor_diagnostics = function(arg)
    require('lspsystem.showdiag'):show_diagnostics({ cursor = true, arg = arg })
  end,
  diagnostic_jump_next = function()
    require('lspsystem.diagnostic'):goto_next()
  end,
  diagnostic_jump_prev = function()
    require('lspsystem.diagnostic'):goto_prev()
  end,
  code_action = function()
    require('lspsystem.codeaction'):code_action()
  end,
  outline = function()
    require('lspsystem.outline'):outline()
  end,
  incoming_calls = function()
    require('lspsystem.callhierarchy'):send_method(2)
  end,
  outgoing_calls = function()
    require('lspsystem.callhierarchy'):send_method(3)
  end,
  term_toggle = function(cmd)
    require('lspsystem.floaterm'):open_float_terminal(cmd)
  end,
}

function command.command_list()
  return vim.tbl_keys(subcommands)
end

function command.load_command(cmd, arg)
  subcommands[cmd](arg)
end

return command