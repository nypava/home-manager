{config, lib, pkgs, ...}: 
  let 
  fileDir = "/home/marble/.config/home-manager/assets";
  toSymlink = filepath: config.lib.file.mkOutOfStoreSymlink "${fileDir}${toString filepath}";
  in {
  home.file = {
    ".config/wallpaper".source = toSymlink /wallpaper;
    ".icons/default".source = toSymlink /icons;
  };
}
