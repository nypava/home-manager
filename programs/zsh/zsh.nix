{config, pkgs, lib, ...}: 
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.zsh-autosuggestions.src;
      }
      {
        name = "zsh-powerlevel10k";
        src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/";
        file = "powerlevel10k.zsh-theme";
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.zsh-syntax-highlighting.src;
      }
    ];
    shellAliases = {
      v = "nvim";
      y = "yazi";
      t = "tmux";
      ls = "ls --color=auto";
      config = "${pkgs.git}/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME";
    };
    history.size = 10000;
    initContent = ''
      export http_proxy=$(ip route get 1 | sed -n 's/.*via \([0-9.]\+\).*/\1/p'):44355
      export https_proxy=$http_proxy
      export HTTPS_PROXY=$http_proxy
      export HTTP_PROXY=$http_proxy
      export ftp_proxy=$http_proxy
      export rsync_proxy=$http_proxy
      set -o emacs
      source ~/.p10k.zsh
    '';
  };

  home.file = {
    ".p10k.zsh".source = ./.p10k.zsh;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
