
{ 
  config, 
  pkgs, 
  ... 
}:
let
  androidSdkModule = import ((builtins.fetchGit {
    url = "https://github.com/tadfisher/android-nixpkgs.git";
    ref = "stable";  # Or "stable", "beta", "preview", "canary"
  }) + "/hm-module.nix");

in
{
  imports = [ androidSdkModule ];

  android-sdk.enable = true;

  # Optional; default path is "~/.local/share/android".
  android-sdk.path = "${config.home.homeDirectory}/.android/sdk";

  android-sdk.packages = sdkPkgs: with sdkPkgs; [
    build-tools-28-0-3
    cmdline-tools-latest
    emulator
    platforms-android-28
    sources-android-28
    ndk-22-1-7171670
  ];
}
