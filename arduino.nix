{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        arduino-cli
        arduino-ide
    ];

    users.users."rafhael".extraGroups = [ "dialout" ];
}
