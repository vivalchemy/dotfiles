return {
  -- NOTE: First, some plugins that don't require any configuration

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  -- "gc" to comment visual regions/lines
  {'numToStr/Comment.nvim',opts={}},

  -- helps in improving vim motions 
  'ThePrimeagen/vim-be-good',
}
