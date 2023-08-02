require "paq" { 
    "savq/paq-nvim"; 
    "OmniSharp/omnisharp-vim"; 
    "nvim-tree/nvim-tree.lua";
    "nvim-tree/nvim-web-devicons";
    "dense-analysis/ale"; 
    "BurntSushi/ripgrep";  
    "nvim-lua/plenary.nvim"; 
    {"nvim-telescope/telescope.nvim", branch="0.1.x"}; 
    "prabirshrestha/asyncomplete.vim"; 
    "mhinz/vim-signify"; 
    {"neoclide/coc.nvim",·branch="release", run="yarn build"}; 
    'junegunn/fzf'; 
    'akinsho/toggleterm.nvim';
    'ojroques/nvim-osc52';
    --    { 'fatih/vim-go', run = ":GoUpdateBinaries" }; 
}

require("core")
