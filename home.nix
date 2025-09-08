{config, pkgs, ...}: 
{
  home.username = "marble";
  home.homeDirectory = "/home/marble";

  imports = [
    ./programs/programs.nix
    ./scripts/scripts.nix
  ];

  home.packages = with pkgs; [
    # Windows manager utils
    bemenu
    dmenu

    # Utils 
    rofi
    grim
    slurp
    fsearch
    wl-clipboard
    flameshot
    swappy
    btop
    toilet

    # Terminal/utils
    alacritty
    kitty
    nix-output-monitor
    fastfetch
    zoxide
    zip 
    unzip
    wget
    gnumake
    tree

    # Editors 
    neovim 
    vim 
  
    # File managers
    lf
    yazi
    nautilus

    # Development tools
    zsh-autosuggestions
    zsh-powerlevel10k
    zsh-syntax-highlighting
    tmux
    git
    python3Packages.pip
    uv
    python3
    gcc
    rustup
    nodejs
    lua
    git-credential-manager

    # Previewers / media players
    imv
    swaybg
    zathura
    feh 
    mpv
    vlc

    # Misc
    kanata
    telegram-desktop
  ];

  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };
  
  programs.home-manager = {
    enable = true;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
  
  home.stateVersion = "25.05";
}
