{config, lib, pkgs, ...} : 
let 
  fileDir = "/home/marble/.config/home-manager/scripts";
  toSymlink = filepath: config.lib.file.mkOutOfStoreSymlink "${fileDir}${toString filepath}";
in {
  home.file = {
   ".scripts/timer".source = toSymlink /timer;
   ".scripts/org".source = toSymlink /org;
   ".scripts/controls".source = toSymlink /controls;
   ".scripts/rofi".source = toSymlink /rofi;
  };
}
