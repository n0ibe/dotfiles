{ pkgs
, hexlib
, palette
}:

let
  old-dirs-col = hexlib.toANSI palette.normal.blue;
  new-dirs-col = hexlib.toANSI "#565f89";
in
pkgs.writeShellApplication {
  name = "lf-recursive";

  runtimeInputs = with pkgs; [
    fd
    gnused
    # Contains `sort`.
    uutils-coreutils-noprefix
  ];

  text = ''
    inner_lf_recursive() {
      ${builtins.readFile ./lf-recursive.sh}
    }

    if [ $# -ne 1 ]; then
      echo "error: expected a directory path as the only argument"
      exit 1
    fi

    if [ ! -d "$1" ]; then
      echo "error: the argument is not a path to a directory"
      exit 1
    fi

    inner_lf_recursive "$1" "${old-dirs-col}" "${new-dirs-col}"
  '';
}
