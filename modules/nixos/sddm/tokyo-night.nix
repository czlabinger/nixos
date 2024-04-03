{pkgs}:
pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "siddrs";
    repo = "tokyo-night-sddm";
    rev = "320c8e74ade1e94f640708eee0b9a75a395697c6";
    hash = "sha256-JRVVzyefqR2L3UrEK2iWyhUKfPMUNUnfRZmwdz05wL0=";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
  '';
}
