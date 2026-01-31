{ pkgs, config, lib, ... }: {

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    shellAliases = {
	SSHD = "$(which sshd) -f $HOME/.config/sshd/sshd_config"; # run sshd
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "web-search" "git" ];
    };

    # my theme for zsh + oh-my-zsh
    initExtra = ''
      source $HOME/nix/modules/shell/my.zsh-theme;
    '';

    profileExtra = ''
      unsetopt beep
    '';
    
  };

  home.file."/nix/modules/shell/my.zsh-theme".text = ''
    PROMPT=$'
    %{$fg[green]%}%/%{$reset_color%} $(git_prompt_info)$(bzr_prompt_info)%{$fg[white]%}[%n@%m]%{$reset_color%} %{$fg[white]%}[%T]%{$reset_color%}
    %{$fg[white]%}>%{$reset_color%} '

    PROMPT2="%{$fg_bold[white]%}%_> %{$reset_color%}"

    GIT_CB="git::"
    ZSH_THEME_SCM_PROMPT_PREFIX="%{$fg[green]%}["
    ZSH_THEME_GIT_PROMPT_PREFIX=$ZSH_THEME_SCM_PROMPT_PREFIX$GIT_CB
    ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%} "
    ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[green]%}"
    ZSH_THEME_GIT_PROMPT_CLEAN=""
  '';

}
