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
      # {
      #   name = "zsh-powerlevel10k";
      #   src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/";
      #   file = "powerlevel10k.zsh-theme";
      # }
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
      # source ~/.p10k.zsh
      setopt PROMPT_SUBST
      
      git_branch() {
        git rev-parse --git-dir &>/dev/null || return
        local branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
        local dirty=""
        [[ -n $(git status --porcelain 2>/dev/null) ]] && dirty="*"
        printf '(%s%s)' "$branch" "$dirty"
      }
      
      # Show ~ when in home, full path otherwise
      path_prompt() {
        [[ $PWD == $HOME ]] && echo "" || echo "$PWD"
      }
      
      PROMPT='$(path_prompt)$(git_branch) > '
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
