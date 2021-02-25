{ theme }:

{
  filetypes = {
    core = {
      regular_file = [ "$fi" ];
      directory = [ "$di" ];
      executable_file = [ "$ex" ];
      symlink = [ "$ln" ];
      broken_symlink = [ "$or" ];
      missing_symlink_target = [ "$mi" ];
      fifo = [ "$pi" ];
      socket = [ "$so" ];
      character_device = [ "$cd" ];
      block_device = [ "$bd" ];
      normal_text = [ "$no" ];
      sticky = [ "$st" ];
      other_writable = [ "$ow" ];
      sticky_other_writable = [ "$tw" ];
    };

    text = {
      readme = [ "README.md" ];
      todo = [
        "TODO"
        "TODO.md"
        "TODO.txt"
      ];
      licenses = [ "LICENSE" ];
      configuration = [
        ".conf"
        ".json"
        ".yml"
        ".toml"
      ];
      bibtex = [ ".bib" ];
      other = [ ".txt" ];
    };

    markup = {
      web = [ ".html" ];
      other = [
        ".md"
        ".Rmd"
        ".xml"
      ];
    };

    programming = {
      source = {
        css = [ ".css" ];
        go = [ ".go" ];
        ipython = [ ".ipynb" ];
        javascript = [ ".js" ];
        # latex = {
        #   regular = [ ".tex" ];
        #   class = [ ".cls" ];
        #   package = [ ".sty" ];
        #   special = [ "main.tex" ];
        # };
        ocaml = [ ".ml" ];
        python = [ ".py" ];
        r = [ ".r" ];
        rust = [ ".rs" ];
        shell = [
          ".sh"
          ".bash"
          ".zsh"
          ".fish"
        ];
        viml = [
          ".vim"
          ".snippets"
        ];
      };
      tooling = {
        git = [
          ".gitignore"
          ".gitmodules"
          ".gitattributes"
          ".gitconfig"
        ];
        build = [
          ".cmake"
          "Makefile"
          ".make"
        ];
        packaging = [
          "MANIFEST.in"
          "setup.py"
        ];
      };
    };

    media = {
      image = [
        ".eps"
        ".gif"
        ".jpeg"
        ".jpg"
        ".png"
        ".svg"
      ];
      audio = [
        ".flac"
        ".mp3"
        ".ogg"
        ".wav"
      ];
      video = [
        ".mkv"
        ".mp4"
        ".mov"
        ".avi"
      ];
    };

    office = {
      document = [ ".pdf" ];
    };

    archives = {
      images = [
        ".dmg"
        ".img"
        ".iso"
      ];
      other = [
        ".gz"
        ".pkg"
        ".tar"
        ".zip"
      ];
    };

    unimportant = {
      editor = [ ".lvimrc" ];
      dropbox = [ ".dropbox" ];
      build_artifacts = {
        latex = [
          ".aux"
          ".bbl"
          ".bcf"
          ".blg"
          ".loe"
          ".log"
          ".out"
          ".run.xml"
          ".synctex(busy)"
          ".synctex.gz"
          ".toc"
        ];
      };
    };

    fzf-grayed-out-dir = [ ".fgod" ];
  };
}
