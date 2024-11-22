{pkgs, ...}:
  let
    link = "https://github.com/talwat/everforest-cursors/releases/download/3212590527/everforest-cursors-variants.tar.bz2";
  in
pkgs.stdenv.mkDerivation {
  name = "everforest-cursors";

  src = pkgs.fetchurl {
    url = link;
    sha256 = "sha256-xXgtN9wbjbrGLUGYymMEGug9xEs9y44mq18yZVdbiuU=";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out
    ${pkgs.gnutar}/bin/tar -xpvf $src
    mv everforest* $out
  '';
}
  
