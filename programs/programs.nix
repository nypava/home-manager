{config, lib, pkgs, ...}: 
  let 
  fileDir = "/home/marble/.config/home-manager/programs";
  toSymlink = filepath: config.lib.file.mkOutOfStoreSymlink "${fileDir}${toString filepath}";
  in {
  home.file = {
    ".config/i3".source = toSymlink /i3;
    ".config/hypr".source = toSymlink /hypr;
    ".config/sway".source = toSymlink /sway;
    ".config/waybar".source = toSymlink /waybar;
    ".config/i3status".source = toSymlink /i3status;
    ".config/nvim".source = toSymlink /nvim;
    ".config/helix".source = toSymlink /helix;
    ".config/kitty".source = toSymlink /kitty;
    ".config/fsearch".source = toSymlink /fsearch;
    ".config/lf".source = toSymlink /lf;
    ".config/qutebrowser".source = toSymlink /qutebrowser;
    ".config/dunst".source = toSymlink /dunst;
    ".config/rofi".source = toSymlink /rofi;
    ".config/kanata".source = toSymlink /kanata;
    ".config/zathura".source = toSymlink /zathura;
    ".config/btop".source = toSymlink /btop;
  };

  imports = [
    ./zsh/zsh.nix
  ];

  programs.git = {
    enable = true;
    userName = "nypava";
    userEmail = "ny.dev0.em@gmail.com";
  };

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-pipewire-audio-capture
    ];
  };

  programs = {
    direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };
    bash.enable = true;
  };
}
