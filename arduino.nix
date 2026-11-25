{ config, pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        arduino-cli
        arduino-ide
        python3
    ];

    users.users."rafhael".extraGroups = [ "dialout" ];
}
