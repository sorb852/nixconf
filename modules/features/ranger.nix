{
  flake.homeModules.ranger =
    { pkgs, ... }:
    {
      programs.ranger = {
        enable = true;
        extraConfig = ''
          # hopefully fixes the tmux thing
          set env TERM=xterm-kitty

          set preview_images true
          set preview_images_method kitty
          set preview_files true
          set use_preview_script true
        '';
        # TODO: To config
        extraPackages = with pkgs; [
          file
          sudo
          python313Packages.chardet
          python313Packages.python-bidi
          python313Packages.pillow

          libcaca
          imagemagick
          librsvg
          ffmpegthumbnailer
          highlight
          unrar
          _7zz
          exiftool
          jq
        ];
      };
    };
}
