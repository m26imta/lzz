return false
  and {
    "dccsillag/magma-nvim",
    enabled = false,
    build = ":UpdateRemotePlugins",
    init = function()
      function MagmaInitPython()
        vim.cmd([[
      :MagmaInit python3
      :MagmaEvaluateArgument a=5
      ]])
      end

      function MagmaInitCSharp()
        vim.cmd([[
      :MagmaInit .net-csharp
      :MagmaEvaluateArgument Microsoft.DotNet.Interactive.Formatting.Formatter.SetPreferredMimeTypesFor(typeof(System.Object),"text/plain");
      ]])
      end

      function MagmaInitFSharp()
        vim.cmd([[
      :MagmaInit .net-fsharp
      :MagmaEvaluateArgument Microsoft.DotNet.Interactive.Formatting.Formatter.SetPreferredMimeTypesFor(typeof<System.Object>,"text/plain")
      ]])
      end

      vim.g.magma_automatically_open_output = false
      vim.g.magma_image_provider = "none"
      vim.g.python3_host_prog = "python3"

      vim.cmd([[
      nnoremap <silent><expr> <LocalLeader>r  :MagmaEvaluateOperator<CR>
      nnoremap <silent>       <LocalLeader>rr :MagmaEvaluateLine<CR>
      xnoremap <silent>       <LocalLeader>r  :<C-u>MagmaEvaluateVisual<CR>
      nnoremap <silent>       <LocalLeader>rc :MagmaReevaluateCell<CR>
      nnoremap <silent>       <LocalLeader>rd :MagmaDelete<CR>
      nnoremap <silent>       <LocalLeader>ro :MagmaShowOutput<CR>

      :command MagmaInitPython lua MagmaInitPython()
      :command MagmaInitCSharp lua MagmaInitCSharp()
      :command MagmaInitFSharp lua MagmaInitFSharp()
    ]])
    end,
  } or {}
