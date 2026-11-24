{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    config = {
			user.name = "Rafhael Augusto";
			user.email = "RafhaelAugusto@proton.me";
			init.defaultBranch = "main";
		};
	};
}
