{ config, pkgs, ... }:

{
	programs.neovim = {
		enable = true;
		defaultEditor = true;
		viAlias = true;
		vimAlias = true;

		configure = {
            packages.myPlugins = with pkgs.vimPlugins; {
                start = [
                    telescope-nvim
                ];
            };

			customRC = ''
				set tabstop=4
				set shiftwidth=4
				set softtabstop=4
				set expandtab
				set autoindent
				set ignorecase
				set smartcase
                set clipboard=unnamedplus
                set number
                set relativenumber
                set cursorline
			'';
		};
	};
}
