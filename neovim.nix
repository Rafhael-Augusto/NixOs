{ config, pkgs, ... }:

{
	programs.neovim = {
		enable = true;
		defaultEditor = true;
		viAlias = true;
		vimAlias = true;

		configure = {
			customRC = ''
				set tabstop=2
				set shiftwidth=2
				set softtabstop=2
				set expandtab
				set autoindent
				set ignorecase
				set smartcase
        set clipboard=unnamedplus
			'';
		};
	};
}
