{ config, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [vim-full];

	environment.etc."vimrc".text = ''
		set tabstop=2
		set shiftwidth=2
		set softtabstop=2
		set expandtab
		set autoindent
		'';
}
