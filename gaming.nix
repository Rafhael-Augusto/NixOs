{ pkgs, ... }:
{
	nixpkgs.config.allowUnfree = true; 
	
	programs.steam = {
		enable = true;
		extraCompatPackages = [ pkgs.proton-ge-bin ];
	};

	environment.systemPackages = [
		pkgs.prismlauncher
	];
}
