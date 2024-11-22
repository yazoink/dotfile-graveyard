{pkgs, ...}:
  let
    link = "https://github.com/Fausto-Korpsvart/Everforest-GTK-Theme/archive/refs/heads/master.zip";
  in
pkgs.stdenv.mkDerivation {
  name = "everforest-icons";

  src = pkgs.fetchurl {
    url = link;
    sha256 = "sha256-7X8Bs8eI8rZ80Gfxk7NQJWperDic3E5GRv7DEKSK5DY=";
  };

  dontUnpack = true;

  installPhase = ''
    mkdir -p tmp
    mkdir -p $out/
    ${pkgs.unzip}/bin/unzip $src -d tmp
    mv tmp/Everforest-GTK-Theme-master/icons/Everforest-Dark/ $out/
    rm -rf tmp
  '';
}
  
