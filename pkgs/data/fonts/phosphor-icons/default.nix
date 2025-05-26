{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
}:

stdenvNoCC.mkDerivation {
  pname = "phosphor-icons";
  version = "2.1.0";

  src = fetchFromGitHub {
    owner = "phosphor-icons";
    repo = "web";
    rev = "master";
    hash = "sha256-mHPosmdBD4ecmDUZhzPQx80z7zazmL4BiMo5K2XVXA4=";
  };

  installPhase = ''
    runHook preInstall

    install -Dm644 src/*/*.ttf -t $out/share/fonts/truetype
    install -Dm644 src/*/*.woff -t $out/share/fonts/woff
    install -Dm644 src/*/*.woff2 -t $out/share/fonts/woff2

    runHook postInstall
  '';

  meta = with lib; {
    description = "A flexible icon family for interfaces, diagrams, & presentations.";
    homepage = "https://phosphoricons.com/";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
