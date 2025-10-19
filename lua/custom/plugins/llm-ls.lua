return {
  'huggingface/llm.nvim',
  enabled = false,
  event = 'VeryLazy',
  keys = {
    {
      '<c-j>',
      function()
        require('llm.completion').complete()
      end,
      mode = 'i',
      desc = 'complete',
    },
  },
  opts = {
    lsp = {
      bin_path = '/Users/phil/.local/share/nvim/mason/bin/llm-ls',
      cmd_env = { LLM_LOG_LEVEL = 'DEBUG' },

      on_init = function(client)
        client.offset_encoding = 'utf-16'
      end,
    },

    backend = 'ollama',
    model = 'qwen2.5-coder:1.5b',
    url = 'http://localhost:11434',

    fim = {
      enabled = true,
      prefix = '<|fim_prefix|>',
      suffix = '<|fim_suffix|>',
      middle = '<|fim_middle|>',
    },

    request_body = {
      options = {
        temperature = 0.2,
        top_p = 0.95,
      },
    },

    capabilities = vim.tbl_deep_extend('force', capabilities, {
      offsetEncoding = { 'utf-16' },
    }),
  },
}
