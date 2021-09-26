{ machine }:

let
  family = "Mononoki Nerd Font";
in
rec {
  normal = {
    inherit family;
    style = "Regular";
  };

  bold = {
    inherit family;
    style = "Bold";
  };

  italic = {
    inherit family;
    style = "Italic";
  };

  bold_italic = {
    inherit family;
    style = "Bold";
  };
} // (
  if machine == "blade" then
    {
      size = 10;
    }
  else if machine == "mbair" then
    {
      size = 19;
    }
  else { }
)
