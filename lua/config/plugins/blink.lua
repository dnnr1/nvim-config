-- ================================
--         Blink.cmp Plugin
-- ================================

return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '1.*',
  opts = {
	keymap = {
		preset = 'none',
		['<C-Space>'] = { 'show', 'show_documentation', 'hide_documentation' },
		['<C-e>'] = { 'cancel', 'fallback' },
		['<Tab>'] = {
			'snippet_forward',
			'accept',
			'fallback',
		},
		['<S-Tab>'] = { 'snippet_backward', 'fallback' },
		['<C-y>'] = { 'select_and_accept', 'fallback' },
		['<C-k>'] = { 'select_prev', 'fallback' },
		['<Up>'] = { 'select_prev', 'fallback' },
		['<C-j>'] = { 'select_next', 'fallback' },
		['<Down>'] = { 'select_next', 'fallback' },
		['<Enter>'] = { 'accept', 'fallback' },
	},
    appearance = {
      nerd_font_variant = 'mono'
    },
    completion = { 
		trigger = { show_on_insert_on_trigger_character = false },
		documentation = { auto_show = true, auto_show_delay_ms = 200 },
		menu = { border = 'rounded', auto_show = false },
	},
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
  },
  opts_extend = { "sources.default" }
}