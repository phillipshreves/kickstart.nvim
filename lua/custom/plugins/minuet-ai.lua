return {
  {
    'milanglacier/minuet-ai.nvim',
    config = function()
      require('minuet').setup {
        virtualtext = {
          auto_trigger_ft = { '*' },
          keymap = {
            -- accept whole completion
            accept = '<C-a>',
            -- accept one line
            accept_line = '<C-A>',
            -- accept n lines (prompts for number)
            -- e.g. "A-z 2 CR" will accept 2 lines
            accept_n_lines = '<C-z>',
            -- Cycle to prev completion item, or manually invoke completion
            prev = '<A-[>',
            -- Cycle to next completion item, or manually invoke completion
            next = '<A-]>',
            dismiss = '<A-e>',
          },
          show_on_completion_menu = true,
        },
        provider = 'openai_fim_compatible',
        n_completions = 1,
        context_window = 512,
        provider_options = {
          openai_fim_compatible = {
            api_key = 'TERM',
            name = 'ollama',
            end_point = 'http://localhost:11434/v1/completions',
            model = 'qwen2.5-coder',
            optional = {
              max_tokens = 256,
              top_p = 0.9,
            },
            template = {
              prompt = function(context_before_cursor, context_after_cursor, _)
                return 'Respond with only code to insert. Do not use code blocks. <|fim_prefix|>'
                  .. context_before_cursor
                  .. '<|fim_suffix|>'
                  .. context_after_cursor
                  .. '<|fim_middle|>'
              end,
              suffix = false,
            },
            system = {},
          },
        },
        after_cursor_filter_length = 20,
        before_cursor_filter_length = 20,
      }
    end,
  },
  { 'nvim-lua/plenary.nvim' },
  -- optional, if you are using virtual-text frontend, nvim-cmp is not
  -- required.
  -- { 'hrsh7th/nvim-cmp' },
  -- optional, if you are using virtual-text frontend, blink is not required.
  -- { 'Saghen/blink.cmp' },
}
