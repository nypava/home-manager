{ config, pkgs, inputs, ... }: 
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
    lxappearance
    nwg-look
    pavucontrol
    dragon-drop
    jq
    revanced-cli

    # Terminal/utils
    alacritty
    kitty
    tmux
    nix-output-monitor
    fastfetch
    zoxide
    zip 
    unzip
    wget
    gnumake
    tree
    ripgrep

    # Editors  
    zed-editor
    neovim 
    vim 
    # libsForQt5.kdenlive
    kdePackages.kdenlive 

    # File managers
    lf
    yazi
    nautilus
  
    # Development tools
    zsh-autosuggestions
    zsh-powerlevel10k
    zsh-syntax-highlighting
    git
    python3Packages.pip
    uv
    git-credential-manager
    yarn
    clang-tools
    nix-direnv
    gnupg
    gemini-cli
    lua51Packages.luarocks-nix
    web-ext
    nodePackages.live-server

    # compilers, languages
    zig
    gcc
    python3
    nodejs
    lua
    rustup
    

    # Previewers / media players
    imv
    swaybg
    zathura
    feh 
    mpv
    vlc
    libreoffice-qt

    # Misc
    kanata
    typst
    telegram-desktop
    ffmpeg
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
  
  home.stateVersion = "25.11";
}
