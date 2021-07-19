let
  colors = import ./palette.nix;
  onehundredtwenty-percent-bright-black = "#6c7897";
  onehundredtwentyfive-percent-black = "#212121";
  firefox-private-urlbar = "#25003e";
in
{
  tabs = {
    unfocused = {
      bg = colors.normal.black;
      fg = colors.normal.white;
    };
    focused = {
      bg = colors.normal.white;
      fg = colors.normal.black;
    };
    indicator.error = colors.normal.red;
    indicator.start = colors.normal.blue;
    indicator.stop = colors.normal.green;
  };

  hints = {
    bg = colors.bright.black;
    fg = colors.normal.white;
    match.fg = colors.normal.yellow;
  };

  completion = {
    fg = colors.normal.white;
    odd.bg = onehundredtwenty-percent-bright-black;
    even.bg = colors.bright.black;
    header.bg = colors.normal.black;
    urls.fg = colors.normal.blue;
    match.fg = colors.normal.red;
    selected = {
      fg = colors.normal.black;
      bg = colors.normal.blue;
      match.fg = colors.normal.red;
    };
  };

  statusbar = {
    bg = colors.bright.black;
    fg = colors.normal.white;
    private.bg = firefox-private-urlbar;
    private.fg = colors.normal.white;
  };

  messages = {
    error = {
      bg = colors.bright.black;
      fg = colors.normal.white;
    };
  };

  dmenu = {
    normal.fg = colors.normal.white;
    normal.bg = colors.normal.black;
    prompt.fg = colors.normal.blue;
    prompt.bg = colors.normal.black;
    selected.fg = colors.normal.white;
    selected.bg = onehundredtwentyfive-percent-black;
    highlight.fg = colors.normal.yellow;
  };
}
