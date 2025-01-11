{
  description = "Neovim config for daily use";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = inputs: {
    packages.x86_64-linux.default =
      (inputs.nvf.lib.neovimConfiguration {
        inherit (inputs.nixpkgs.legacyPackages."x86_64-linux") pkgs;
        modules = [
          {
            config.vim = {
              vimAlias = true;
              useSystemClipboard = true;

              theme = {
                enable = true;
                transparent = true;
              };

              spellcheck = {
                enable = true;
              };

              lsp = {
                formatOnSave = true;
                lspkind.enable = false;
                lightbulb.enable = true;
                lspsaga.enable = false;
                trouble.enable = true;
                lspSignature.enable = true;
              };

              languages = {
                enableLSP = true;
                enableFormat = true;
                enableTreesitter = true;
                enableExtraDiagnostics = true;

                # Languages that will be supported in default and maximal configurations.
                nix.enable = true;
                markdown.enable = true;
                bash.enable = true;
                python.enable = true;
              };

              visuals = {
                nvim-web-devicons.enable = true;
                nvim-cursorline.enable = true;
                cinnamon-nvim.enable = true;
                fidget-nvim.enable = true;

                highlight-undo.enable = true;
                indent-blankline.enable = true;
              };

              filetree = {
                neo-tree = {
                  enable = true;
                };
              };

              tabline = {
                nvimBufferline.enable = true;
              };

              treesitter.context.enable = true;

              binds = {
                whichKey.enable = true;
                cheatsheet.enable = true;
              };

              telescope.enable = true;

              git = {
                enable = true;
                gitsigns.enable = true;
                gitsigns.codeActions.enable = false; # throws an annoying debug message
              };

              comments = {
                comment-nvim.enable = true;
              };
            };
          }
        ];
      })
      .neovim;
  };
}
