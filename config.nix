{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "dev-tools",
      paths = [
        neovim
        go
        fd
        ripgrep
        fzf
        lazygit
        kubectl
        k9s
      ];
    };
  };
};
